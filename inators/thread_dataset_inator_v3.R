#   thread_dataset_inator_v3
#
#   REFACTORED VERSION -- major changes from v1:
#     1.  The two inner loops (emotion variables, content-analysis terms)
#         are now FUNCTIONS.  Functions are defined once at the top (section 1.5),
#         then called inside the main loop.  This makes the main loop shorter,
#         easier to read, and easier to debug -- if an emotion or term loop
#         breaks, you only have to fix the function, not the loop body.
#
#     2.  A helper function wraps the Google Sheets token check so it only
#         fires once, and gives a cleaner error message if auth fails.
#
#     3.  The pass variable is now managed inside a wrapper that makes it
#         harder to accidentally forget to set it before a run.
#
#     4.  Inline comments explain WHAT each block does and WHY it is
#         structured this way.
#
#   NEW in v3 -- descriptive filenames:
#     5.  Each per-thread CSV is now named after three attributes of the
#         thread itself rather than just the pass number:
#
#           {sort}_{subreddit}_{date}.csv
#           e.g.  0042_AskAcademia_2024-02-22.csv
#
#         This makes the output folder human-readable at a glance and keeps
#         files sortable in collection order.  See make_file_stem() in
#         section 1.5 and the duplicate-check in section 2.3.5 for details.
#
#               Main code written by Ted Welser, 5/2/2023
#               Refactored with function-based inner loops, 2025
#               Descriptive filenames added, 2025
#
#           _.-^~~^^^`~-,_,,~''''''```~,''``~'``~,
# ______,'  -o  :.  _    .          ;     ,'`,  `.
# (      -\.._,.;;'._ ,(   }        _`_-_,,    `, `,
#  ``~~~~~~'   ((/'((((____/~~~~~~'(,(,___>      `~'
#
#                  Original additions by Ted Welser on 8/10-11/2023
#                  and Mila Gmerek during summer of 2023
#                  Revisions in fall of 2024:  Ted Welser
#                  Refactored into functions: 2025


# =============================================================================
# 1.  SETUP
# =============================================================================

# 1.1  Load packages -----------------------------------------------------------

library(googlesheets4)
library(tidyverse)
library(sentimentr)
library(janitor)
library(RedditExtractoR)

# devtools::install_version("RedditExtractoR", version = "2.1.5",
#   repos = "http://cran.us.r-project.org")


# 1.2  Prelims -----------------------------------------------------------------

rm(list = ls(all = TRUE))

#  Set your working directory here.  All per-thread CSV files land here.
#  office:
# setwd("C:/Users/welser/Desktop/r_collection/big_2026")
#  laptop:
setwd("C:/Users/welser/Desktop/desktop_1/_Rprojects/_R2026/redd_2026")


# 1.3  Google Sheets authentication -------------------------------------------
#
#  gs4_auth_wrapper() tries to authenticate with Google Sheets and stops
#  with a clear message if it fails.  Calling it here -- before any data
#  loads -- means you find out about auth problems right away instead of
#  halfway through a long run.

gs4_auth_wrapper <- function() {
  tryCatch(
    {
      gs4_token()
      message("Google Sheets auth OK.")
    },
    error = function(e) {
      stop(
        "Google Sheets authentication failed.\n",
        "Run gs4_auth() interactively, then re-source this script.\n",
        "Original error: ", conditionMessage(e)
      )
    }
  )
}

gs4_auth_wrapper()


# 1.4  Load reference tables from Google Sheets --------------------------------
#
#  Three external tables drive the run.  Keeping them in Google Sheets means
#  students can update URLs or term lists without touching this script.
#
#  earls     -- one row per Reddit thread URL to collect
#  emote_ref -- 16 emotion labels and their short variable-name equivalents
#  term_ref  -- search terms and their cleaned variable names (no spaces, no
#               forbidden punctuation) for the content-analysis indicators

read_sheet(
  "https://docs.google.com/spreadsheets/d/1faZ0-ze0LgFUfhiwPpxtJlcy6_JEHllc2wFjRkr4SUQ/edit?usp=sharing",
  col_names = TRUE
) |>
  janitor::clean_names() |>
  tibble() -> earls

read_sheet(
  "https://docs.google.com/spreadsheets/d/18EE_2cDFV8mZzntxKbGs5SrZzijVPiU_2wj7uoRkWU4/edit?usp=sharing",
  col_names = TRUE
) |>
  tibble() -> emote_ref

read_sheet(
  "https://docs.google.com/spreadsheets/d/15K8lOkQIj08nWVHwdlwZFDGjkazv1r4tZG1Tf1WAQOg/edit?usp=sharing",
  col_names = TRUE
) |>
  tibble() -> term_ref


# =============================================================================
# 1.5  DEFINE HELPER FUNCTIONS
# =============================================================================
#
#  These three functions replace the inner loops that were embedded directly
#  inside the main URL loop in v1.  Moving them here has three benefits:
#
#   a)  The main loop body (section 2) becomes much shorter and easier to read.
#   b)  Each function can be tested independently on a sample data frame before
#       a full run -- saves time debugging mid-run failures.
#   c)  If the emotion schema or the term list changes, only the function
#       needs updating, not every place the loop appeared.


# add_sentiment_vars()
#
#  Takes a data frame with a character column called `comment` and appends
#  four sentiment variables:
#    word_count   -- number of words per comment
#    sent.ave     -- average sentiment score (positive = positive tone)
#    profan_count -- count of profane words
#    profan_ave   -- average profanity rate
#
#  Returns the data frame with those four columns added.

add_sentiment_vars <- function(df) {

  #  sentimentr works on character vectors; coerce just in case
  df <- df |> mutate(comment = as.character(comment))

  com_sent <- sentiment_by(df$comment)
  df$word_count <- com_sent$word_count
  df$sent.ave   <- com_sent$ave_sentiment

  fran <- profanity_by(df$comment)
  df$profan_count <- fran$profanity_count
  df$profan_ave   <- fran$ave_profanity

  df
}


# add_emotion_vars()
#
#  Takes a data frame and the emote_ref lookup table.
#  Iterates over all 16 emotion types and appends two columns per emotion:
#    {name}_ave   -- average emotion score per comment
#    {name}_count -- count of emotion words per comment
#
#  The emote_ref table (loaded from Google Sheets) maps full emotion labels
#  (e.g. "anger") to short names used in variable names (e.g. "ang").
#  This keeps variable names short and free of spaces.
#
#  Returns the data frame with 32 emotion columns added.

add_emotion_vars <- function(df, emote_ref) {

  thelma <- emotion_by(df$comment)

  for (epass in seq_len(nrow(emote_ref))) {

    emote_now  <- emote_ref$emote[epass]
    emote_name <- emote_ref$name[epass]

    emote_now_table <- thelma |>
      filter(emotion_type == emote_now) |>
      as_tibble()

    df[[paste0(emote_name, "_ave")]]   <- as.numeric(emote_now_table$ave_emotion)
    df[[paste0(emote_name, "_count")]] <- as.numeric(emote_now_table$emotion_count)

    #  Progress indicator -- shows which emotion just finished in the console
    message("  emotion done: ", emote_name)
  }

  df
}


# add_term_vars()
#
#  Takes a data frame, the term_ref lookup table, and the name of the column
#  to search (default "comment").  For every term in term_ref it appends a
#  binary (0/1) indicator column named after term_ref$name.
#
#  Using [[paste0(term_name)]] instead of $ notation means the column name
#  comes from a variable, which is what lets us loop over hundreds of terms
#  without writing hundreds of lines of code.
#
#  The two case-sensitive indicators (AI, X/Twitter) are appended at the end
#  because they require ignore.case = FALSE, which is different from every
#  other term.  Keeping them separate makes that intention explicit.
#
#  Returns the data frame with one binary column per term plus the two
#  case-sensitive indicators.

add_term_vars <- function(df, term_ref, target_col = "comment") {

  target_var <- df[[target_col]]

  for (cpass in seq_len(nrow(term_ref))) {

    term_now  <- term_ref$term[cpass]
    term_name <- term_ref$name[cpass]

    df <- df |>
      mutate(!!term_name := as.numeric(
        ifelse(grepl(term_now, target_var, ignore.case = TRUE), 1, 0)
      ))

    message("  term done: ", term_name)
  }

  #  Case-sensitive indicators added separately because they use a different
  #  matching rule (ignore.case = FALSE) from all other terms above.
  #  "AI" in all caps and "X" as a proper noun need exact-case matching to
  #  avoid false positives from words like "Ai" or "x" as a variable name.

  df <- df |>
    mutate(
      AI = as.numeric(ifelse(grepl("AI", target_var, ignore.case = FALSE), 1, 0)),
      ex = as.numeric(ifelse(grepl("X",  target_var, ignore.case = FALSE), 1, 0))
    )

  df
}


# summarise_to_thread_level()
#
#  Takes the full comment-level data frame for one thread.
#  Returns a single-row data frame where:
#    - Columns 1-21 (thread-level metadata and the first comment) come from
#      the first row of the input, unchanged.
#    - All numeric columns after column 21 are SUMMED across all comments,
#      giving thread-level totals for sentiment, emotion, and term counts.
#
#  This replaces the manual cbind + summarise block in v1 and makes the
#  aggregation logic visible and testable in one place.

summarise_to_thread_level <- function(df, n_meta_cols = 21) {

  thread_meta <- df[1, 1:n_meta_cols]

  numeric_sums <- df[, -(1:n_meta_cols)] |>
    as.data.frame() |>
    mutate(across(everything(), as.numeric)) |>
    summarise(across(where(is.numeric), \(x) sum(x, na.rm = TRUE)))

  cbind(thread_meta, numeric_sums)
}


# make_file_stem()
#
#  Builds a descriptive, filesystem-safe filename stem for one thread.
#  The stem combines three attributes:
#
#    sort number  -- a zero-padded integer from earls$sort, guarantees
#                    uniqueness and keeps files in collection order when
#                    sorted alphabetically in the folder.
#    subreddit    -- tells you at a glance which community the thread is from.
#    date         -- the thread's post date in YYYY-MM-DD format, which is
#                    both human-readable and chronologically sortable.
#
#  Example output:  "0042_AskAcademia_2024-02-22"
#  Files written:   "0042_AskAcademia_2024-02-22.csv"   (comment level)
#                   "Sum_0042_AskAcademia_2024-02-22.csv" (running summary)
#
#  Why not just the Unix timestamp (e.g. 1708640638)?
#    - Timestamps are opaque: a folder of timestamp-named files tells you
#      nothing without looking inside each one.
#    - Two threads posted in the same second on the same subreddit would
#      produce identical timestamps and overwrite each other.
#    - The sort number already guarantees uniqueness; the subreddit and date
#      add human-readable context at no extra cost.
#
#  gsub("[^A-Za-z0-9_-]", "_", ...) strips any characters that are
#  problematic in filenames across Windows, Mac, and Linux (spaces,
#  slashes, colons, etc.) and replaces them with underscores.  This means
#  subreddit names with unusual characters will still produce safe filenames.

make_file_stem <- function(sort_num, subreddit, thread_date) {

  #  Zero-pad sort number to 4 digits so alphabetical folder sort matches
  #  collection order even when you have 1000+ threads.
  sort_padded <- sprintf("%04d", as.integer(sort_num))

  #  Sanitise subreddit name: keep only alphanumeric characters, underscores,
  #  and hyphens.  Reddit subreddit names are already alphanumeric+underscore,
  #  but this guard prevents filesystem errors if the value ever arrives with
  #  unexpected characters (e.g. leading "r/" from a copy-paste).
  sub_clean <- gsub("[^A-Za-z0-9_-]", "_", as.character(subreddit))

  #  Coerce date to character.  as.character() on a Date gives YYYY-MM-DD,
  #  which is already filesystem-safe and sorts correctly.
  date_clean <- gsub("[^0-9-]", "_", as.character(thread_date))

  paste0(sort_padded, "_", sub_clean, "_", date_clean)
}


# =============================================================================
# 2.  MAIN COLLECTION LOOP
# =============================================================================
#
#  Before starting a NEW run:   set pass <- 1  (section 2.1)
#  To RESUME after a break:     set pass <- [row number where the break occurred]
#  The outer for loop runs up to 5000 iterations but the pass counter controls
#  which row in earls is actually processed each iteration.


# 2.1  Set starting pass -------------------------------------------------------
#
#  TIME 1 (fresh run):   set this to 1
#  RESUME:               set this to the pass number that failed last time

pass <- 1


# 2.2  Google Sheet for collecting thread summaries ----------------------------
#
#  On the very first pass the script creates a new Google Sheet.
#  On all subsequent passes it appends to the sheet whose URL you paste below.
#
#  TIME 1 workflow:
#   a) Run through pass == 1 all the way to the end of the loop once.
#   b) Find the new sheet in your Google Drive.
#   c) Copy its URL and paste it as the value of ss below.
#   d) Then run all remaining passes.

ss <- "https://docs.google.com/spreadsheets/d/11o4sLs5ptteJftGVHyiP_l4FP-IwNMbuCS3PAsu3WHc/edit?usp=sharing"


# 2.3  Main URL loop -----------------------------------------------------------

for (i in 1:5000) {

  message("\n=== Pass ", pass, " | URL row: ", earls$sort[pass], " ===")

  # ------------------------------------------------------------------
  # 2.3.1  Fetch thread content from Reddit
  # ------------------------------------------------------------------
  #
  #  get_thread_content() returns a list with two data frames:
  #    $comments -- one row per comment
  #    $threads  -- one row with thread-level metadata (title, date, etc.)

  current_thread <- earls$url[pass]
  temp_list      <- get_thread_content(urls = current_thread)

  com_vars    <- temp_list$comments
  thread_vars <- temp_list$threads

  #  Attach thread-level metadata columns to every comment row so the
  #  comment-level file is self-contained (no join needed later).

  my_content <- com_vars |>
    mutate(
      t.author        = thread_vars$author,
      t.date          = thread_vars$date,
      t.title         = thread_vars$title,
      t.subreddit     = thread_vars$subreddit,
      t.upvotes       = thread_vars$upvotes,
      t.up_ratio      = thread_vars$up_ratio,
      t.total_awards  = thread_vars$total_awards_received,
      t.golds         = thread_vars$golds,
      t.cross_posts   = thread_vars$cross_posts,
      t.comments      = thread_vars$comments
    )

  #  topic is a unique label for this pass: row number + timestamp from earls.
  #  Stored in the data so every comment can be traced back to its pass.
  my_content$topic <- paste0(pass, "_", earls$timestamp[pass])

  df <- my_content

  # ------------------------------------------------------------------
  # 2.3.2  Add sentiment variables (function call replaces inline block)
  # ------------------------------------------------------------------

  message("Adding sentiment variables...")
  df <- add_sentiment_vars(df)

  # ------------------------------------------------------------------
  # 2.3.3  Add emotion variables (function call replaces inner for loop)
  # ------------------------------------------------------------------
  #
  #  In v1 this was a 20-line for loop embedded here.  Now it is one line.
  #  If the emotion loop ever needs to change, edit add_emotion_vars() above.

  message("Adding emotion variables...")
  df <- add_emotion_vars(df, emote_ref)

  # ------------------------------------------------------------------
  # 2.3.4  Add content-analysis term indicators (function replaces inner loop)
  # ------------------------------------------------------------------
  #
  #  Same logic as emotions: one function call replaces a 478-iteration loop.

  message("Adding term indicator variables...")
  df <- add_term_vars(df, term_ref, target_col = "comment")

  # ------------------------------------------------------------------
  # 2.3.5  Build descriptive filename and check for duplicates
  # ------------------------------------------------------------------
  #
  #  make_file_stem() combines the sort number, subreddit, and thread date
  #  into a single string used as the base name for all files written this
  #  pass.  See the function definition in section 1.5 for full details.
  #
  #  The duplicate check warns you if a file with that stem already exists
  #  in the working directory.  This can happen if:
  #    - The same URL appears twice in earls (data-entry error).
  #    - A run was interrupted and restarted from the same pass without
  #      clearing out the old files.
  #  The script warns and continues rather than stopping, so a long run is
  #  not aborted by a single duplicate -- but you should investigate any
  #  warnings after the run finishes.

  myrow      <- earls$sort[pass]
  file_stem  <- make_file_stem(myrow, thread_vars$subreddit, thread_vars$date)
  csv_name   <- paste0(file_stem, ".csv")
  sum_name   <- paste0("Sum_", file_stem, ".csv")

  if (file.exists(csv_name)) {
    warning(
      "Pass ", pass, ": output file '", csv_name, "' already exists and will be overwritten.\n",
      "Check earls for duplicate URLs at row ", pass, "."
    )
  }

  write_csv(df, csv_name)
  message("Comment-level CSV written: ", csv_name)

  # ------------------------------------------------------------------
  # 2.3.6  Aggregate to thread level and update the summary dataset
  # ------------------------------------------------------------------
  #
  #  summarise_to_thread_level() replaces the manual cbind + summarise
  #  block from v1.  It keeps the first 21 columns as-is (thread metadata
  #  plus the first comment) and sums all numeric columns across all comments.

  combo_this_pass <- summarise_to_thread_level(df, n_meta_cols = 21)

  if (pass == 1) {
    combo_full <- combo_this_pass
  } else {
    combo_full <- rbind(combo_full, combo_this_pass)
  }

  combo_full <- data.frame(combo_full)

  #  Write the running summary CSV every pass so you have a local backup
  #  even if the Google Sheet write fails.  sum_name was built above in 2.3.5.
  write_csv(combo_full, sum_name)
  write_csv(earls, "edu_ears.csv")

  # ------------------------------------------------------------------
  # 2.3.7  Create or update the Google Sheet
  # ------------------------------------------------------------------
  #
  #  Pass 1 only: create a new sheet seeded with the first thread row.
  #  All subsequent passes: append the new row to sheet 1.
  #
  #  TIME 1 note: after pass 1 completes, find the new sheet in Drive,
  #  copy its URL, and paste it as the value of ss above (section 2.2).

  if (pass == 1) {
    gs4_create("edu_treds_2026", sheets = combo_full)
    message("Google Sheet created.  Find its URL in Drive and paste it into ss above.")
  }

  if (pass > 1) {
    sheet_append(ss, combo_this_pass, sheet = 1)
  }

  # ------------------------------------------------------------------
  # 2.3.8  Increment pass and pause before next request
  # ------------------------------------------------------------------
  #
  #  Sys.sleep(39) keeps the request rate well below the Reddit API limit.
  #  Reducing this risks throttling or a temporary ban on the IP.

  message("Pass ", pass, " complete.  Sleeping 39 seconds...")
  Sys.sleep(39)
  pass <- pass + 1
}

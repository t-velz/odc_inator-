# Composed and uploaded by Quang APL  ####
# Let's say you have some docx or pdf text files stored on your hard drive, 
# which you want to load into R for content analysis. 

# Note from Ted:   "Hey Quang, check out our Github file on formatting code 
# to make it more readable.   I have started to implement two of the ideas. 
# First, limit the width of each row for ease of reading-- about this wide.
# Second, use the outline capacity built into RStudio. See instructions.

# Here are the instructions:

## LOADING a text file (.docx) into R:   ####

# 1.Install and load the necessary packages:
install.packages("readtext")
install.packages("tidytext")
library(readtext)
library(tidytext)

# 2.Read the DOCX file into R:
text_data <- readtext("path/to/your/file.docx")
# Replace "path/to/your/file.docx" with the actual file path and name.

## 3.Convert the text data into a tidy format:     ####
tidy_data <- text_data %>%
unnest_tokens(output = "word", input = text)
#This step uses the unnest_tokens() function from the tidytext package to tokenize the text into individual words, creating a tidy data frame with columns for document ID (doc_id) and words (word).

#4.Perform content analysis tasks on the tidy data: You can now use various functions from the tidytext and dplyr packages to conduct content analysis tasks. Here are some examples:
  
#Word frequency analysis:
word_frequency <- tidy_data %>%
 count(word, sort = TRUE)

#Sentiment analysis:
  
library(textdata)
sentiment <- tidy_data %>%
  inner_join(get_sentiments("afinn"), by = "word")

#This step performs sentiment analysis by joining the words in the tidy data with sentiment scores from the AFINN lexicon.
#These are just a few examples of the content analysis tasks you can perform in R. Depending on your specific research questions and goals, you can explore more advanced techniques and packages.
#Note: Make sure to install and load the necessary packages (readtext, tidytext, textdata, etc.) before running the code. Also, ensure that the file path is correctly specified when reading the DOCX file.

##_____________________________ End of Section_____________________________________________________

## LOADING a Text File (.pdf) into R 

# 1.Install the required packages (if not already installed):
install.packages("pdftools")
install.packages("tidytext")

# 2.Load the necessary libraries:
library(pdftools)
library(tidytext)

# 3.Use the pdf_text() function from the pdftools package to extract the text content from the PDF file:
pdf_content <- pdf_text("path/to/your/file.pdf")
# Replace "path/to/your/file.pdf" with the actual file path of your PDF document.

# 4.Create a data frame with the text content:
pdf_df <- data.frame(text = pdf_content)

#Now you can use functions to tidy the text, for instance using the unnest_tokens() function from the tidytext package:
tidy_pdf <- pdf_df %>%
  unnest_tokens(word, text)  unnest_tokens(word, text)

#Now, the tidy_pdf data frame contains the tidied text from the PDF document, with each word in a separate row.
#Make sure to adjust the file path and file name to match your specific PDF file.


#   thread_dataset_inator*2


#  This syntax combines the comment_inator, sentiment_inator, and content_inator
#    To generate a bunch of thread level datasets as well as 
#    a summary dataset where each row is a thread
#    This assumes that you have already prepared two different tables,
#    Stored as google sheets. 



#'  ####################  thread_dataset_inator.R ################################
#'  
#⡹⢌⠳⡘⢦⡙⢆⠳⣌⠳⡘⡜⢢⠝⣢⠓⡬⢓⡌⢳⡘⢦⡙⢆⠳⣌⠳⡘⡜⢢⠝⢢⠓⡬⢓⡌⢳⡘⢦⡙⢆⠳⣌⠳⡘⡜⢢⠝⢢⠓⡬⢓⡌⢳⡘⠦⡙⢆⠳⡌⠳⣌⠳⡘⡜⢢⢃⠳⣌⠳⡘⡜⢢⠝⡰⢃⠮⡑⢎⡜⠦⡙⢆⠳⣌⠳⣌⠳⡘⢦⡙⢆⠳⣌⠳⡘⡜⢢⠝⣢⠓⡬
#⡱⢋⠵⡉⢦⠙⡌⡓⡌⢣⡑⢎⡱⢊⠴⣉⠖⡡⢎⡱⡘⠆⡍⢎⡱⢌⢣⡑⢎⡱⢊⠥⣋⠔⡣⢜⡡⢚⠤⡙⡌⢓⡌⡱⠱⢌⠣⠎⠥⢋⡔⢣⡘⠅⢎⠱⡉⢎⠱⢌⠓⠤⢣⠱⢌⢃⠎⡱⢌⠣⡱⢌⠣⢎⠱⣉⠖⣩⠒⣌⢣⡙⡌⡓⠬⡱⣈⢇⡙⢢⢍⢪⠱⢌⢣⡑⢎⡱⢊⠴⣉⠖
#⢣⢋⠖⣉⠦⡙⡰⢱⡈⢇⡜⠢⣅⢋⠴⡨⠜⡡⢆⡱⢌⢓⡘⢆⡱⢊⠴⡘⢢⢅⠫⡔⢌⠎⣑⠢⢅⠣⠚⢤⠉⡆⢒⠡⡃⢎⠱⣈⢃⠎⡰⢡⠘⡘⢌⠢⠱⡈⠖⣈⠎⡑⠦⡑⢊⠌⡒⣡⠊⡔⣡⠊⢆⡉⠦⣁⠚⢤⠩⠔⡢⢱⠨⣑⠣⢱⡐⣊⠬⡡⢎⠢⡍⢆⠣⠜⡢⢅⡋⠴⡨⠜
#⡣⣍⢚⡰⢢⠱⣡⢃⡜⢢⠜⣡⠒⣌⠲⢡⡙⡔⢃⠲⡌⠦⣉⠖⡰⣉⠦⡙⢢⠜⡒⢌⡊⢜⡠⢍⠢⣉⠱⢂⠍⡰⢉⠆⡱⢈⠒⡄⢊⠔⡡⢂⠍⡔⢊⠔⡡⠑⡌⠰⡈⠔⡡⠘⡄⢃⠒⡄⢣⠐⢢⠉⢆⡘⠔⡡⠚⡄⣃⠣⡑⣂⠓⠤⡙⢢⠜⣠⠣⣑⠊⡕⡸⢨⠱⣉⢆⠣⡜⣡⠱⣉
#⡵⡘⠦⣑⢊⡱⡐⢎⡰⢃⠎⡔⡩⢔⡩⢆⡱⢌⡃⢧⠘⡥⠢⢍⡒⠔⣢⠱⡁⠎⡔⡡⡘⢄⡒⢌⠢⣁⠎⡄⢃⠆⡡⢊⠔⡡⢊⠔⡡⠊⡔⠡⢊⠄⠣⡘⠄⠣⠌⡑⢌⠢⣁⠣⠘⡄⢣⠘⠤⡉⢆⡉⢆⡘⠤⣁⠣⠔⢢⠑⡌⠤⡙⢄⠣⣡⠊⣄⠓⠤⢋⠴⢡⢃⠣⡜⣠⠓⠴⣁⠞⡠
#⢧⢩⠓⡌⠦⡑⡜⢢⡑⠎⡜⡰⣑⢊⡔⢢⡑⠦⣉⠦⠩⡔⣉⠦⢌⠱⡀⠇⣌⠱⢠⠑⡌⢢⠘⡄⢣⠐⡌⠰⣁⠊⠔⡡⢘⠠⣁⠒⡠⢑⠠⠃⢌⠰⠁⡔⠨⢁⠆⣁⠂⠆⡐⠨⡁⠔⢂⠡⢂⡑⠄⡒⠤⠘⡐⠄⢣⠘⡄⢣⠘⠤⡑⢌⠒⡄⢣⡐⠩⠜⡂⢎⢢⠉⡖⢡⠆⡙⠦⡡⢎⠱
#⢎⡥⢋⡔⢣⠱⡌⠥⢚⡘⠴⡑⣂⠧⣈⠇⡜⢢⠡⢎⠱⡐⠢⠜⡠⢃⠜⡐⢢⠑⢢⠑⢌⠂⠥⡘⢠⠡⠌⢡⠀⠎⡐⡁⠆⡡⠄⢂⡁⠆⢂⠉⡄⣂⣥⣶⣷⣦⣬⣤⣘⠠⠌⢡⠐⡈⢂⠡⠂⡄⠣⢐⠂⡑⡈⠜⢠⠡⡘⣀⠃⢆⠱⢈⠒⡌⠢⢌⠱⡘⢄⠃⠦⣉⠔⠣⢌⡱⢊⠱⢌⠣
#⢎⠴⣃⠜⣂⠧⡘⠥⢣⠜⣡⠚⢤⠒⡡⢎⠰⣁⠣⠌⢆⡡⢍⠢⡑⢌⠢⡉⠔⡈⢆⡘⠠⡉⠔⡈⠆⢂⡉⠤⠘⠠⢁⠔⠡⠐⡈⠄⡐⠈⠄⢂⠄⡉⠛⠛⠯⣟⣿⣽⣻⢿⣶⣄⢂⠐⡀⢂⠡⠄⢃⠂⢡⠐⡐⢈⠂⠆⡑⢠⠊⠰⢈⠂⡅⢢⠑⡌⢢⠑⡌⡘⠰⢄⢊⡑⢆⠢⢍⡘⡂⢇
#⣎⠳⡌⡜⡰⢢⠙⡬⢡⠚⢤⡉⠦⣉⠴⣈⠱⡀⢇⠚⡄⠒⡌⠰⡁⠆⡱⠈⢆⠡⠂⢄⠃⠄⢃⠰⠈⡄⠐⡠⠁⠌⠠⠈⠄⠡⠐⠠⢀⠡⠈⠄⠂⠄⠡⢈⠐⠈⠙⠾⣽⣯⣟⡿⣷⡄⡐⢀⠂⠌⠠⠈⠄⠂⠄⠡⢈⠐⡈⠄⠌⣁⠂⡡⠐⢡⠈⡔⢂⠡⢂⠅⠣⢌⠢⡘⢄⠃⡆⠱⣈⠆
#⡎⡕⢎⠴⢡⠣⢍⡒⡡⢍⠢⠜⣐⠢⠒⡄⢣⠘⡄⠣⢌⡑⠨⡁⠔⠡⠄⡉⢄⠂⡉⠄⠨⠐⡈⠄⠡⢀⠡⢀⠡⠈⠄⠡⠈⠄⢁⠂⠄⠂⢁⣌⣤⣌⣤⣀⣈⣐⠈⠀⠙⢷⣯⢿⡽⣿⡄⠠⠈⡀⣡⣨⣤⣥⡌⠐⡀⢂⠐⡈⠐⡀⢂⠡⠘⠠⣁⠰⢈⠰⠁⡌⡑⢂⠱⡈⢆⠱⣈⠱⢠⢊
#⡕⢮⡑⢎⡡⢚⠤⠱⡘⠤⣉⠖⢡⢊⠱⡈⢆⠱⡈⢅⠢⠌⢡⠐⡉⠰⠈⠔⠂⠌⡐⢈⠁⢂⠐⡈⠐⡀⠂⠄⠐⠈⡀⠂⠁⡈⠀⠠⠀⣢⣿⣿⣻⣟⣿⣻⣟⡿⣿⣿⣶⣌⣿⣯⢿⡽⣇⣤⣷⣿⣟⣿⡿⠟⠛⢀⠐⠀⠂⠄⠡⠐⡀⢂⠁⢂⠄⢂⠌⠠⢃⠐⠄⢃⠢⢁⠎⠰⣀⠃⠆⡌
#⡚⡤⢓⡌⢒⠥⢊⡱⢘⡐⢢⠘⡄⢊⠔⡡⠌⡂⢌⢂⠒⠨⠄⠒⡈⠡⠘⠠⢁⠂⡐⠠⠈⠄⠂⠠⠁⢀⠂⠈⢀⠐⠀⠠⠁⠀⠀⣀⣿⣿⣻⣞⣷⣻⢞⡷⣯⣟⡷⣽⣞⣿⣻⢯⡿⣽⢿⣻⣽⣾⠛⣁⡀⠀⠀⠂⠈⢀⠁⠌⠐⢀⠐⠠⠈⠄⡈⠄⠌⢂⠐⡈⠌⢂⠡⢊⠰⡁⢂⠍⠒⡌
#⡵⢡⠣⢜⡈⢆⠣⠰⢡⠘⡄⢣⠘⡄⢊⠔⡠⢁⠎⣀⠊⠡⠈⠔⠠⠁⠌⡁⢂⠐⠀⡁⠐⠀⠌⠀⠐⠀⠀⠠⠀⠀⠐⠀⠀⠀⣰⣿⣟⡾⠷⠛⠚⣉⣩⣭⣭⡿⣿⢿⣿⡾⣽⢯⣿⣽⣯⢷⣯⣟⡿⣿⢷⣾⣦⣆⠁⠀⠠⠀⠈⡀⠄⠂⢁⠐⠠⢈⠐⡀⢂⠐⡈⠤⢁⠢⢁⡘⠄⢊⠡⡐
#⡎⢥⢋⡔⢌⠢⣉⡑⢢⠑⡌⢂⠥⠘⣀⠒⠠⡁⢂⠄⠌⠡⠈⠄⠡⢈⠐⠠⠀⠂⠁⠀⠄⠁⠀⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⡟⠋⠁⢠⣴⣾⡿⣟⡿⣽⢯⡿⣽⣻⡾⠽⠿⣟⣾⢯⣿⢿⡺⢽⣻⡽⣯⣟⣯⡟⠀⠀⠀⠀⠁⠀⠀⠐⠀⠠⠁⢀⠂⠐⡀⢂⠐⡀⠂⠤⢁⠐⡈⢂⠅⢂
#⡙⢆⢣⠘⡄⢣⠐⡌⢢⠑⡈⠆⢌⠡⠄⢊⠡⠐⠂⠌⠠⠁⠌⠠⢁⠀⠂⠁⠐⠀⠁⢀⠠⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⠀⢸⣿⣷⣻⣽⣻⡽⠛⠋⡵⠃⠀⠀⠀⠈⠻⣟⣾⣻⢿⣦⠈⠻⣷⣻⢾⠁⠀⠀⠀⠀⠀⠂⠈⠀⠠⠀⠂⠀⠄⠁⡀⢂⠐⠠⢁⠂⠌⠠⠁⡌⠐⡂
#⡹⠌⢆⠣⡘⢄⠣⡘⠄⡃⠜⡈⠔⠂⠌⠂⡄⢃⠡⠈⠄⠡⠈⠄⠀⠂⠁⠠⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣾⠗⠋⠁⠀⣠⠞⠀⠀⠀⠀⠀⠀⠀⡜⣿⡽⣯⣟⣧⠀⠈⢿⣟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠈⠀⠐⠀⡀⠂⠁⠄⡈⠄⠡⠈⠄⡑⠠
#⠥⣋⠆⡱⢈⠆⡱⢀⠣⠘⡠⢁⠎⡈⠔⠡⠐⡀⢂⠡⠈⠄⠁⠠⠈⠀⠐⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⡿⠋⠀⠀⠀⠀⡴⠃⠀⠀⠀⠀⠀⠀⠀⢠⡇⢸⣿⣳⢯⣿⡇⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠈⠀⡀⠄⠠⠁⠂⠐⡈⠄⡁⠂⢄⠡
#⡓⡔⡊⠔⡡⢊⠤⢁⠊⢅⡐⢂⠰⠀⡌⠠⢁⠐⡀⠂⢈⠀⠌⠀⠀⠂⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣞⣁⣀⡀⠀⠀⠀⠀⠀⠀⢸⠃⠀⠛⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⢀⠠⠀⢁⠂⠐⠠⢀⠁⢂⠐
#⡱⢌⡱⢈⠔⣁⠢⢁⠎⢠⠐⡈⠄⠡⢀⠁⠂⠄⠐⠈⡀⠠⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⣿⣿⠟⠛⠁⠀⠀⠀⠈⠀⠀⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠠⠀⠠⠈⠐⠠⠈⠄⡈
#⡑⠎⡄⠣⢌⡐⠄⠃⡌⠄⢢⠁⠌⡐⠠⢈⠐⠈⡀⠁⢀⠀⠠⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣿⣿⠟⢁⡀⠀⠀⠀⠀⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠈⠀⠀⠄⠁⡈⠄⢈⠐⡀
#⡅⡓⢌⠡⢂⠔⣈⠡⠐⠌⠂⠌⡐⠠⠁⠄⠂⠁⡀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣼⣿⠟⠉⠉⠉⠓⠣⣦⡀⠀⠀⠀⠀⢸⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠐⠀⡀⠂⠠⠐
#⠆⣍⠢⡑⠌⡰⠀⠜⡈⡐⢉⠐⠠⠁⠌⢀⠂⠁⠀⠐⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣴⣿⣶⣶⣦⣤⣀⠘⣧⣠⣿⠟⠁⠀⠀⠀⣠⣄⡀⠈⣷⡀⠀⠀⠀⣾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠂⠁⢀⠐⠀⠡⠀
#⡍⠤⢃⠔⡡⠄⣉⠐⠤⠐⠂⠌⠠⢁⠂⠠⠀⠌⠀⠠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠋⢙⣿⠛⠉⠉⢙⣿⣿⣿⡿⠋⠀⠀⠀⢀⣾⣽⣿⣿⣷⡜⡇⠀⠀⠀⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⡀⠄⠈⡀⠁
#⡌⠓⡌⢂⠔⡈⠄⢌⠠⠑⡈⠄⡁⠂⠠⠁⠠⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡟⠀⠀⠀⠀⣾⣿⣿⣿⠀⠀⠀⠀⠀⠈⠻⣿⣟⣾⠟⢱⣏⠀⠀⢸⠃⣠⠴⠒⠓⠒⢤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⠀⠂⢀⠁
#⡌⢣⠘⡄⠢⢁⠌⠤⠘⡐⠀⠆⠠⠁⠂⠄⠁⡀⠠⠀⠁⠀⠀⠂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⡡⠀⠀⠀⠀⠈⠛⠻⣯⠀⠀⠀⠀⠀⠀⠀⠀⠉⠀⠀⣼⠏⠀⠀⣼⠞⠁⠀⠀⠀⠀⠀⢧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⡀⠁⠐⠀⠂
#⡌⠥⠒⡄⢃⠌⡐⢂⠡⠄⠃⠌⠠⠁⠂⠐⡀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠷⣄⣀⠀⣀⣀⣰⠴⠿⣄⠀⠀⠀⠀⠀⠀⠀⠀⣀⡞⠃⠀⠀⠀⠋⠀⠀⠀⠀⠀⠀⠀⣸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⠀⠐⠈⢀⠁
#⡌⢣⠑⡰⢈⠰⠐⠠⠂⠌⡐⠈⠄⠡⠈⡀⠄⠐⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⣹⠋⠀⠈⡠⠂⠙⠧⣆⣀⣀⣀⣠⡤⠾⣉⡠⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡴⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠁⠠⠈⠀⠄
#⡌⢣⠘⡄⠡⢂⠉⡄⢃⠰⢀⠡⠈⠄⢁⠠⠀⠂⠀⠄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⡤⠤⠶⠖⠦⠳⠒⠒⠊⠀⠀⠀⠀⠀⠀⠀⣠⡴⠖⠋⠁⢠⣿⠀⠀⠈⡗⠦⠤⡤⠤⠖⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠈⠀⠄⠂⠁⠄
#⡌⠥⢊⠄⡃⢌⠰⠠⠌⡐⠠⢂⠡⢈⠀⠄⠂⢀⠁⠀⠠⠀⠀⡀⠀⠀⠀⠀⠀⠀⣀⡴⠖⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⢻⠉⠀⠀⠀⠀⣼⣿⡇⠀⠀⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠀⠄⠀⠂⠁⠄
#⡌⢣⠌⡂⢅⠂⠆⣁⠒⡈⠰⢀⠂⠄⡈⠄⠂⡀⠄⠐⠀⠀⠀⠀⠀⠀⠀⠀⣠⠞⠋⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⠤⠔⠒⠋⠁⠀⣠⠖⠉⠀⡜⠀⠀⠀⠀⢠⣿⣿⠅⠀⠀⢸⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⠀⢀⠂⠀⠌⢀⠁⠂
#⣌⢃⠆⡱⠈⡌⠰⢀⢂⠡⠒⠠⢈⠐⠠⠐⡀⠄⢀⠂⠀⠈⠀⠀⠀⡀⣠⡟⠁⠀⠀⠀⣀⣠⡤⠶⠒⠋⢉⡏⠀⠀⠀⠀⢀⡠⠞⠁⠀⠀⠀⠇⠀⠀⠀⢀⣼⣿⣿⠀⠀⠀⠘⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠄⢀⠠⠈⠀⠄⡈⠐
#⠆⣍⠢⣁⠣⢘⡀⢃⠄⠢⢑⠈⡄⠈⠄⠡⢀⠂⠠⢀⠈⠀⠐⠀⢀⣼⣫⣤⠴⠖⠛⠋⠉⠀⠀⠀⠀⠀⢼⣃⣠⡤⠴⢾⠉⠀⠀⠀⠀⣀⣠⡤⠴⠒⠋⠉⢻⣿⠃⠀⠀⠀⠀⠙⢤⣄⣀⣀⣀⣀⣀⣴⣿⣿⣿⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠀⢀⠀⠂⠀⠄⡁⠂⠄⡁
#⡍⢢⠑⡄⢃⠆⢌⠂⡌⡁⠆⢌⠠⠁⠌⡐⢀⠂⡁⠠⠐⠈⢀⠀⠂⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣠⢤⠶⠚⠋⠉⠀⠀⠀⠀⠀⢀⡴⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⣿⣿⣿⣯⠉⠻⡒⠲⠤⣀⡀⠀⠀⠀⠀⠀⠠⠐⠀⠀⠄⠀⠂⠁⠄⡐⢈⠐⡀
#⡜⡡⢎⠰⡁⢎⠠⢃⠰⢈⠔⠂⡌⢈⠔⡀⢂⠐⠠⢁⠐⠈⢀⠠⠀⢀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠉⠁⠀⠊⠀⠀⠀⠀⠀⠀⣀⡤⠖⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⡄⠀⠈⠢⡀⠀⠉⠓⠦⣄⡀⠄⠀⠀⠐⠀⠄⢈⠠⠁⢂⠐⡀⢂⠐
#⠖⡱⢌⠢⡑⢌⠢⡁⠎⡰⢈⠒⠠⡁⢂⠐⠠⢈⠐⡀⢂⠡⠀⠠⠐⠀⢀⠀⢀⠠⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⡿⠤⠤⠤⠤⠤⠤⠔⠒⠒⠊⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣄⣠⣀⣼⣿⣿⣿⣿⣿⡄⠀⠀⠑⡄⠀⠀⠀⠈⠙⢦⣄⠁⠠⠈⢀⠂⠐⡈⠄⢂⠐⠠⠌
#⢏⡔⡃⢆⠱⡈⢆⠱⡈⠔⣂⠩⠐⡄⠡⢈⢂⠁⡂⢐⠀⠂⠌⡀⠐⠈⡀⠠⠀⠀⠀⡀⠀⠀⠀⢾⡛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣤⠤⠴⠖⠚⠉⠉⠉⠉⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣷⠀⠀⠀⠈⢄⠀⠀⠀⠀⠀⠈⠳⣄⠈⡀⠌⠐⠠⠈⠄⠌⢂⠌
#⢎⠴⡉⢆⡱⢈⠆⡱⢈⠒⠤⣁⠣⢀⢃⠂⢌⠐⡈⠤⢈⠐⠠⢀⠁⠂⠄⡐⠀⢁⠀⡀⠄⠁⠀⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣠⠴⠖⠛⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡞⠉⠛⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠈⣆⠀⠀⠀⠀⠀⠀⠙⢦⡐⡈⠄⡁⢊⠰⠈⡄⢊
#⢎⠲⣉⠆⡔⢣⠘⡄⢣⠘⡰⢀⠎⠰⡈⢌⡐⢂⠁⠆⡈⠤⢁⠂⠌⡐⠠⠐⢈⠀⠄⠀⠄⠠⠈⢠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠖⠋⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠟⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠸⡄⠀⠀⠀⠀⠀⠀⠈⢳⡐⠄⢂⡁⠢⢡⠐⡡
#⣫⢑⠦⢩⠰⣁⠎⡰⢁⠎⡰⢁⠎⣁⠒⡄⠢⢌⠘⡠⢁⠢⠄⣈⠐⠠⠁⠌⠠⠈⠄⡈⠠⠐⠀⣾⠁⠀⠀⠀⠀⠀⣀⣤⠶⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠂⠻⡄⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⣳⠀⠀⠀⠀⠀⠀⠀⠀⢻⡌⠤⠐⡡⢂⠜⠠
#⡇⢎⢣⠃⡕⢢⢊⠱⣈⢒⢡⠊⡔⢠⠃⡔⠡⢌⠂⡅⢂⠆⠒⢠⠈⢂⠅⠊⠄⡁⠂⠄⡁⠂⡁⢿⡠⠀⣀⣠⡴⠚⠉⠀⡀⢀⢀⣴⠚⠲⠤⣤⣄⣀⣀⣄⣤⣌⡀⠀⠀⠁⠀⠄⠂⢀⠂⠀⣙⣦⡀⢰⣿⣿⣿⣿⣿⣿⣿⣿⡅⠀⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⡌⢡⠐⡌⢢⠑
#⢎⠭⢢⡙⠬⡡⢎⠱⣐⠊⡤⢃⠜⡠⢃⠌⡑⠢⡑⢨⠐⡌⡘⢠⠘⠠⠌⢂⠡⡐⢁⠂⠄⠡⠐⠠⠉⠍⡉⠀⠄⡐⠠⠁⡀⣰⠟⠘⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⢳⡌⠀⠈⡀⠄⠐⢰⡚⠋⠉⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠺⠥⢄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣀⠣⡘⢄⢃
#⢎⢣⠣⢜⡡⣑⢊⠵⢠⢋⠔⡡⢎⠰⡁⢎⠰⢡⠘⡄⢣⠐⡌⠰⣈⠡⡘⢠⠡⢐⡈⠰⠈⡄⠡⢂⠉⡐⠠⢃⠐⣠⣁⣐⣞⣡⠤⠤⢧⡉⠙⢒⠲⠤⡤⣤⠀⠀⠀⢷⡈⠀⠄⡐⠀⠂⣧⠀⠀⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢹⠁⠀⠀⠀⠀⠀⢀⠀⠀⠘⣇⢆⠱⡈⢆
#⡍⡖⣩⠒⠴⠡⢎⡌⢣⠜⣨⠑⣌⢒⡉⢆⠱⢊⠔⣈⠆⡱⢈⠥⡐⢂⠅⢢⠘⡠⢐⠡⠒⢠⢁⠢⢌⣠⣿⠛⠉⠉⠉⠀⠀⠀⠀⠀⠈⠳⣌⢀⠂⡐⠠⢸⡇⠀⠀⠘⡇⠌⡐⠠⢁⠂⣿⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⢸⠀⡇⠀⠀⠀⠀⠸⠀⠀⠀⢹⡌⢆⡱⣈
#⢧⡙⡤⢋⡜⠱⡊⡔⣃⠚⡤⡙⢤⢊⠴⡉⢆⡃⢎⠰⢌⡰⢁⡒⢌⠢⡘⢄⠣⡐⢡⠂⡍⢄⢂⡶⠛⠁⠀⣿⠒⣶⠒⠒⠒⠒⣶⣆⠀⠀⠙⢦⡂⠄⠡⢘⡇⠀⠀⠀⣿⠐⠠⢁⠂⣼⠃⡇⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣯⠀⠀⠀⠀⠀⡸⠀⡇⠀⠀⠀⠀⠀⡇⠀⠀⠀⢿⠰⡐⢆
#⡣⡜⡑⢎⡰⢣⠱⡘⢤⠋⡴⢑⡊⣌⠒⣍⠢⢜⡨⢒⡌⠔⣡⠘⡄⢣⠘⡄⢣⠘⡄⢣⠐⣬⠟⠁⠀⠀⣼⠃⣾⠁⠀⠀⢠⡾⠁⡌⢷⡀⠀⠈⠳⣬⠥⠼⡇⠀⠀⠀⣿⢈⡁⠆⣸⠇⠀⣧⠀⠀⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⠀⡇⠀⡇⠀⠀⠀⠀⠀⡇⠀⠀⠀⠸⡧⡙⢤
#⡱⢜⡑⢪⠔⣡⠣⢍⢢⡙⢤⠣⢜⡠⢋⠤⢋⡒⡔⢣⡘⠜⣠⠣⡘⠤⢃⡜⢠⠃⡜⢠⠣⣏⢀⣀⠤⠾⠧⠧⠿⠤⣀⣀⣿⠄⣷⢺⠛⢳⡀⠀⠀⠙⢆⢸⠃⠀⠀⢰⡇⠢⢌⢰⡟⠀⠀⢸⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢀⠃⢠⠃⠀⠀⠀⠀⠀⣣⠀⠀⠀⠀⢳⡍⠦
#⠳⣌⠎⡥⠚⣄⠳⢌⡒⠜⡢⢍⢢⠱⣉⢌⢣⢒⡉⢖⡨⠓⡤⢃⠵⡉⠦⢌⠥⠚⣄⣣⡼⠋⠁⢳⣄⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⢤⣳⢤⣧⠀⠀⠀⠈⢻⠀⠀⠀⣿⢈⡑⢂⡾⠁⠀⠀⢸⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⢸⠀⢸⠀⠀⠀⠀⠀⠀⣹⠀⠀⠀⠀⠸⣎⠱
#⡳⢌⠞⡰⢩⢄⠳⢌⡌⢣⡑⢎⢢⠓⢬⡘⣂⠎⡜⢢⢡⢋⠴⡉⢦⠱⡉⠖⣌⢓⡼⠃⠀⠀⢀⡞⠈⢿⡓⡶⡖⠦⠤⣄⣀⠀⠀⠀⠈⠉⠳⡄⠀⠀⠀⢸⠀⠀⢸⡇⢆⡘⡾⠁⠀⠀⠀⢸⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⠀⡇⠀⡞⠀⠀⠀⠀⠀⠀⣼⠀⠀⠀⠀⠀⣿⡐
#⢇⡫⢜⠡⢎⡘⣌⠲⢌⡱⠌⣆⠣⢚⡔⢢⡑⠎⡬⣑⠢⢍⢢⡙⠤⣃⠹⢌⠢⣿⠁⠀⢀⣤⣾⠀⠀⠀⠙⠳⠇⠀⠀⠀⣿⣿⠒⢦⣀⠀⠀⠘⠀⠀⠀⠀⠀⠀⣿⠌⣂⡾⠁⠀⠀⠀⠀⢸⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⢠⠁⢰⠇⠀⠀⠀⠀⠀⠀⣿⠀⠀⠀⠀⠀⢹⡔
#⢣⡜⡌⡓⣌⠲⢌⠲⣡⠒⡍⢤⢋⡒⢬⡁⢎⡱⠒⣌⠱⣊⠒⡬⢱⢨⡑⠎⣽⡷⠀⠀⢸⡇⢾⡇⠀⠀⠀⠀⠀⠀⠀⠀⠈⠁⠀⠀⣯⣷⠀⠀⠀⠀⠀⠀⠀⢸⣇⢚⡾⠁⠀⠀⠀⠀⢀⣾⢰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⡘⠀⡞⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⢸⡎
#⠧⣜⡰⣑⠢⣃⢎⡱⢄⡋⡜⡰⢊⡜⡰⣘⠢⣅⠫⢄⠳⣈⠵⡘⢢⢅⡚⠜⡸⣇⠀⠀⠀⠻⡾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣻⠀⠀⠀⠀⠀⠀⢀⡿⢢⡟⠁⠀⠀⠀⠀⢠⣟⡇⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⢠⠃⡰⠁⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⠀⠘⡧

#'  
#'           "Behold my new evil scheme, the (thread_dataset)_inator!"
#'
#'  
#'
#'               Main code written by Ted Welser, 5/2/2023
#'               
#'           _.-^~~^^^`~-,_,,~''''''```~,''``~'``~,
#' ______,'  -o  :.  _    .          ;     ,'`,  `.
#' (      -\.._,.;;'._ ,(   }        _`_-_,,    `, `,
#'  ``~~~~~~'   ((/'((((____/~~~~~~'(,(,___>      `~' 
#'               
#'                  additions by Ted Welser on 8/10-11/2023
#'                  and Mila Gmerek during summer of 2023
#'                  
#'                  revisions in fall of 2024:  Ted Welser
#'                  used to generate dataset of 2185 threads 
#'                  from academic related subreddits

# 1. Setup ----

# *1.1 Load Packages ----

library(devtools)
library(googlesheets4)
library(tidyverse)
library(sentimentr)
library(janitor)
library(RedditExtractoR)

#'   not certain it is necessary to run the old version of reddit extractor
#'   but, to be careful I am keeping this syntax ready

# devtools::install_version("RedditExtractoR", version = "2.1.5", repos = "http://cran.us.r-project.org")

#'  -----------------------------------------------------------------------
# *1.2 prelims ----

rm(list=ls(all=TRUE)) 

#  establish connection with googlesheets
#  you need to create a sheet and write to it
#  so you need to get a login token now

gs4_token()


#   Required:   empty folder for storing thousands of datasets
#     for example:

setwd("C:/Users/welser/Desktop/desktop_1/R_projects/redd_2024_2")


#'  -----------------------------------------------------------------------
# *1.3 Get tables ----

#  Required:        list of URLS as collected using the rurl_getinator, stored as googlesheet

read_sheet(
  "https://docs.google.com/spreadsheets/d/1GLQNyex6OHK5cPK2ippAezH-c_ckg-e7W6gxP-GBrqU/edit?usp=sharing",
               col_names = TRUE) %>%
  janitor::clean_names() %>%
  tibble() -> earls

names(earls)


#'     use this reference to copy a table of emotions and
#'     shortened names for those to be used in var names

read_sheet(
  "https://docs.google.com/spreadsheets/d/18EE_2cDFV8mZzntxKbGs5SrZzijVPiU_2wj7uoRkWU4/edit?usp=sharing",
     col_names = TRUE) %>%
  tibble() -> emote_ref


#'     use this reference to copy a table of terms and
#'     cleaned names for those to be used in var names
#'      name of file:   search_term_list

read_sheet(
  "https://docs.google.com/spreadsheets/d/1jhFgaUckS-e8T-kEi1Jb2xWvc1Cxs9eImiMFtY2M4a0/edit?usp=sharing",
     col_names = TRUE) %>%
  tibble() -> term_ref
#'  -----------------------------------------------------------------------





#'  -----------------------------------------------------------------------
# 2 Run in stages, run code ----

#   this starts the main, "exterior" loop,   a loop across the list of urls
#   there are inner loops for collecting different variables from the content
#'  Url loop starts
#'     collect the content of the threads listed by URL
#'     create datasets from the list
#'     create variables for each comment from the content of comments
#'    sentiment
#'      pos / neg sentiment and word count
#'      emotions
#'      profane words
#'    terms
#'      binary indicator for each term in list
#'    generate dataset per thread, save as csv to working directory
#'      calculate sums for all numeric variables at the level of thread
#'    generate dataset of summary variables every pass
#'    generate google sheet, and write line to sheet for every thread
#'    NOTE:   set sys sleep to 30 to avoid getting throttled by API limits

#'  -----------------------------------------------------------------------
#  *2.1 time 1! ----
#  time 1!   run this and assign the value of 1 to the pass variable

pass <-   1

 #'  ----------------------------------------------------------------------- 

# time 1 !!!!  Skip this for time 1
# but start here all subsequent runs for this data run
# 5 Time 2:K start here ----

for (i in 1:400)

{

#'  -----------------------------------------------------------------------  
# *2.2 time 1  continue run of remaining code from here!! ----
  #  read and run the following in stages, reading the comments

# **2.2.1 get comments, shape dataset ----
    
current_thread <- earls$url[pass]

temp_list	<-	get_thread_content(urls=current_thread)

com_vars  <-   temp_list$comments
thread_vars <- temp_list$threads

names(com_vars)

com_vars %>%
  mutate(
    t.author = rep(thread_vars$author),
    t.date      = rep(thread_vars$date),
    t.title     = rep(thread_vars$title),
    t.subreddit = rep(thread_vars$subreddit),
    t.upvotes   = rep(thread_vars$upvotes),
    t.up_ratio   = rep(thread_vars$up_ratio),
    t.total_awards = rep(thread_vars$total_awards_received),
    t.golds = rep(thread_vars$golds),
    t.cross_posts = rep(thread_vars$cross_posts),
    t.comments = rep(thread_vars$comments)   
         )  -> my_content

#  no errors?  then run next chunk
# **2.2.2 sentiment_inator  ----

my_content %>%
  mutate(
    comment = as.character(comment)  )  -> df

#  measure sentiment from the comment


topic_1 <-  paste0(pass, "_", earls$timestamp[pass])
df$topic <- rep(topic_1)

com_sent <- sentiment_by(df$comment)

#'     these write the two newly established 
#'     variables that we want copy from
#'     from fake_s onto our full working dataset

df$word_count <- com_sent$word_count
df$sent.ave <- com_sent$ave_sentiment

###   here we repeat the process looking for profanity!


fran <- profanity_by(df$comment)

df$profan_count  <- fran$profanity_count
df$profan_ave  <- fran$ave_profanity



#'  -----------------------------------------------------------------------  
#'   generate all 16 emotion and negation of that emotion variables
#'   as counts and percentages of total words in content sample
#'   
#'   #'	count	emote	name
#'	1	anger	ang
#'	2	anger_negated	ang_n
#'	3	anticipation	ant
#'	4	anticipation_negated	ant_n
#'	5	disgust	disg
#'	6	disgust_negated	disg_n
#'	7	fear	fear
#'	8	fear_negated	fear_n
#'	9	joy	joy
#'	10	joy_negated	joy_n
#'	11	sadness	sad
#'	12	sadness_negated	sad_n
#'	13	surprise	surp
#'	14	surprise_negated	surp_n
#'	15	trust	trust
#'	16	trust_negated	trust_n


#'    In order to apply this to a different dataset
#'    replace the target variable with the correct var 
#'    for your data.frame
#'    also, replace the target name

# **2.2.3 emotion ----

t_var <- df$comment
#t_name <- "com_"

thelma <- emotion_by(t_var)

epass <- 1

for (i in 1:16)  {
 
emote_now <- emote_ref$emote[epass]
emote_name <- emote_ref$name[epass]

thelma %>%
  filter(emotion_type == emote_now) %>%
   mutate() %>%
      as_tibble  ->  emote_now_table


df[paste0(emote_name, "_ave" )] <- as.numeric(emote_now_table$ave_emotion)
df[paste0(emote_name, "_count")] <- as.numeric(emote_now_table$emotion_count)

epass <- epass + 1

print (emote_name)

}


# 3 Make CA variables ----


target_var <- df$comment

cpass <- 1

# check # of terms ----
#  reset max to = # of terms in your datasheet 

for (i in 1:66)  {
 
term_now <- term_ref$term[cpass]
term_name <- term_ref$name[cpass]


df %>%  
  mutate(makevar= 
           ifelse(grepl(term_now, 
                        target_var, ignore.case = TRUE),
                  "1", "0")) -> df


df[paste0(term_name)] <- as.numeric(df$makevar)


cpass <- cpass + 1

print (term_name)

}

# added var with case ignor.case =FALSE

df %>%  
  mutate(AI= 
           ifelse(grepl("AI", 
                        target_var, ignore.case = FALSE),
                  "1", "0")) -> df



#'   Write  the curent thread dataset as file
#'   Name the file based on the row in earls, using
#'   the variable called sort

# 4 Dataset create ----

myrow <- earls$sort[pass]
write_csv(df, paste0("000", myrow, ".csv"))

#'   this command prints the current row, and thus current file name
#'   in the console, which allows the operator to know where
#'   in the process we are

print(myrow)


#   make a new row in the thread level dataset

#    1. take first row of this object for the thread level vars  1:20
#       1a.   drop all but the first row
#     2   sum the values for numerics
#     3.   take this one row dataframe and row bind it onto the previous
#     

# drop all but columns 1-20,  then drop all but row 1
# this keeps the first comment and vars related to it

thread.columns <-   df[, 1:21] 
thread.col.row1  <- thread.columns[1,]

#   drop columns 1:20,  then summarize the remaining columns

comm.columns  <- df[, -(1:21)]
comm.columns  <-  as.data.frame(comm.columns)

#  sum values for numeric vars

#  old use of summarise is depracated--
# comm.columns %>%
#   mutate_all(as.numeric)  %>%
#      summarise(across(where(is.numeric), sum, na.rm=TRUE))   -> sumvars
# error had corrected syntax, mostly, thanks chat gpt

# *4.1 Sum messages to thread level ----

comm.columns %>%
   mutate_all(as.numeric)  %>%
      summarise(across(where(is.numeric), \(x) sum(x, na.rm = TRUE))) -> sumvars

  
combo_this_pass  <- cbind(thread.col.row1, sumvars)

#identical(names(combo_full), names(combo_this_pass))
#      ran into trouble with rbind due to ' in they'd as  var name
#       fixed it as they_d

#names(combo_full)
#names(combo_this_pass)


if (pass==1) {combo_full <- combo_this_pass}

if (pass > 1) {combo_full  <-  rbind(combo_full, combo_this_pass)}

#  time 1!   run the next 4 lines of code

# mila fixed this to check which pass we are in

# *4.1 Write CSV of thread and summed dataset ----

combo_full <- data.frame(combo_full)
write_csv(combo_full, paste0("Sum000", myrow, ".csv"))


#  *2.1 time 1! create google sheet ----

if (pass==1) {gs4_create("education_threads_2",
                         sheets = combo_full)}

# t1 run til here  ----
# *very important!* ----

#'   During the T1 run, you need to create and then refer to
#'   a new Google sheet that you just created.
#'   Find the Google sheet you just made
#    go get the URL that you just made.  paste it below in ss <-
#    then run from here down to the end
#      of the loop

#  *2.1 paste link to new google sheet to replace this one ----

ss <- "https://docs.google.com/spreadsheets/d/1jgMcSBkmzgncE8ApO0CsdfHz_uZkZ08ddZk-m3KZf9U/edit?gid=696336224#gid=696336224"

# *4.2 Update sheet, rest, increment pass  ----

if (pass>1) { sheet_append(ss, combo_this_pass, sheet = 1) }


# write_csv(combo_full, paste0("A000", myrow, ".csv"))   old

# run the remainder

print (pass)

Sys.sleep(30)   

pass <-  pass +1

}

            
#'  ####################  rurl_get_inator.R ################################
# Artwork  ####  
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
#'           "Behold my new evil scheme, the (rurl_by_sub_get)_inator!"
#'
#'  
#'
#'             Spring 2023    basic code written by Ted Welser, 
#'                            refined by Morgan Thurston
#'             July 28, 2023  revised to allow iterating 
#'                            across a list of subreddits
#'                            while keeping the search term constant
#'               
#'           _.-^~~^^^`~-,_,,~''''''```~,''``~'``~,
#' ______,'  -o  :.  _    .          ;     ,'`,  `.
#' (      -\.._,.;;'._ ,(   }        _`_-_,,    `, `,
#'  ``~~~~~~'   ((/'((((____/~~~~~~'(,(,___>      `~' 
#'               

#   Prep  ####
#  Clear objects from the workspace and remove objects from memory

rm(list=ls(all=TRUE))    



#  Load Packages:
library(googlesheets4)
library(RedditExtractoR)
library(tidyverse)
library(sentimentr)


#
##  Creating your Sheet ########################################################
#

#  Set up your Google Sheet like this:

#  Column name in 
#       A1:  id_number   B1:  sub
#       A2:  sub001      B2:  politics                       
#       A3:  sub002      B3:  climateskepticsrdumb           
#       A4:  sub003      B4:  etc                 
#       ...                           
#  For  A'n': "term'n-1'               

#  Column name in B1: sub reddit name  (spell and cap correctly)
#      In B2 list your first subreddit
#      In B3 list your second subreddit
#      Continue this for every subreddit you have
#      Make sure that every value in "sub" has a corresponding "id_number"


# ____________________________End of Section____________________________________

#
##  Import your Sheet ##########################################################
#

#  Paste your Spreadsheet ID,
#  (string of letters and numbers found in between "/d/" and "/edit#gid=0")
#                                     |
#                             Here    V

#  For this to work properly edit the sharing settings of your sheet, 
#  so that anyone with the link may edit

#  Load your Google Sheet:


spreadsheet_id <- "1WFLRQ10b_64c8mrN2WrbzKD2Yy4nbCFi3FRLJRHuEtQ"

rsub <- read_sheet(paste0("https://docs.google.com/spreadsheets/d/",
                            spreadsheet_id, "/edit#gid=0"), col_names = TRUE)   


#_____________________________End of Section____________________________________


#
#  climate threads ###################################################
#


#  "pass <- 1" tells R which row in the table to find the current URL 
#  Make the first pass which establishes the dataset: 

pass <- 1   

#  Assign the name of a term (specified by the pass index value),
#  to the variable: current_rsub:

current_rsub <- rsub$sub[pass]   


#  This next function returns a list of URLs 

#  You may change "the sort_by" function from "top" to 
#  "relevance", "comments", "new", or "hot"
#  This will change the way function sorts results

#  You may change "subreddit" to the name of a specific subreddit,
#  if you wish to look at one in particular 

#  You may change "period" to shorten or lengthen the time frame
#  Your other options are: "hour", "day", "week", "year", and "all"

#  If you make any changes to the find_thread_urls function,
#  make sure to change it in the loop as well

# Search for threads on Reddit"

threads <- find_thread_urls(keywords = "climate", 
                            sort_by = "top",
                            subreddit = current_rsub ,  
                            period = "year"
)

#  Create a column which records the search term that used to find the URL
#   Store the returned threads in the data frame: "combo_threads""

threads <- threads %>% 
  mutate(searched_rsub = current_rsub)

threads %>%
#  filter (comments < 2) %>%
  arrange(comments, timestamp) -> sorted_threads
  
sorted_threads  %>%
  top_n(50, comments)  -> threads


combo_threads <- threads


#_____________________________End of Section____________________________________


#
##  Lets get Looping ###########################################################
#
pass <- 23

#  Edit the second number in the "for (i in 1:"x")" function
#  choose the new value equal to the number of terms 


#  Start of Loop

for (i in 1:41) {
  pass <- pass + 1
  current_rsub <- rsub$sub[pass]
  
  if (is.na(current_rsub) || current_rsub == "") {
    break
  }
  
threads <- find_thread_urls(keywords = "climate", 
                            sort_by = "top",
                            subreddit = current_rsub ,  
                            period = "year"
)
  
  threads$searched_rsub <- as.character(current_rsub)
  
  # Convert threads to data frame if it's not already
  if (!is.data.frame(threads)) {
    threads <- as.data.frame(threads)
  }
  
  threads %>%
 # filter (comments < 1) %>%
  arrange(comments, timestamp) -> sorted_threads
  
sorted_threads  %>%
  top_n(50, comments)  -> threads

  
  combo_threads <- bind_rows(combo_threads, threads)
  
  cat("Current rsub:", current_rsub, "\n")
  print(pass)
}
#  End of loop 

# If you would like to have a list of unique URLs, run this:
combo_threads_unique <- combo_threads[!duplicated(combo_threads$url), ]


#______________________________End of Section___________________________________


#
##  Export your Data ###########################################################
#



#   Write your dataset to googlesheets
#   Your data will be saved as "climate_threads"

climate_threads <- gs4_create("climate_threads",
                           sheets = combo_threads)


# If you opted for the list of unique URLS:
threads_full_unique <- gs4_create("threads_full_unique",
                                  sheets = combo_threads_unique)

# Save your dataset to RDATA
# Set your desired working directory: 
setwd("C:your/working/directory/here")


#  Write your data to RDATA:
save(combo_threads, 
     file = "threads_full.rdata")


#  If you opted for the list of unique URLS:
save(combo_threads_unique, 
     file = "threads_full_unique.rdata")


#    the end




#______________________________End of Section___________________________________

# 
#  Create comparison dataset  ####


#'    So,   we might be interested to learn how often
#'    certain terms occur in the titles of threads in 
#'    the sampled subreddits.   So, we can modify the code 
#'    above to perform that task.   
#'    
#'    Note, we have updated the reference table for naming
#'    subreddits that we want to collect, and have added basic
#'    statistics related to the subreddits:
#'    k_members,    # of members in thousands
#'    years         # years the subreddit has existed
#'    rules         # of rules listed at top leve of sidebar
#'    mods          # of mods listed
#'    top5tenure    average tenure of top (5) longest serving mods
#'    others to be added from content analysis


#    note we are referring to the same spreadsheet linked above

#
##  Baseline comparison  ###################################################
#


#  "pass <- 1" tells R which row in the table to find the current URL 
#  Make the first pass which establishes the dataset: 

pass <- 1   

#  Assign the name of a term (specified by the pass index value),
#  to the variable: current_rsub:

current_rsub <- rsub$sub[pass]   

  
#  This next function returns a list of URLs 

#  You may change "the sort_by" function from "top" to 
#  "relevance", "comments", "new", or "hot"
#  This will change the way function sorts results

#  You may change "subreddit" to the name of a specific subreddit,
#  if you wish to look at one in particular 

#  You may change "period" to shorten or lengthen the time frame
#  Your other options are: "hour", "day", "week", "year", and "all"

#  If you make any changes to the find_thread_urls function,
#  make sure to change it in the loop as well

# Search for threads on Reddit"

threads <- find_thread_urls(keywords = NA, 
                            sort_by = "top",
                            subreddit = current_rsub ,  
                            period = "year"
)

#  Create a column which records the search term that used to find the URL
#   create subreddit related vars
#   Store the returned threads in the data frame: "combo_threads""

threads <- threads %>% 
  mutate(searched_rsub = current_rsub) %>%
  mutate(k_members     = rsub$k_members[pass]) %>% 
  mutate(years         = rsub$years[pass]) %>% 
  mutate(rules         = rsub$rules[pass]) %>%
  mutate(mods          = rsub$mods[pass]) %>%
  mutate(top5tenure    = rsub$top5tenure[pass] )

threads %>%
  mutate (climate = ifelse(grepl("climate", title,
                          ignore.case = TRUE),
                  "1", "0")) -> threads
  
threads %>%
#  filter (comments < 2) %>%
  arrange(comments, timestamp) -> sorted_threads
  
sorted_threads  %>%
  top_n(1000, comments)  -> threads




combo_threads <- threads


#_____________________________End of Section____________________________________


#
###  Lets get Looping ###########################################################
#


#  Edit the second number in the "for (i in 1:"x")" function
#  choose the new value equal to the number of terms 


#  Start of Loop

for (i in 1:8) {
  pass <- pass + 1
  current_rsub <- rsub$sub[pass]
  
  if (is.na(current_rsub) || current_rsub == "") {
    break
  }
  
threads <- find_thread_urls(keywords = NA, 
                            sort_by = "top",
                            subreddit = current_rsub ,  
                            period = "year"
)
  
threads$searched_rsub <- as.character(current_rsub)
  
# Convert threads to data frame if it's not already
  if (!is.data.frame(threads)) {
    threads <- as.data.frame(threads)
  }

  threads %>%
 # filter (comments < 1) %>%
  arrange(comments, timestamp) -> sorted_threads
  
sorted_threads  %>%
  top_n(1000, comments)  -> threads


#  Create a column which records the search term that used to find the URL
#   create subreddit related vars
#   Store the returned threads in the data frame: "combo_threads""

threads <- threads %>% 
  mutate(k_members     = rsub$k_members[pass]) %>% 
  mutate(years         = rsub$years[pass]) %>% 
  mutate(rules         = rsub$rules[pass]) %>%
  mutate(mods          = rsub$mods[pass]) %>%
  mutate(top5tenure    = rsub$top5tenure[pass] )
 
threads %>%
  mutate (climate = ifelse(grepl("climate", title,
                          ignore.case = TRUE),
                  "1", "0")) -> threads
  
  combo_threads <- bind_rows(combo_threads, threads)
  
  cat("Current rsub:", current_rsub, "\n")
  print(pass)
}
#  End of loop 

# If you would like to have a list of unique URLs, run this:
#   this should not normally be needed

combo_threads_unique <- combo_threads[!duplicated(combo_threads$url), ]


#______________________________End of Section___________________________________


#
##  Export your Data ###########################################################
#



#   Write your dataset to googlesheets
#   Your data will be saved as "climate_threads"

sample_baseline <- gs4_create("sample_baseline",
                           sheets = combo_threads)


# If you opted for the list of unique URLS:
threads_full_unique <- gs4_create("threads_full_unique",
                                  sheets = combo_threads_unique)

# Save your dataset to RDATA
# Set your desired working directory: 
setwd("C:your/working/directory/here")


#  Write your data to RDATA:
save(combo_threads, 
     file = "threads_full.rdata")


#  If you opted for the list of unique URLS:
save(combo_threads_unique, 
     file = "threads_full_unique.rdata")


#    the end





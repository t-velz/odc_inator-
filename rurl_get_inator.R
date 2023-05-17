#'  ####################  rurl_get_inator.R ################################
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
#'           "Behold my new evil scheme, the (rurl_get)_inator!"
#'
#'  
#'
#'               basic code written by Ted Welser, spring 2023
#'               
#'           _.-^~~^^^`~-,_,,~''''''```~,''``~'``~,
#' ______,'  -o  :.  _    .          ;     ,'`,  `.
#' (      -\.._,.;;'._ ,(   }        _`_-_,,    `, `,
#'  ``~~~~~~'   ((/'((((____/~~~~~~'(,(,___>      `~' 
#'               
#'              searchinator term version by Morgan Thurston Spring 2023 
#'                  
#'       basic code
#'       
#'       search term version requires a google sheet with
#'       search terms, see below


#  Install Packages if you have not already:

install.packages("googlesheets4")
install.packages("RedditExtractoR")
install.packages("tidyverse")
install.packages("janitor")


#  Load Packages:

library(googlesheets4)
library(tidyverse)
library(janitor)
library(RedditExtractoR)



rm(list=ls(all=TRUE)) 

#  collect a months worth of urls from two related subreddits

threads <- find_thread_urls(keywords = NA, 
          sort_by = "top",
          subreddit = "climate",  
          period = "month"
            )

threads2 <- find_thread_urls(keywords = NA, 
          sort_by = "top",
          subreddit = "climateskeptics",  
          period = "month"
            )

#  use row bind to combine them into a single dataset

threads_comb  <- rbind(threads, threads2)


#  repeat for a year, top threads, maxes out at top 1000 per search

threads_y <- find_thread_urls(keywords = NA, 
          sort_by = "top",
          subreddit = "climate",  
          period = "year"
            )

threads2_y <- find_thread_urls(keywords = NA, 
          sort_by = "top",
          subreddit = "climateskeptics",  
          period = "year"
            )
# combine using row bind

threads_comb_y  <- rbind(threads_y, threads2_y)


    ################################################
    #    write dataset to googlesheets


##  need to link your gmail account to R
#   R can then write and read files

climate_m <- gs4_create("climate_month",
                         sheets = threads_comb)
  

climate_y <- gs4_create("climate_year",
                         sheets = threads_comb_y)



#'  This section performs collection of URL from a list of terms
#'  Users will need to create their own Google sheet
#'  Instruction on the creation of the sheet are found below
#'  
#'  
# ____________________________End of Section____________________________________


#  reddit_searchinator.R #######################################################
#'  
#'  
#'  Main code cobbled together by Ted Welser, 4/6/2023
#'      additions by Morgan Thurston, 4/10/2023 
#'  
#'  An attempt to semi-automate collection of thread level data
#'  from Reddit using the RedditExtractoR package
#'  
#'  
#'  This section performs collection of URL from a list of terms
#'  Users will need to create their own Google sheet
#'  Instruction on the creation of the sheet are found below
#'  
#'  
# ____________________________End of Section____________________________________

#  Clear objects from the workspace and remove objects from memory
rm(list=ls(all=TRUE))    



#  Load Packages:
library(googlesheets4)
library(RedditExtractoR)
library(tidyverse)
library(sentimentr)

# ____________________________End of Section____________________________________


#
##  Creating your Sheet ########################################################
#

#  Set up your Google Sheet like this:

#  Column name in A1:  "id_number"   
#       A2:  term001                             
#       A3:  term002                
#       A4:  term003                      
#       ...                           
#  For  A'n': "term'n-1'               

#  Column name in B1: "terms"
#      In B2 list your first search term
#      In B3 list your second search term 
#      Continue this for every search term you have
#      Make sure that every value in "term" has a corresponding "id_number"

#  Column name in C1: "name"
#      This column is a version of the "terms" column, 
#      however, this column complies with R rules about variables names 
#      For instance, if the cell in B2 reads "hello world",
#      the corresponding cell in C2 should read "hello_world"
#
#  Column name in D1: "keywords"
#      Populate this column with keywords you wish to make a count of in the
#      comments of found threads
#      This is not required for finding threads, so you may ignore 
#      if you do not wish to search for keywords

# ____________________________End of Section____________________________________

#
##  Import your Sheet ##########################################################
#

#  Paste your Spreadsheet ID,
#  (string of letters and numbers found in between "/d/" and "/edit#gid=0")
#                                     |
#                             Here    V

spreadsheet_id <- "1HI24VMqpwEcD9uRzSUiajlewX3xG0xdUfkVn6YyLL6g"


#  For this to work properly edit the sharing settings of your sheet, 
#  so that anyone with the link may edit

#  Load your Google Sheet:
terms1 <- read_sheet(paste0("https://docs.google.com/spreadsheets/d/",
                            spreadsheet_id, "/edit#gid=0"), col_names = TRUE)   


#_____________________________End of Section____________________________________


#
##  Establishing the Dataset ###################################################
#


#  "pass <- 1" tells R which row in the table to find the current URL 
#  Make the first pass which establishes the dataset: 

pass <- 1   

#  Assign the name of a term (specified by the pass index value),
#  to the variable: current_term:
current_term <- terms1$name[pass]   


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

threads <- find_thread_urls(keywords = current_term, 
                            sort_by = "top",
                            subreddit = NA,  
                            period = "month"
)

#  Create a column which records the search term that used to find the URL
#   Store the returned threads in the data frame: "combo_threads""

threads <- threads %>% 
  mutate(searched_term = current_term)

combo_threads <- threads


#_____________________________End of Section____________________________________


#
##  Lets get Looping ###########################################################
#


#  Edit the second number in the "for (i in 1:"x")" function
#  choose the new value equal to the number of terms 


#  Start of Loop
for (i in 1:2) {
  pass <- pass + 1
  current_term <- terms1$name[pass]
  
  if (is.na(current_term) || current_term == "") {
    break
  }
  
  threads <- find_thread_urls(keywords = current_term, 
                              sort_by = "top",
                              subreddit = NA,  
                              period = "month")
  threads$searched_term <- as.character(current_term)
  
  # Convert threads to data frame if it's not already
  if (!is.data.frame(threads)) {
    threads <- as.data.frame(threads)
  }
  
  combo_threads <- bind_rows(combo_threads, threads)
  
  cat("Current term:", current_term, "\n")
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
#   Your data will be saved as "threads_full"
threads_full <- gs4_create("threads_full",
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

  

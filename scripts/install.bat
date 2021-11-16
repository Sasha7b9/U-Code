rem                                     Создаём символьные ссылки
call proc/create_links.bat
cd %_START_DIR_%

call assembly.bat full all

#!/bin/sh
rm -f index.html
cat >> index.html << EOF
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<title>e1media</title>
<link rel="stylesheet" type="text/css" href="/style.css"/>
</head>
<body>
<div id="main">
Список файлов
<ul>
EOF
for a in $(find . -maxdepth 1 -type f | sort); do
    path=$(echo $a | cut -c 3-)
    [ "$path" = 'gen_index.sh' ] && continue
    [ "$path" = 'index.html' ] && continue
    [ "$path" = 'LICENSE' ] && continue
    [ "$path" = 'CNAME' ] && continue
    [ "$path" = 'LICENSE' ] && continue
    [ "$path" = 'style.css' ] && continue
    cat >> index.html << EOF
<li><a href="https://media.etar125.ru/${path}">${path}</a></li>
EOF
done
cat >> index.html << EOF
</ul>
Основной сайт — <a href="https://etar125.ru">etar125.ru</a>.
</div>
</body>
</html>
EOF

#!/bin/bash
case $1 in

  i)
    mkdir ~/.sysadminjournal 2>/dev/null
    touch ~/.sysadminjournal/journal
    ;;

  a)
    if ! ls ~/.sysadminjournal/ 1>/dev/null 2>/dev/null; then
    echo "Журнал не инициализирован. Для инициализации введите sysadminjournal init"
    exit
    fi
    clear
    echo "Введите заметку, после чего нажмите Enter"
    read -e s
    date >> ~/.sysadminjournal/journal
    echo $s >> ~/.sysadminjournal/journal
    echo --------------------------------------------------------------------------------------- >> ~/.sysadminjournal/journal
    echo '' >> ~/.sysadminjournal/journal
    ;;

  qa)
    if ! ls ~/.sysadminjournal/ 1>/dev/null 2>/dev/null; then
    echo "Журнал не инициализирован. Для инициализации введите sysadminjournal init"
    exit
    fi
    if [ -z "$2" ]; then
    echo "Для быстрого добавления заметки"
    echo "sysadminjournal qa Заметка"
    exit
    fi
    date >> ~/.sysadminjournal/journal
    echo $2 $3 $4 $5 $6 $7 $8 $9 >> ~/.sysadminjournal/journal
    echo --------------------------------------------------------------------------------------- >> ~/.sysadminjournal/journal
    echo '' >> ~/.sysadminjournal/journal
    ;;
  r)
    if ! ls ~/.sysadminjournal/ 1>/dev/null 2>/dev/null; then
    echo "Журнал не инициализирован. Для инициализации введите sysadminjournal init"
    exit
    fi
    less ~/.sysadminjournal/journal
    ;;

  ed)
    if ! ls ~/.sysadminjournal/ 1>/dev/null 2>/dev/null; then
    echo "Журнал не инициализирован. Для инициализации введите sysadminjournal init"
    exit
    fi
    nano ~/.sysadminjournal/journal
    ;;

  s)
    if ! ls ~/.sysadminjournal/ 1>/dev/null 2>/dev/null; then
    echo "Журнал не инициализирован. Для инициализации введите sysadminjournal init"
    exit
    fi
    if [ -z "$2" ]; then
    echo "Поисковый запрос не задан."
    echo "sysadminjournal s Запрос"
    exit
    fi
    cat ~/.sysadminjournal/journal | grep $2
    ;;

  ex)
    if ! ls ~/.sysadminjournal/ 1>/dev/null 2>/dev/null; then
    echo "Журнал не инициализирован. Для инициализации введите sysadminjournal init"
    exit
    fi
    if [ -z "$2" ]; then
    echo "Введите файл для экспорта"
    echo "sysadminjournal ex path/to/outptut/file"
    exit
    fi
    cat ~/.sysadminjournal/journal > $2
    ;;
   imp)
    if [ -z "$2" ]; then
    echo "Введите файл для импорта"
    echo "sysadminjournal ex path/to/import/file"
    exit
    fi
    mkdir ~/.sysadminjournal 2>/dev/null
    touch ~/.sysadminjournal/journal
    cat $2 >> ~/.sysadminjournal/journal
    ;;

  *)
    echo "sysadminjournal i                       - Инициализировать Журнал"
    echo "sysadminjournal imp [файл для импорта]  - Импортировать журнал из файла (Так же выполняет инициализацию журнала)"
    echo "sysadminjournal a                       - Добавить запись"
    echo "sysadminjournal qa [Запись]             - Быстрое добавление записи"
    echo "sysadminjournal r                       - Показать журнал"
    echo "sysadminjournal ed                      - Отредактировать журнал"
    echo "sysadminjournal s [Запрос]              - Поиск по журналу"
    echo "sysadminjournal ex [файл для экспорта]  - Экспорт журнала в файл"
    echo "Важный момент: sysadminjournal использует nano для редактирования журнала. После редактирования необходимо нажать CTRL+O Enter CTRL+X. Ни в коем случае не изменяйте имя файла."
   ;;
esac

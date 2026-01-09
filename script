#!/bin/bash

# Скрипт для удаления старых .log файлов

# Проверяем, переданы ли два аргумента
if [ $# -ne 2 ]; then
  echo "Использование: $0 /путь/к/директории N_дней"
  exit 1
fi

DIR="$1"
DAYS="$2"

# Проверяем, существует ли директория
if [ ! -d "$DIR" ]; then
  echo "Ошибка: директория '$DIR' не найдена"
  exit 1
fi

# Находим файлы .log старше N дней
FILES=$(find "$DIR" -type f -name "*.log" -mtime +"$DAYS")

# Если ничего не нашли — выходим
if [ -z "$FILES" ]; then
  echo "Старых файлов .log нет"
  exit 0
fi

# Показываем список
echo "Найдены файлы, старше $DAYS дней:"
echo "$FILES"

# Спрашиваем, удалять или нет
read -p "Удалить их? (y/n): " ANSWER

if [[ "$ANSWER" =~ ^[yY]$ ]]; then
  echo "$FILES" | xargs rm -f
  echo "Удалено."
else
  echo "Отмена."
fi

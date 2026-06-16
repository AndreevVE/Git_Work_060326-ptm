#!/bin/bash
autocommit_time=$(date +'%Y-%m-%d %H:%M:%S')

if [ ! -d ".git" ];
then
    echo "Текущая директория - не GIT-репозиторий!"
    exit 1
fi

git add .

if git diff-index --quiet HEAD;
then
    echo "В директории нет изменений для коммита"
    exit 0
fi


git commit -m "Автоматический коммит $autocommit_time"

echo "Создан коммит: $autocommit_time"


#!/bin/bash

#1. Запрос исходной и целевой директории у пользователя

read -p "Введите исходную директорию: " source_directory
echo "Исходная директория: $source_directory"

read -p "Введите целевую директорию: " target_directory
echo "Целевая директория: $target_directory"

#2. Проверка существования исходной директории и целевой директории

if [ ! -d "$source_directory" ]
then
    echo "Ошибка: исходная директория не существует!"
    exit 1
fi

if [ ! -r "$source_directory" ] || [ ! -x "$source_directory" ]
then
    echo "Ошибка: исходная директория недоступна!"
    exit 1
fi

if [ ! -d "$target_directory" ]
then
    mkdir -p "$target_directory"
fi

if [ ! -w "$target_directory" ] || [ ! -x "$target_directory" ]
then
    echo "Ошибка: целевая директория недоступна!"
    exit 1
fi


#3. Запрос расширения файлов, которые нужно скопировать

read -p "Request file extension to copy: " file_extension
#echo $file_extension

#4. Запросить новое расширение для файлов.

read -p "Enter new file extension: "  new_file_extension

echo "You chose: $new_file_extension"

#5. Проверка, есть ли файлы с указанным расширением в исходной директории


#6. Копирование файлов с указанным расширением в целевую директорию
#for file in "$source_directory"/*."$file_extension"
#do
#  echo $(basename "${file%.*}")
#  cp "$file" "$target_directory"/$(basename "${file%.*}")."$new_file_extension"
#  echo "Файл $(basename "$file") скопирован как $(basename "${file%.*}")."$new_file_extension""
#done

for file in "$source_directory"/*."$file_extension"; do
    filename_without_extension=$(basename "${file%.*}")

    cp "$file" "$target_directory/$filename_without_extension.$new_file_extension"

    echo "Скопирован файл: $file -> $filename_without_extension.$new_file_extension"
done

#7. Архивация исходных файлов.


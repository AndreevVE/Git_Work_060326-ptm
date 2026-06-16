#!/bin/bash

#1. Запрос исходной и целевой директории у пользователя


#2. Проверка существования исходной директории и целевой директории


#3. Запрос расширения файлов, которые нужно скопировать


#4. Запросить новое расширение для файлов.


#5. Проверка, есть ли файлы с указанным расширением в исходной директории


#6. Копирование файлов с указанным расширением в целевую директорию

for file in "$source_directory"/*."$file_extension"; do
    filename=$(basename "$file")
    filename_without_extension="${filename%.*}"

    cp "$file" "$target_directory/$filename_without_extension.$new_file_extension"

    echo "Скопирован файл: $filename -> $filename_without_extension.$new_file_extension"
done

#7. Архивация исходных файлов.


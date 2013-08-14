#!/bin/bash

#
# Список баз данных для конвертирования
#

databases=( "KLADR" "STREET" )

#
# Функция конвертирования баз данных
#

function convert_database {
    dbf_dump -fs="," "$1.DBF" | iconv -fcp866 -tutf8 > "$1.CSV"
}

#
# Процесс конвертирования
#

dir="$1"

if [ ! -d "$dir" ]; then
	dir="."
fi

for db in "${databases[@]}"
do
	file="$dir/$db"

	if [ ! -f "$file.DBF" ]; then
		echo "$file не найден - выход"
		exit 1
	fi

	echo "Конвертирую '$file.DBF' в '$file.CSV'"
	convert_database "$file"
done


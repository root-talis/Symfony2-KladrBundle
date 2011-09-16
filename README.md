//rus
Пакет для работы с Классификатором адресов России (КЛАДР) http://www.gnivc.ru/Document.aspx?id=1571
мануал по структуре КЛАДРа можно найти здесь http://www.ksoft.ru/opis_kladr.htm

Внимание! Для работы с *.dbf файлами необходимо расширение dbase http://php.net/manual/en/book.dbase.php
которое исключено из последних сборок

код региона по КЛАДРу
СС РРР ГГГ ППП АА, где
СС – код субъекта Российской Федерации (региона), коды регионов представлены в Приложении 2 к Описанию классификатора адресов Российской Федерации (КЛАДР);
РРР – код района;
ГГГ – код города;
ППП – код населенного пункта,
АА – признак актуальности наименования адресного объекта.

разбил по уровням CC - 1, РРР - 2, ГГГ - 3, ППП - 4
актуальность обрезается (сделано по аналогии с 1С)

Создаем таблицы в БД

    ./console doctrine:schema:create

Импортируем данные из *.dbf: 

    ./console kladr:import:region  (необязательный параметр --batch=x, кол-во записей на одну транзакцию, 2000 по умолчанию)
    ./console kladr:import:street
    ./console kladr:import:ems (по желанию)

подключить маршруты в вашем приложении
routing.yml:

    kladr:
        resource: "@n3bKladrBundle/Resources/config/routing/routing.yml"
        prefix:   /kladr

рабочий сервис - Kladr\Service\Kladr

1. Для развертывания СУБД Postgres и автоматического запуска скрипта используем следующие команды:

1.1. Собираем образ: `docker build -t <имя_образа>`

В нашем случае:
`docker build -t test_image .`

1.2. Запускаем контейнер, используя созданный образ: `docker run --rm --name <имя_контейнера> -p 5432:5432 -d <имя_образа>`

В нашем случае:
`docker run --rm --name test_container -p 5432:5432 -d test_image:latest`

2. Для подключения к работающему контейнеру с PostgreSQL и запуска интерфейса psql, чтобы вносить новые данные в базу данных, используем команду:

`docker exec -it <container_name> psql -U <username> -d <database_name>`

где:

- `<container_name>` - это имя контейнера с PostgreSQL, к которому подключаемся;
- `<username>` - это имя пользователя базы данных PostgreSQL;
- `<database_name>` - это имя базы данных, к которой подключаемся.

В нашем случае:

`docker exec -it test_container psql -U username -d my_database`

3. Чтобы сохранить изменения в базе данных добавляем инструкцию VOLUME в Dockerfile. Чтобы сохранить данные из контейнера в локальной папке `/data`, используем параметр -v при запуске контейнера (папка на локальном компьютере `/data` -> папка в контейнере `/var/lib/postgresql/data`): 

`docker run --rm --name <имя_контейнера> -p 5432:5432 -d -v <путь_на_хосте>:/var/lib/postgresql/data <имя_образа>`

В нашем случае:
`docker run --rm --name test_container -p 5432:5432 -d -v /data:/var/lib/postgresql/data test_image:latest`




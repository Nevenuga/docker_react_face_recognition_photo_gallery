## Инструкция по настройке и развертыванию

### Требования
- Docker
- Docker Compose

### Конфигурация
Проверьте и измените файлы конфигурации, которые находятся в директории mounted/config:
    - env.development
    - config.js
    - server_config.js

    В них необходимо поменять IP-адреса на IP-адреса вашего сервера/компьютера.

#### Собрать Docker-образ
```bash
docker-compose build
```

#### Запустить Docker-контейнеры
```bash
docker-compose up
```

#### Остановить Docker-контейнеры
```bash
docker-compose down
```


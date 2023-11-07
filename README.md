# Online Health Recommendations
## Цель

Сервис предназначен для предоставления пациентам индивидуальных рекомендаций по здоровью. Пациент в свою очередь может посмотреть все составленные для него рекомендации.

## Использование

В приложении отключены обязательные https запросы для упрощённого взаимодействия с сервисом в приватной сети за реверс прокси.

API предоставляет пользователям 3 основных эндпоинта:

### Описание

- **POST /consultation_requests** Используется для создания пациентом заявки на рекомендацию по здоровью. В процессе добавления данные пациента анализируются внешним API.
- **POST /consultation_requests/:request_id/recommendations** Метод используется для создания рекомендации в ответ на заявку пациента. При создании заявки пациенту на почту приходит оповещение.
- **GET /patients/:patient_id/recommendations** Ендпоинт для получения пациентом списка всех его рекомендаций.

### Входные данные

**POST /consultation_requests**
``` json
{
  "patient":
  {
    "full_name": "string",
    "date_of_birth": "date",
    "phone": "bigint",
    "email": "string"
  },
  "consultation_request": {"request_text": "text"}
}
```
**POST /consultation_requests/:request_id/recommendations**
``` json
{
  "recommendation_text": "text"
}
```

### Возвращаемое значение

**POST /consultation_requests** 
``` json 
{
  "created_request_id": "int"
}
```

**POST /consultation_requests/:request_id/recommendations**
``` json
{
  "created_recommendation_id": "int"
}
```
**GET /patients/:patient_id/recommendations**
``` json
[
  {
    "id": "int",
    "consultation_request_id": 1,
    "recommendation_text": "text",
    "created_at": "datetime"
    "updated_at": "datetime"
  },
]
```
## Инструментарий

- **Ruby** 3.2.2 – Используемая в приложении версия Ruby
- **Rails** 7.1.1
- **PostgreSQL** – В качестве базы данных используется постгрес в докер контейнере
- **Docker** – Приложение сконфигурировано для деплоя в докер контейнере
- **OpenFDA** – Внешний API для анализа состояния пациента

## Инструкция для разработки

Для тестирования сервиса вам понадобиться установленные

- Docker
- Ruby
- Rails

В качестве тестовой БД использован контейнер с постгрес, для его автоматического создания запустите:

- **Windows**: bin/postgress-setup.cmd
- **Linux**: bin/postgress-setup.sh

Для дальнейшего использования необходимо установить гемы *bundle install*.

А также применить миграции к БД командой rails *db:migrate*

Тестовый сервер можно запустить командой *rails server*

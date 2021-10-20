![badge workflow](https://github.com/keplian/foodgram-project-react/actions/workflows/final_workflow.yml/badge.svg)

# Проект Foodgram

## Описание

Дипломный проект для ЯндексПрактикума.

Проект Foodgram предназначен для создания и хранения пользовательских рецептов еды.

Неавторизованный пользователь может просматривать лишь рецепты.

При регистрации и атворизации пользователю становится доступным создание и публикация рецептов, подписка на любимый авторов, добавление рецептов в избранное и формирование списка покупок


## Техническое описание

Проект предназначен для развертывания на сервере

Frontend: 
* разработан командой Яндекс Практикум на базе React

Backend:
* Реализован на базе RestAPI.
* Фреймворк - Django Rest Framework
  * CI/CD через Docker-compose + GithubActions
* Документация по ресурсам на http://site/api/docs/>
* API доступно по адресу: http://site/api/v1/
* Админка по адресу: http://site/admin/




## Стек технологий

Python, Django, Django REST Framework, PostgreSQL, Docker, Nginx, Gunicorn

## Установка

* Сделайте форк репозитория, далее клонируйте его:

```bash
git clone git@github.com:<YOUR_USERNAME>/foodgram-project-react.git
```

* Настройте nginx, установите значение server name в файле default.conf:
```bash
server_name xxx.xxx.xxx.xxx
```
* Скопируйте файл nginx.conf и docker-compose.yml к себе на сервер

* **(ВАЖНО!) В Github Actions настройте переменные ваших секретов**. Какие именно - описаны в `env.template`
* Запушьте изменения, GitHub Actions автоматически проведет тесты, и сделает развертывание этого проекта на вашем сервере

## Вход

Создайте супер пользователя, обязательно укажите почту и пароль (запустить на сервере):

```bash
docker-compose exec backend python manage.py createsuperuser
```

О
## Документация

Чтобы открыть документацию, запустите сервер и перейдите по ссылке:
```http://xxx.xxx.xxx.xxx/api/docs/```

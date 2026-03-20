# Глобальные инструкции Claude

## Язык

Всегда отвечай и пиши текстовые файлы (описания, инструкции, документацию) на русском языке.
Исключения: английские термины, пути к файлам, названия технологий и технические термины.

## Инициализация проекта

Перед реализацией любой задачи — прочитай `CLAUDE.md`, `MEMORY.md`, `ARCHITECTURE.md` в корне проекта.

При инициализации нового проекта создай эти три файла:

- `CLAUDE.md` — общие требования, паттерны, схема архитектуры и важные детали проекта
- `MEMORY.md` — история изменений; обновляется после каждой правки, дубли не нужны
- `ARCHITECTURE.md` — стек, описание директорий и файлов, взаимодействие модулей, команды запуска, миграции

## Docker

Весь процесс разработки ведётся через Docker. Команды фреймворков (rails, bundle, rake, django-admin, manage.py, artisan и т.п.) **всегда** выполняй через docker-compose:

```
docker-compose -f docker-compose.yml -f docker-compose.override.development.yml exec CONTAINER COMMAND
```

Не запускай такие команды напрямую в хост-системе.

## После выполнения задачи

1. **Обнови `MEMORY.md`** — до того, как сообщишь о завершении:
   - Опиши что сделано
   - Перечисли созданные и изменённые файлы
   - Если запись уже есть — обнови её, не дублируй

2. **Git** — используй общепринятые стандарты:
   - **Ветка** ([Git Flow](https://nvie.com/posts/a-successful-git-branching-model/)): `type/short-description`
     - Примеры: `feat/user-auth`, `fix/token-expiry`, `chore/update-deps`
     - Типы: `feat`, `fix`, `hotfix`, `chore`, `docs`, `refactor`, `test`
   - **Коммит** ([Conventional Commits](https://www.conventionalcommits.org/)): `type(scope): description`
     - Примеры: `feat(auth): add JWT login`, `fix(api): resolve timeout issue`
     - Типы: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`, `perf`, `ci`, `revert`
     - `scope` — опциональный, указывает модуль/область изменений

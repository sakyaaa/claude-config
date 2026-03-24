# История изменений конфига

## 2026-03-15 — Инициализация репозитория и настройка статус-бара

**Что сделано:**
- Инициализирован git-репозиторий `~/.claude/` с remote `git@github.com:sakyaaa/claude-config.git`
- Создан `CLAUDE.md` с глобальными инструкциями для Claude
- Добавлен `statusline.sh` — кастомный статус-бар, отображает: модель, git-ветку, % использования контекста, время сессии
- Настроен `settings.json` с подключением статус-бара
- Добавлен `.gitignore` — исключены приватные данные, кэш и временные файлы

**Изменённые файлы:**
- `CLAUDE.md` (создан)
- `settings.json` (создан)
- `statusline.sh` (создан)
- `.gitignore` (создан)
- `README.md` (создан)

---

## 2026-03-15 — Разрешения на просмотр: ls, cat, grep

**Что сделано:**
- В `settings.json` добавлены авторазрешения `Bash(ls*)`, `Bash(cat*)`, `Bash(grep*)` — команды только для чтения
- `find` намеренно не добавлен: флаги `-exec` и `-delete` делают его опасным, пусть запрашивает подтверждение

**Изменённые файлы:**
- `settings.json` (добавлены 3 разрешения)

---

## 2026-03-15 — Docker-инструкции в глобальном промпте

**Что сделано:**
- В `CLAUDE.md` добавлен раздел `## Docker` с правилом: команды фреймворков всегда выполнять через `docker-compose -f docker-compose.yml -f docker-compose.override.development.yml exec CONTAINER COMMAND`

**Изменённые файлы:**
- `CLAUDE.md` (добавлен раздел Docker)

---

## 2026-03-15 — Разрешения WebSearch/WebFetch и project-level конфиг

**Что сделано:**
- В `settings.json` добавлены разрешения `WebSearch` и `WebFetch` — теперь поиск в интернете не требует подтверждения
- Создан `.claude/CLAUDE.md` — project-level инструкции, которые грузятся только при работе в `~/.claude/` (правила коммитов, пуша, структура репо)
- Создан `MEMORY.md` (этот файл) — история изменений конфига

**Изменённые файлы:**
- `settings.json` (добавлен блок `permissions`)
- `.claude/CLAUDE.md` (создан)
- `MEMORY.md` (создан)

---

## 2026-03-20 — Git-стандарты и .gitignore

**Что сделано:**
- В `CLAUDE.md` раздел `## После выполнения задачи` обновлён: ветки теперь по Git Flow (`feat/short-desc`), коммиты по Conventional Commits (`type(scope): description`)
- В `.gitignore` добавлены `paste-cache/` и `stats-cache.json`

**Изменённые файлы:**
- `CLAUDE.md`
- `.gitignore`

---

## 2026-03-24 — Добавлен MCP-сервер Playwright

**Что сделано:**
- Создан `mcp.json` с настройкой MCP-сервера Playwright (`@playwright/mcp@latest`, headful-режим)
- В `.gitignore` добавлены `image-cache/` и `tasks/` — временные каталоги

**Изменённые файлы:**
- `mcp.json` (создан)
- `.gitignore` (добавлены 2 строки)

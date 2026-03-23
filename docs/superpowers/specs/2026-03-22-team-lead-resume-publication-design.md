# Team Lead Resume Publication Design

## Goal

Собрать publish-ready резюме под `Team Lead` в двух версиях:

- `resume-examples/team-lead-resume-example.ru.md`
- `resume-examples/team-lead-resume-example.en.md`

Обе версии должны продавать один и тот же профиль: сильный `hands-on Team Lead` для прямой отправки `hiring manager / CTO`, а не нейтральный массовый ATS-only CV.

## Deliverables

- Финальная русская версия, пригодная для внешней публикации и прямой отправки
- Финальная английская версия, синхронизированная по фактам и общей логике
- При необходимости обновления в `cv.master.yaml`, если в ходе сборки всплывут новые подтвержденные факты

## Primary Target

- Основной рынок подачи: direct-send резюме для `hiring manager / CTO`
- Основной role signal: `Team Lead`
- Предпочтительная длина: сильные `2 страницы`

## Chosen Positioning

Выбранный подход: `leadership-first narrative` с плотным верхом (`exec-dense`).

Это означает:

- верх документа должен продавать leadership scope в первые `6-10` секунд
- цифры и масштаб должны появляться рано
- остальная часть резюме должна не дублировать верх, а доказывать его

## Source of Truth and Fact Rules

- `cv.master.yaml` остается каноническим источником фактов
- если в процессе сборки добавляются новые подтвержденные факты, сначала обновляется `cv.master.yaml`, потом обе производные версии
- нельзя выдумывать метрики, названия, проценты, даты, масштабы команды, стек или достижения
- если точная метрика не подтверждена, использовать мягкую формулировку без ложной точности
- если факт publish-critical и не подтвержден, лучше убрать его из публичной версии, чем оставить заглушку

## Non-Negotiable Publication Rules

- в публичных версиях не должно остаться `TODO`, заглушек, внутренних заметок или формулировок вида `подтвердить`
- в русском резюме заголовки, narrative и вспомогательный текст должны быть на русском; английский допустим только для брендов, технологий, search-oriented role aliases и устойчивых product names
- dated blocks должны идти от нового к старому
- если роль работодателя разбита на проектные или subrole блоки, общий блок работодателя не должен дублировать дату
- все закрытые роли должны быть в прошедшем времени; настоящее время только у текущего блока

## Resume Architecture

### Shared Structure

Порядок блоков в обеих версиях:

1. Имя
2. Headline
3. Контакты
4. Профиль / Summary
5. Ключевые результаты / Selected Impact
6. Опыт работы / Work Experience
7. Навыки / Skills
8. Образование / Education
9. Языки / Languages
10. Сертификация / Certification only if externally clean

### Russian Headline

`Руководитель команды (Team Lead)`

### English Headline

`Engineering Team Lead`

## Top Section Design

### Profile / Summary

Блок должен содержать `3-4` предложения максимум и выполнять одну функцию: быстро объяснить, кто кандидат сейчас и почему его leadership scope сильный.

В блоке должно быть:

- текущая роль в `VK Donations`
- текущий scope: `8 direct reports`, product ownership, delivery ownership
- `1-2` strongest proof points из `VK SocCom`
- короткий signal, что кандидат не только people manager, но и технически credible `hands-on lead`

В блоке не должно быть:

- общих self-descriptions без доказательной опоры
- полного пересказа всей карьеры
- дословного повтора bullets из `Selected Impact`

### Selected Impact / Key Results

Блок должен содержать ровно `4` коротких bullets, каждый из которых продает отдельный крупный proof point:

1. `VK Donations`: команда, ребрендинг, запуск в `VK profiles`, ускорение перехода от монолита к микросервисам
2. `VK SocCom scaling`: `3 teams`, `20 тыс. -> миллионы`, `40` Ozon sellers, около `3 млн` товаров, около `1 млн` офферов
3. `Critical migration + client/platform modernization`: дедлайн отключения Hadoop, incident response, `VKUI 35% -> 64%` на iOS, `84%` на Android
4. `Tinkoff leadership`: mentoring MVP и turnaround `Performance Review`

Этот блок должен быть scan-friendly, а не explanatory.

## Work Experience Design

### VK

Работодатель `VK` должен содержать два проектных блока в таком порядке:

1. `Руководитель команды (Team Lead), продуктовая команда "Донаты", БЮ Сообщества`
2. `Руководитель команды (Team Lead), платформенная команда, БЮ СоцКом`

#### VK Donations Bullet Intent

Роль должна быть раскрыта `4` bullets:

1. состав команды и прямое руководство
2. ребрендинг и вывод донатов в профиль `VK`
3. ускорение перехода сервиса из монолита в микросервисы через координацию с выделенной миграционной командой
4. расширение audience reach и аккуратная формулировка про рост ключевых продуктовых метрик

#### VK SocCom Bullet Intent

Роль должна быть раскрыта `4-5` bullets:

1. team scope и cross-team leadership: `3 teams`, плюс руководство поставкой со стороны дополнительных `3` backend engineers
2. масштабирование товаров: `20 тыс. -> миллионы`
3. seller integrations: `40` Ozon sellers, около `3 млн` импортированных товаров, около `1 млн` офферов
4. критичная миграция рекомендаций под дедлайн Hadoop shutdown
5. унификация клиентов и модернизация фронтенда, либо этот signal должен быть частично поднят в `Selected Impact`, если не помещается без перегруза

Отдельный bullet про `K2` допустим только в пользовательской формулировке, а не во внутреннем жаргоне. Если кейс сохраняется, он должен звучать как создание компонента Товаров, необходимого для миграции Ленты в микросервисы.

### Tinkoff Bank (T-Bank)

Работодатель должен содержать следующие блоки:

1. `Руководитель команды (Team Lead), проект наставничества`
2. `Руководитель команды (Team Lead), проект Performance Review`
3. `Старший разработчик (Senior Developer), проект организационной структуры`
4. `Разработчик middle-уровня (Middle Developer), проект Performance Review`

#### Tinkoff Bullet Budget

- mentoring role: `2-3` bullets
- performance review TL role: `2-3` bullets
- senior role: `2` bullets
- middle role: `1-2` bullets maximum

Нужно сохранить два сигнала:

- доказательство leadership и people growth
- доказательство реальной технической глубины до и во время leadership career path

### Legacy Experience

`Neotech` нужно сохранить как supporting credibility, но не давать ему размывать modern TL positioning.

`CINIMEX` и `AISA IT-Service` должны быть максимально компактными: цель этих блоков показать инженерную базу, а не конкурировать за внимание с последними `7-10` годами.

## Skills Strategy

Навыки должны быть короче и современнее текущего драфта.

Предпочтительные группы:

- `Leadership & Delivery`
- `Architecture & Systems`
- `Backend`
- `Frontend`
- `Platform & Data`

Ожидаемое содержание:

- leadership: team leadership, mentoring, stakeholder management, roadmap planning, cross-functional delivery
- architecture: monolith decomposition, microservices, DDD, CQRS, API design
- backend: PHP, Go, .NET, Java, SQL
- frontend: React, Angular, TypeScript, JavaScript
- platform/data: Postgres, Docker, Kubernetes, CI/CD

Deep legacy stack не должен доминировать в отдельном длинном блоке `Skills`. Если legacy signal нужен, он должен жить в опыте или в короткой secondary строке, а не занимать большой вес наверху документа.

Перечень групп и технологий в этой секции задает направление позиционирования, но не подменяет фактологию: если в формулировках возникает спор, источником правды для стека и фактов остается `cv.master.yaml`.

## RU / EN Synchronization Rules

### Must Match

- даты
- порядок ролей
- team scope
- ключевые цифры
- набор ключевых кейсов
- общий leadership narrative

### May Differ Intentionally

- form of headline
- exact role title wording
- плотность intro
- степень компрессии legacy experience
- naming локальных сущностей под англоязычную аудиторию

English version must not be a literal line-by-line translation of the Russian version. It should preserve facts and strategy while sounding natural for an English-speaking hiring reader.
Для внутренних аббревиатур и названий команд английская версия должна либо расшифровывать термин при первом упоминании, либо заменять его на понятную описательную формулировку.

## Editorial Rules

- `1 bullet = 1 proof point`
- каждая сильная bullet формируется как `scope -> action -> result`
- если фраза не усиливает хотя бы один из сигналов `scale`, `leadership`, `business result`, `technical depth`, она почти наверняка не нужна
- нельзя оставлять внутренние аббревиатуры без функции и расшифровки
- нельзя перегружать верх одинаковым `VK` narrative в `Profile`, `Selected Impact` и `Work Experience`

## Sensitive/Unverified Fact Handling

### Donations Metrics

Если точная `DAU/MAU` метрика не подтверждена, допустима только мягкая формулировка наподобие:

- `поддержал рост ключевых продуктовых метрик`
- `supported growth in key product metrics`

### Traffic Loss Avoidance

Если нет точного процента предотвращенной потери трафика, не писать invented number. Допустима только мягкая формулировка про предотвращение major traffic-loss risk / потери значимой доли трафика.

### Certification

Если точная публичная формулировка `General Electric Smallworld GIS Certified Developer` не подтверждена, секцию сертификации лучше убрать из publish-clean версии, чем оставлять с заглушкой.

## Out of Scope

- создание визуального PDF дизайна
- редизайн вне markdown-версий резюме
- добавление новых неподтвержденных карьерных фактов
- отдельное позиционирование под Staff+, EM или CTO как основной target

## Acceptance Criteria

Результат считается готовым к implementation planning, если:

- обе версии выстроены вокруг `Team Lead` direct-send positioning
- верх объясняет профиль за `6-10` секунд
- блок `Selected Impact / Key Results` содержит ровно `4` bullets
- `VK` и `Tinkoff` роли дают leadership-first evidence без тавтологии
- в документе нет draft-state элементов
- последние `7-10` лет доминируют по ценности и объему
- `RU` и `EN` синхронны по фактам, но естественны по языку
- skills поддерживают текущий рынок и не перетягивают резюме в legacy-heavy позиционирование


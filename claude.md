# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

xx is a full-stack employee time tracking and vacation management system built with Django (backend) and React with TypeScript (frontend).


## Architecture

### Backend Structure
- **Django 6.0** with Django REST Framework
- Session-based authentication (cookies with `withCredentials: true`)
- Single app `chronos/` containing all business logic

**Key Models (`chronos/models.py`):**
- `Empleado`: Employee profiles linked to Django `User` via `OneToOneField`
- `Fichaje`: Daily time tracking records (entrada, salida, pausa, formación)
- `Convenio` → `CalendarGroup` → `CalendarYear`: Hierarchical calendar/holiday system
- `SolicitudVacaciones`: Vacation/leave requests with approval workflow
- `SaldoVacaciones`: Per-employee annual vacation balance

**Hierarchical Relationships:**
- Employees have `responsable` (manager) field for approval chains
- `Empleado.get_equipo_completo()` returns all direct + indirect reports recursively
- Delegation system allows managers to delegate approvals to another employee

### Frontend Structure
- **React 18** with TypeScript
- **Material-UI** for components
- **i18next** for internationalization (ES, EN, PL)
- Session-based auth via `AuthContext` (no JWT tokens, uses cookies)

### 🎨 Diseño y UX
* **Estilo Visual:** Limpio, minimalista, mobile-first. Sin modo oscuro para MVP.
* **Componentes:** Uso de Shadcn UI para elementos interactivos.
* **Principios UX:** Velocidad de generación, transparencia en los prompts de IA, descarga en un clic.

### 🛡️ Políticas y Restricciones
* **Seguridad:** API Keys solo en el lado del servidor (Server-side).
* **Calidad:** TypeScript en modo estricto. Prohibido usar `any`.
* **Documentación:** Actualizar siempre `project_spec.md`, `architecture.md`, `changelog.md` y `project_status.md`.

## Documentation

- [Project Spec](project_spec.md) – Full requirements, API specs, tech details
- [Architecture](docs/architecture.md) – System design and data flow
- [Changelog](docs/changelog.md) – Version history
- [Project Status](docs/project_status.md) – Current progress
- Update files in the docs folder after major milestones and major additions to the project.
- Use the `/update-docs-and-commit` slash command when making git commits

* Created the custom slash command at `.claude/commands/update-docs-and-commit.md`.

**Usage:**
`/update-docs-and-commit [optional commit message or description]`

**What it does:**
1. Analyzes git changes (status + diff)
2. Updates `docs/changelog.md` - adds entries for new features/fixes
3. Updates `docs/architecture.md` - only if structural changes occurred
4. Updates `docs/project_status.md` - moves completed items, updates progress
5. Stages and commits all changes

The command is conservative by design - it only updates docs that genuinely need updating based on the actual code changes.


## Corporate Colors

- Primary Green (Pantone 349): `#006633`
- Light Green (Pantone 374): `#DDDF89`
- Black (Process Black): `#000000`
- Yellow (construction): `#FFD700`

## Key Implementation Details

1. **Authentication Flow**: Uses Django session auth, not JWT. Frontend sets `withCredentials: true` on axios requests.

2. **Time Calculations**: `Fichaje` model has `DuracionTrabajo`, `DuracionPausa`, `DuracionFormacion` as `DurationField` - calculated on backend.

3. **Vacation Days Calculation**: Excludes weekends and `CalendarYearNonWorkingDay` holidays based on employee's `Convenio`.

4. **Delegation System**: When `Empleado.delegar='S'`, their `delegado_a` can approve requests on their behalf.

5. **i18n**: All user-facing strings use `t('key')` from `useTranslation()`. Add new keys to all three locale files.

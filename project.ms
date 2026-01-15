
# 🚀 PLAN MAESTRO DE DESARROLLO

## 1. Definición del Proyecto
* **Audiencia:** ¿Para quién es el proyecto?
* **Problemas:** ¿Qué problemas tratamos de resolver?
* **Solución:** ¿Qué hará el producto específicamente?
* **Objetivos:** ¿Qué queremos conseguir con este desarrollo?

---

## 2. Requerimientos del Producto (PRD)

### Alcance de Versiones
* **MVP:** Funcionalidades mínimas esenciales.
* **Versión 1:** Mejoras sobre el MVP.
* **Versión 2:** Funcionalidades avanzadas.

---

## 3. Requerimientos de Ingeniería

### 🏗️ Arquitectura Técnica
* **Lenguajes:** [Especificar, ej: TypeScript]
* **Frontend:** Next.js (App Router), Tailwind CSS, Shadcn UI.
* **Backend:** [Especificar, ej: Node.js / Next API Routes]
* **Database:** [Especificar, ej: PostgreSQL / Supabase]
* **Infraestructura:** [Ej: Vercel / AWS]
* **AI Models:** Modelos de la familia Gemini o Claude.
* **Ciberseguridad:** Validación de inputs y manejo de secrets.
* **Auth:** Clerk.
* **Email:** Resend.

### 📁 Estructura y Dependencias
* **Dependencias:** * Preferir Shadcn UI sobre librerías externas.
    * Mantener dependencias al mínimo para el MVP.
* **Estructura de archivos:** Definir si será por capas (Layer) o por funcionalidades (Feature).

---

## 4. Configuración (SETUP)

### 🌿 Protocolo de Git
* **Branching:** * 
    * SEIMPRE crear una feature branch antes de empezar cualquier cambio 
    * NUNCA subir cambios directamente a `main`.
    * Nombres Ramas: `feature/descripcion` o `fix/descripcion`.
* **Workflow:**
    1. Crear rama: `git checkout -b feature/nombre`.
    2. Desarrollo y Test Local (`npm run dev`, `lint`, `build`).
    3. Push y Pull Request (PR) a `main`.
    4. Usar comando `/update-docs-and-commit` para mantener la doc al día.

### 🔐 Variables de Entorno
* Configuración estricta en archivo `.env.local` (excluido de Git).

---

## 5. Instrucciones para el LLM (Claude.md)

### 🎨 Diseño y UX
* **Estilo Visual:** Limpio, minimalista, mobile-first. Sin modo oscuro para MVP.
* **Componentes:** Uso de Shadcn UI para elementos interactivos.
* **Principios UX:** Velocidad de generación, transparencia en los prompts de IA, descarga en un clic.

### 🛡️ Políticas y Restricciones
* **Seguridad:** API Keys solo en el lado del servidor (Server-side).
* **Calidad:** TypeScript en modo estricto. Prohibido usar `any`.
* **Documentación:** Actualizar siempre `project_spec.md`, `architecture.md`, `changelog.md` y `project_status.md`.

---

## 6. Automatización y Herramientas
* **MCP Servers:** Uso de Playwright para automatización de navegador.
* **Subagentes:** Herramientas para diseño frontend y arquitectura.

---

## 🧠 Brainstorming de Cierre

### Cuestiones Clave por Responder:
1.  ¿Cuál será el esquema de datos (ERD) inicial?
2.  ¿Cómo manejaremos los límites de rate (rate limiting) de la IA?
3.  ¿Qué estrategia de testing usaremos (Unit vs E2E)?
4.  ¿Cuál es el flujo exacto de almacenamiento de imágenes/archivos?
5.  ¿Cómo se verá el flujo de suscripción o monetización (si aplica)?

---

## 📑 Historial de Conversación
*Ver `conversation.md` para contexto histórico de decisiones.*

# Runbook 03: Estándares Técnicos y Gobierno de Arquitectura

## Objetivo

Usar GitHub Copilot para escalar estándares técnicos y guía de arquitectura entre equipos, repositorios y pull requests.

## Cuándo usarlo

Usa este runbook cuando:

- Los equipos implementan el mismo patrón de formas diferentes.
- Las decisiones de arquitectura no se aplican de forma consistente.
- Los tech leads repiten el mismo feedback en distintos PRs.
- Nuevos repositorios necesitan guía de ingeniería consistente.

## Prerrequisitos del entorno

| Requisito | Por qué importa |
| --- | --- |
| Estándares de ingeniería acordados | Copilot necesita guía explícita para seguir. |
| Ubicación de documentación a nivel repositorio | Mantiene los estándares cerca del código. |
| Proceso de revisión de PR | Refuerza los estándares en el trabajo diario. |
| Ownership del tech lead | Garantiza que los estándares sigan siendo prácticos y actuales. |

## Pasos de configuración

1. Comienza con el template:

   ```powershell
   Copy-Item `
     .\templates\repository-instructions-template.md `
     .\repository-instructions.md
   ```

2. Completa los estándares para el repositorio objetivo:

   - Límites de arquitectura
   - Diseño de APIs
   - Expectativas de pruebas
   - Requisitos de seguridad
   - Requisitos de observabilidad
   - Expectativas para pull requests

3. Pide a Copilot que refine las instrucciones:

   ```text
   Improve these repository instructions for a real engineering team. Make them practical, enforceable in PR review, and specific to this codebase.
   ```

4. Agrega la guía final a la ubicación que tu equipo use para instrucciones de Copilot o estándares de ingeniería.

5. Durante la revisión de PR, pide a Copilot que compare los cambios con los estándares:

   ```text
   Review this change against our repository instructions. Identify only material deviations that affect architecture, testing, security, reliability, or maintainability.
   ```

## Ciclo de gobierno

1. Capturar feedback recurrente de revisión.
2. Convertir feedback repetido en un estándar.
3. Agregar ejemplos del patrón preferido.
4. Usar Copilot para revisar cambios futuros contra el estándar.
5. Eliminar o revisar estándares que no sean útiles.

## Backlog sugerido de estándares

| Área de estándar | Entregable de ejemplo |
| --- | --- |
| Consistencia de API | Contrato de respuestas de error y reglas de validación. |
| Observabilidad | Campos requeridos de logs y patrón de correlación de trazas. |
| Seguridad | Manejo de secretos, política de dependencias y validación de entradas. |
| Pruebas | Expectativas mínimas de pruebas por tipo de cambio. |
| Confiabilidad | Guía de retries, timeouts e idempotencia. |

## Checklist de validación

- Los estándares están escritos en lenguaje claro y accionable.
- Los desarrolladores pueden aplicar la guía sin preguntar al tech lead.
- Las revisiones de PR referencian los estándares de forma consistente.
- Los comentarios repetidos disminuyen con el tiempo.
- Los estándares se actualizan cuando cambian las decisiones de arquitectura.


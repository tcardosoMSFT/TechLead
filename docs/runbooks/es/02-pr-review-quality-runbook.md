# Runbook 02: Revisión de Pull Requests y Calidad

## Objetivo

Usar GitHub Copilot para ayudar a tech leads a revisar pull requests con más consistencia, mejores señales de calidad y menos esfuerzo manual repetitivo.

## Cuándo usarlo

Usa este runbook cuando:

- Las revisiones de PR son lentas o inconsistentes.
- Los revisores omiten repetidamente las mismas categorías de problemas.
- Los tech leads dedican demasiado tiempo a resumir cambios grandes.
- El equipo necesita un checklist compartido de revisión.

## Prerrequisitos del entorno

| Requisito | Por qué importa |
| --- | --- |
| GitHub Copilot disponible en el IDE o CLI | Se usa para resumir y analizar cambios. |
| Clon local del repositorio | Permite inspeccionar diffs y ejecutar pruebas. |
| GitHub CLI autenticado | Útil para hacer checkout de PRs y leer metadatos. |
| Comandos existentes de build/test | Necesarios para validar hallazgos de revisión. |

## Pasos de configuración

1. Clona el repositorio objetivo:

   ```powershell
   git clone https://github.com/contoso/app.git
   cd app
   ```

2. Haz checkout del pull request:

   ```powershell
   gh pr checkout 123
   ```

3. Pide a Copilot que resuma el PR:

   ```text
   Summarize this pull request for a tech lead. Include intent, changed areas, behavior impact, tests, and risk areas.
   ```

4. Pide a Copilot una revisión enfocada en calidad:

   ```text
   Review this pull request as a tech lead. Focus on correctness, maintainability, security, reliability, observability, and test coverage. Report only issues that materially affect quality or delivery risk.
   ```

5. Valida manualmente la salida antes de comentar. Copilot debe asistir el criterio de revisión, no reemplazarlo.

## Checklist de revisión

| Área | Preguntas |
| --- | --- |
| Correctitud | ¿La implementación cumple el comportamiento esperado? |
| Pruebas | ¿Están cubiertos los caminos más importantes? ¿Se prueban casos borde? |
| Seguridad | ¿Se validan entradas? ¿Se evitan secretos? ¿Los permisos son mínimos? |
| Confiabilidad | ¿Se manejan timeouts, retries e idempotencia donde aplica? |
| Observabilidad | ¿Logs, métricas o trazas son suficientes para soporte en producción? |
| Mantenibilidad | ¿El cambio es entendible y está alineado con patrones existentes? |

## Flujo recomendado para tech leads

1. Usar Copilot para resumir el PR.
2. Revisar el diff personalmente.
3. Usar Copilot para identificar riesgos y pruebas faltantes.
4. Ejecutar las pruebas relevantes.
5. Dejar solo comentarios de alto valor.
6. Convertir comentarios repetidos en instrucciones o estándares del repositorio.

## Prompt de ejemplo para comentarios de review

```text
Turn these review findings into concise GitHub PR comments. Keep the tone constructive. Do not comment on style unless it affects correctness, maintainability, or risk.
```

## Checklist de validación

- El resumen de Copilot coincide con el diff real.
- Los problemas sugeridos se confirman manualmente.
- Se ejecutaron pruebas o checks cuando fue práctico.
- Los comentarios de revisión son específicos y accionables.
- El feedback repetido se captura para reutilización futura.


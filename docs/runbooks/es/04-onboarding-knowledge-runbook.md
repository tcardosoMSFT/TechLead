# Runbook 04: Onboarding y Transferencia de Conocimiento

## Objetivo

Usar GitHub Copilot para ayudar a nuevos ingenieros a entender más rápido el codebase, el flujo de entrega y el camino hacia su primera contribución.

## Cuándo usarlo

Usa este runbook cuando:

- Nuevos ingenieros tardan demasiado en hacer su primera contribución.
- El conocimiento importante vive solo con ingenieros senior.
- El código legacy es difícil de explicar.
- Los equipos necesitan material de onboarding repetible.

## Prerrequisitos del entorno

| Requisito | Por qué importa |
| --- | --- |
| Setup local del repositorio | Los nuevos ingenieros necesitan ejecutar y probar el código. |
| Acceso a documentos y repos necesarios | Evita bloqueos durante el onboarding. |
| Camino definido para la primera contribución | Hace que el onboarding sea medible y seguro. |
| Revisión del tech lead | Asegura que las explicaciones generadas sean correctas. |

## Pasos de configuración

1. Clona y abre el repositorio objetivo.

2. Pide a Copilot una explicación del repositorio:

   ```text
   Explain this repository to a new engineer. Focus on the main runtime flow, key modules, local development commands, test strategy, and the safest first contribution.
   ```

3. Pide a Copilot generar un walkthrough del código:

   ```text
   Create a 30-minute onboarding walkthrough for this codebase. Include files to read, concepts to understand, commands to run, and a small safe change to make.
   ```

4. Pide a Copilot mapear los flujos importantes:

   ```text
   Trace the main request or execution flow through the codebase. List the files involved and explain what each one does.
   ```

5. Haz que el tech lead revise el material generado.

6. Publica la guía final de onboarding en la ubicación de documentación del equipo.

## Paquete sugerido de onboarding

| Artefacto | Propósito |
| --- | --- |
| Visión general del repositorio | Explica qué hace el sistema y cómo está estructurado. |
| Guía de setup local | Ayuda al ingeniero a ejecutar la app y las pruebas. |
| Walkthrough del flujo principal | Explica cómo funcionan las features importantes. |
| Primera tarea de contribución | Ofrece un primer PR seguro y significativo. |
| Guía de troubleshooting | Captura problemas comunes de setup y pruebas. |

## Ejemplos de primera contribución

- Agregar una prueba unitaria faltante para una regla de negocio simple.
- Mejorar la cobertura de mensajes de error.
- Agregar logging estructurado en un flujo de bajo riesgo.
- Actualizar documentación de un problema conocido de setup.
- Refactorizar un helper pequeño duplicado con pruebas.

## Ritmo operativo para tech leads

1. Crear la guía de onboarding una vez por repositorio principal.
2. Pedir a cada nuevo ingeniero que la siga.
3. Capturar pasos confusos como issues.
4. Actualizar la guía después del primer PR.
5. Revisar mensualmente la efectividad del onboarding.

## Checklist de validación

- Un nuevo ingeniero puede ejecutar el proyecto localmente.
- La guía identifica los archivos y flujos más importantes.
- La primera contribución es segura y revisable.
- Las explicaciones generadas fueron revisadas por alguien familiarizado con el sistema.
- El feedback de onboarding se incorpora en la guía.


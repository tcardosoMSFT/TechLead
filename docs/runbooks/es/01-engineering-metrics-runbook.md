# Runbook 01: Métricas de Ingeniería

## Objetivo

Crear un proceso repetible de métricas que ayude a los tech leads a entender la adopción de GitHub Copilot y el flujo de pull requests sin convertir los datos en vigilancia de desempeño individual.

## Cuándo usarlo

Usa este runbook cuando necesites responder preguntas como:

- ¿Qué equipos o repositorios están adoptando GitHub Copilot?
- ¿Cuántos pull requests se crean y se mergean por mes?
- ¿Están aumentando los cuellos de botella en revisión?
- ¿Dónde se debe enfocar habilitación o coaching?

## Prerrequisitos del entorno

| Requisito | Por qué importa |
| --- | --- |
| GitHub CLI autenticado con `gh auth login` | El script de métricas lo usa para llamar a las APIs de GitHub. |
| Acceso de lectura a los repositorios | Es necesario para consultar datos de PRs. |
| Permiso de métricas de Copilot a nivel organización | Solo es necesario para métricas de Copilot. Las métricas de PR pueden ejecutarse sin esto. |
| Lista clara de repositorios o alcance de organización | Define el límite de medición. |
| Carpeta local de salida que no se commitea a Git | Evita publicar exportaciones sin procesar. |

## Pasos de configuración

1. Clona este repositorio:

   ```powershell
   git clone https://github.com/tcardosoMSFT/TechLead.git
   cd TechLead
   ```

2. Autentica GitHub CLI:

   ```powershell
   gh auth login
   gh auth status
   ```

3. Selecciona un alcance de medición:

   ```powershell
   $repositories = @(
     "contoso/api",
     "contoso/web",
     "contoso/mobile"
   )
   ```

4. Ejecuta el colector de métricas:

   ```powershell
   .\scripts\collect-engineering-metrics.ps1 `
     -Organization "contoso" `
     -Repositories $repositories `
     -MonthsBack 6 `
     -OutputDirectory ".\output\contoso"
   ```

5. Si tienes permisos para métricas de Copilot, incluye esas métricas:

   ```powershell
   .\scripts\collect-engineering-metrics.ps1 `
     -Organization "contoso" `
     -Repositories $repositories `
     -MonthsBack 6 `
     -IncludeCopilotMetrics `
     -OutputDirectory ".\output\contoso"
   ```

## Salidas esperadas

| Archivo | Propósito |
| --- | --- |
| `pull-request-metrics.csv` | Métricas mensuales de PR fáciles de leer. |
| `pull-request-metrics.json` | Métricas estructuradas para automatización o dashboards. |
| `copilot-metrics.json` | Métricas de Copilot cuando los permisos lo permiten. |
| `summary.json` | Metadatos de la ejecución y referencias a los archivos generados. |

## Cómo interpretar los resultados

| Patrón | Interpretación | Acción |
| --- | --- | --- |
| Los PRs creados son mucho más altos que los mergeados | El trabajo puede estar acumulándose antes del merge. | Revisar tamaño de PRs, capacidad de revisores y confiabilidad del CI. |
| El volumen de PRs es estable pero el uso de Copilot es bajo | Copilot puede no estar incorporado al flujo del equipo. | Ejecutar sesiones de habilitación y compartir prompts por rol/lenguaje. |
| El uso de Copilot es alto pero el flujo no cambia | Los cuellos de botella del proceso pueden limitar las ganancias de productividad. | Inspeccionar latencia de review, fallas de build y claridad de requisitos. |
| Un repositorio domina la actividad de PRs | La capacidad o ownership del equipo puede estar concentrada. | Revisar modelo de ownership y planes de soporte. |

## Ritmo operativo para tech leads

1. Ejecutar métricas mensualmente.
2. Revisar tendencias a nivel repositorio con engineering managers y leads.
3. Compartir insights agregados con los equipos.
4. Definir una o dos acciones de habilitación por mes.
5. Ejecutar nuevamente el reporte y comparar con la línea base anterior.

## Reglas de privacidad

- No rankear desarrolladores individuales por uso de Copilot.
- Preferir resúmenes por repositorio, equipo u organización.
- No commitear archivos de salida generados.
- Usar los datos para habilitación, mejora del flujo y coaching.

## Checklist de validación

- El script finaliza correctamente.
- Se generan salidas CSV y JSON.
- Los conteos de PR coinciden con una verificación puntual en GitHub Search.
- Las métricas de Copilot se generan o se reportan como no disponibles con una advertencia.
- Los datos generados se almacenan fuera de los archivos versionados.


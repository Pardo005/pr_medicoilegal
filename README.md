# NPC Doctor Script para QB-Core

## Descripción
Este script añade un NPC médico interactivo que puede curar y revivir jugadores por una tarifa. Es una solución perfecta para servidores que desean proporcionar servicios médicos automatizados cuando no hay EMS disponibles.

## Características
- NPC médico interactivo
- Sistema de curación y reanimación
- Integración con QB-Target
- Verificación de fondos antes del tratamiento
- Progresbar durante el tratamiento
- Cura completa de heridas y restauración de salud

## Dependencias
- QB-Core
- QB-Target
- QB-Ambulancejob

## Instalación
1. Descarga los archivos
2. Coloca la carpeta `npc-doctor` en tu carpeta de `resources`
3. Añade `ensure npc-doctor` a tu `server.cfg`

## Configuración
Puedes modificar las siguientes variables en `client.lua`:

lua
local config = {
pedModel = "s_m_m_doctor_01", -- Modelo del NPC médico
coords = vector4(307.1, -595.1, 43.3, 70.0), -- Posición del NPC
healPrice = 100, -- Precio del tratamiento
}


## Uso
1. Acércate al NPC médico
2. Interactúa usando QB-Target
3. Si tienes suficiente dinero, recibirás tratamiento médico completo

## Créditos
- Desarrollado para QB-Core Framework
- Creado por [Tu Nombre/Organización]

## Licencia
Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.

## Soporte
Para soporte, por favor abre un issue en el repositorio de GitHub o contacta a través de [tus medios de contacto].

## Changelog
### v1.0.0
- Lanzamiento inicial
- Implementación básica del NPC médico
- Sistema de curación y reanimación
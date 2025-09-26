# 🕹️ Dojo Quest

Dojo Quest es un prototipo sencillo de videojuego **on-chain**, construido con [Dojo Engine](https://dojoengine.org/overview).  
El objetivo es aparecer en un mapa (*spawn*), moverse con un número limitado de pasos y encontrar un tesoro escondido.  

Este proyecto acompaña el artículo **"Los Pilares de Dojo, creemos un mundo on-chain"**, donde mostramos cómo Dojo transforma la manera en que se construyen aplicaciones y mundos digitales.

---

##  Características

- Arquitectura **Entity-Component-System (ECS)** sobre Dojo.  
- Interfaz web en **HTML + JavaScript** con [Cartridge Controller](https://docs.cartridge.gg/controller/getting-started).  
- Backend en **Cairo** con modelos (`Position`, `Moves`) y acciones (`spawn`, `move`).  
- Sin servidores centralizados: el estado del juego vive en la cadena.  
- Transparencia total: los movimientos son verificables y el estado es compartido.  

---

##  Estructura del Proyecto

```plaintext
.
├── contracts/         # Modelos y sistemas en Cairo (Dojo ECS)
│   ├── models.cairo
│   └── actions.cairo
├── public/            # Interfaz web
│   ├── index.html
│   ├── game.js
│   ├── controller.js
│   └── assets/        # Sprites (personaje, mapa, tesoro)
├── manifest_dev.json  # Manifest generado por Dojo
└── README.md
```

## 🛠️ Requisitos

- Node.js ≥ 18
- [Dojo Engine](https://dojoengine.org/)
- Katana (devnet local)
- Sozo (CLI de Dojo)

---

##  Instalación y Uso

1. **Clona el repositorio**
   ```bash
   git clone https://github.com/tu-usuario/dojo-quest.git
   cd dojo-quest

2. **Instala dependencias**
   ```bash
   npm install

3. **Inicia Katana (red local de pruebas)**
   ```bash
   katana --config katana.toml

4. **Despliega los contratos con Sozo**
   ```bash
   sozo build && sozo migrate

5. **Inicia Torii (indexador de estado)**
   ```bash
   torii --config torii.toml

5. **Ejecuta la interfaz web**
   ```bash
   pnpm run dev
# Dojo-Dojo-Quest

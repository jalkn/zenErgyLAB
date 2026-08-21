#!/usr/bin/env bash
set -e

echo "=== Initializing Architecture for ZENERGY.TECH-LAB Automation ==="

# 0. Create required directory tree
mkdir -p src/styles src/scripts docs img

# 1. Generate index.html in the repository root
cat << 'EOF' > index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link class="icon" type="image/png" href="img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>ZENERGY.TECH-LAB</title>
    
    <!-- External Fonts (Typography Engine) -->
    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Plus+Jakarta+Sans:wght@300;400;500;700&display=swap" rel="stylesheet">
    
    <!-- External Stylesheet -->
    <link rel="stylesheet" href="src/styles/global.css">
</head>
<body>

    <!-- Ambient Overlays -->
    <div id="page-bg-overlay"></div>
    <div class="ambient-gradient"></div>
        
    <!-- Header Block (Native CSS Glass Panel & Biokinetic Telemetry Header) -->
    <header class="header-container">
        <div class="top-control-grid">
            
            <!-- Tension Trigger -->
            <button id="btn-tele-tension" title="Cohesion / Tension" class="btn-tele-glass tele-btn-left">
                <span id="sub-reps-tension" class="tele-num-val">0.0</span>
                <span class="tele-unit-label">N</span>
            </button>

<!-- Center Dial Logo -->
            <button id="btn-tele-dial" title="Biokinetic Telemetry" class="btn-tele-glass tele-btn-center">
                <svg viewBox="0 0 100 100" class="icon-tele">
                    <polygon points="20,20 80,20 70,35 30,35" />
                    <polygon points="50,42 58,50 50,58 42,50" />
                    <polygon points="30,65 70,65 80,80 20,80" />
                </svg>
            </button>

            <!-- Resonate Frequency Trigger -->
            <button id="btn-tele-hz" title="Resonant Frequency" class="btn-tele-glass tele-btn-right">
                <span id="sub-sets-solar" class="tele-num-val">0.00</span>
                <span class="tele-unit-label">Hz</span>
            </button>

        </div>

        <!-- Telemetry Data Sub-Bar -->
        <div class="sub-header-bar">
            <span id="panel-telemetry-data" class="telemetry-readout-text">
                REGENERATIVE BIOKINETIC WAVES
            </span>
        </div>
    </header>

    <!-- Central Visualizer & Generator Engine -->
    <main class="main-visualizer-container">
        <div id="zenergy-pack-container">
            <div class="pack-viewport">
                
                <!-- Progressive Image Stack -->
                <img id="zenergy-pack-img-back" src="img/44mane.png" alt="Zenergy Pack Back" class="img-glow-transition" style="opacity: 0; pointer-events: none; z-index: 0;" />
                <img id="zenergy-pack-img" src="img/44caps.png" alt="Zenergy Pack Front" class="img-glow-transition" style="opacity: 1; pointer-events: auto; z-index: 10;" />
                <img id="zenergy-pack-img-raw" src="" alt="Raw Content" class="img-glow-transition" style="opacity: 0; pointer-events: none; z-index: 5;" />
                
                <!-- Tactical Mesh and Vector Overlay -->
                <div class="vector-overlay-layer">
                    <svg id="laser-vector-target" viewBox="0 0 400 400" class="svg-target-reticle">
                        <defs>
                            <path id="textPath-top" d="M 65,200 A 135,135 0 0,1 335,200" />
                            <path id="textPath-bottom" d="M 65,200 A 135,135 0 0,0 335,200" />
                        </defs>
                        
                        <!-- Curved Top Title -->
                        <text class="svg-text-title">
                            <textPath id="laser-variant-title" href="#textPath-top" startOffset="50%" text-anchor="middle">
                                BIORUSH PULSOR FOCUS
                            </textPath>
                        </text>
                        
                        <!-- Biokinetic Quantum Waves -->
                        <g id="wave-quantum-container" class="rotate-neg-90"></g>

                        <!-- Sandwatch Group Mode -->
                        <g id="sandwatch-group" style="display: none; transform-origin: center; transform: scale(0.85); transition: all 0.5s ease;">
<g id="sandwatch-lines" style="transform-origin: 200px 200px;">
    
    <!-- CIRCLE 1: HORIZONTAL EQUATORIAL RING (HEART / BLOOD FIRE / SUN) -->
    <g id="sphere-ring-equator" style="transform-origin: 200px 200px; transition: transform 0.1s linear;">
        <!-- Path 1: SUN (Solar Corona Upper Arc) -->
        <path d="M 110,200 A 90,45 0 0,1 290,200" stroke="#ffffff" stroke-width="2.1" opacity="0.8" fill="none" stroke-linecap="round" />
        <!-- Path 2: MOON (Lunar Focal Lower Arc) -->
        <path d="M 110,200 A 90,45 0 0,0 290,200" stroke="#38bdf8" stroke-width="1.8" opacity="0.5" fill="none" stroke-dasharray="6 3" stroke-linecap="round" />
    </g>

    <!-- CIRCLE 2: VERTICAL MERIDIAN RING (BRAIN / LIGHT REFRACTION / GRAVITY) -->
    <g id="sphere-ring-meridian" style="transform-origin: 200px 200px; transition: transform 0.1s linear;">
        <!-- Path 3: GRAVITY (Tension Horizon Field - Full Orbital Loop) -->
        <path d="M 200,110 A 45,90 0 0,1 200,290 M 200,110 A 45,90 0 0,0 200,290" stroke="#ffffff" stroke-width="1.4" opacity="0.45" fill="none" stroke-dasharray="2 3" />
    </g>

    <!-- PHOTONIC RECOVERY CORE (Central Refraction Point) -->
    <circle cx="200" cy="200" r="3" fill="#38bdf8" opacity="0.7" />
</g>
                            <text id="z-dial-pack" x="200" y="210" text-anchor="middle" fill="#ffffff" font-weight="900" font-size="28" letter-spacing="0.4em" font-family="'Orbitron', sans-serif">8UST11</text>
                        </g>
                        
                        <!-- Curved Bottom Descriptor -->
                        <text class="svg-text-desc">
                            <textPath id="zenergy-description" href="#textPath-bottom" startOffset="50%" text-anchor="middle">
                                Enfoque y claridad cognitiva
                            </textPath>
                        </text>
                    </svg>
                </div>

            </div>
        </div>
    </main>

    <!-- Product Label Strip -->
    <div class="info-strip">
        <div class="info-strip-content">
            <span id="zenergy-label">BIORUSH PULSOR FOCUS</span>
            <span style="opacity: 0.7;">|</span>
            <span id="zenergy-price">$70.000</span>
        </div>
    </div>

    <!-- Actions & Direct WhatsApp Dispatcher Grid -->
    <div class="action-controls-grid">

        <!-- Inspect / Reveal Mode -->
        <button id="btn-reveal-bio" title="Inspect" class="btn-tele-glass tele-btn-left">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" class="icon-stroke">
                <path stroke-linecap="round" stroke-linejoin="round" d="M2.036 12.322a1.012 1.012 0 0 1 0-.639C3.423 7.51 7.36 4.5 12 4.5c4.638 0 8.573 3.007 9.963 7.178.07.207.07.431 0 .639C20.577 16.49 16.64 19.5 12 19.5c-4.638 0-8.573-3.007-9.963-7.178Z" />
                <path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 1 1-6 0 3 3 0 0 1 6 0Z" />
            </svg>
        </button>

        <!-- BUTTON FOR NEXT ACTION STRATEGY -->
        <button title="NEXT-ACTION" class="btn-tele-glass tele-btn-center">
            <svg viewBox="0 0 100 100" class="icon-tele">
                <polygon points="50,42 58,50 50,58 42,50" />
                <polygon points="30,65 70,65 80,80 20,80" />
            </svg>
        </button>

        <!-- Next Product Variant -->
        <button id="btn-next-variant" title="Next Variant" class="btn-tele-glass tele-btn-right">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2.5" class="icon-stroke">
                <path stroke-linecap="round" stroke-linejoin="round" d="m8.25 4.5 7.5 7.5-7.5 7.5" />
            </svg>
        </button>

    </div>

    <!-- Footer Credit -->
    <footer class="footer-container">
        <span class="footer-brand-text">POWERED BY ZENERGY.TECH-LAB</span>
    </footer>

    <!-- Core Engine Script -->
    <script src="src/scripts/zenergy.js"></script>
</body>
</html>
EOF

# 2. Generate src/styles/global.css
cat << 'EOF' > src/styles/global.css
/* =========================================================================
   1. CORE DESIGN SYSTEM & NATIVE CSS VARIABLES
   ========================================================================= */
:root {
    --bg-base: #020617;
    --zenergy-black: #0a0705;
    --sky-glow: rgba(14, 165, 233, 0.1);
    --sky-border: rgba(14, 165, 233, 0.3);
    --sky-accent: #38bdf8;
    --text-main: #f8fafc;
    --text-muted: rgba(255, 255, 255, 0.6);
    --font-tech: 'Orbitron', monospace, sans-serif;
    --font-body: 'Plus Jakarta Sans', sans-serif;
}

/* Reset & Base Layout */
*, ::before, ::after { 
    box-sizing: border-box; 
    margin: 0;
    padding: 0;
}

body { 
    font-family: var(--font-tech); 
    background-color: var(--bg-base); 
    color: var(--text-main); 
    min-height: 100vh;
    width: 100%;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow-x: hidden;
    user-select: none;
    -webkit-user-select: none;
    position: relative;
    -webkit-font-smoothing: antialiased;
} 

::selection {
    background-color: #ffffff;
    color: #000000;
}

/* Ambient Radial & Linear Overlays */
#page-bg-overlay {
    position: fixed; 
    inset: 0; 
    z-index: -1;
    background: radial-gradient(circle at 50% 49%, #1e3a8a 0%, #0f172a 50%, #020617 100%);
}

.ambient-gradient {
    position: fixed;
    inset: 0;
    background: linear-gradient(to bottom, rgba(0,0,0,0.4), transparent, rgba(0,0,0,0.4));
    z-index: 0;
    pointer-events: none;
}

/* Transition Utilities */
.img-glow-transition { 
    transition: opacity 0.5s ease-in-out; 
}

/* Header Control Bar */
.header-container {
    width: 100%;
    flex-shrink: 0;
    z-index: 50;
    background-color: rgba(8, 47, 73, 0.2);
    backdrop-filter: blur(12px);
    -webkit-backdrop-filter: blur(12px);
    box-shadow: 0 4px 30px var(--sky-glow);
    display: flex;
    flex-direction: column;
}

.top-control-grid {
    display: grid;
    grid-template-columns: 1fr auto 1fr;
    align-items: center;
    width: 100%;
    padding: 0 1rem;
    height: 3rem;
}

.btn-tele-glass {
    background-color: transparent;
    border: none;
    display: flex;
    align-items: center;
    color: #ffffff;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn-tele-glass:hover {
    background-color: var(--sky-glow);
}

.btn-tele-glass:active {
    transform: scale(0.95);
}

.tele-btn-left {
    height: 100%;
    padding-left: 0.5rem;
    padding-right: 0.25rem;
    gap: 0.375rem;
    justify-content: flex-start;
}

.tele-btn-center {
    width: 3rem;
    height: 3rem;
    flex-shrink: 0;
    justify-content: center;
    border-left: 1px solid var(--sky-border);
    border-right: 1px solid var(--sky-border);
}

.tele-btn-right {
    height: 100%;
    padding-right: 0.5rem;
    padding-left: 0.25rem;
    gap: 0.375rem;
    justify-content: flex-end;
}

.tele-num-val {
    font-family: var(--font-tech);
    color: #ffffff;
    letter-spacing: 0.1em;
    font-size: 10px;
    transition: color 0.3s ease;
}

.btn-tele-glass:hover .tele-num-val {
    color: var(--sky-accent);
}

.tele-unit-label {
    font-size: 9px;
    letter-spacing: 0.15em;
    color: #38bdf8;
    font-weight: 700;
    text-transform: uppercase;
}

.icon-tele {
    width: 1rem;
    height: 1rem;
    fill: #ffffff;
    pointer-events: none;
    transition: fill 0.3s ease;
}

.btn-tele-glass:hover .icon-tele {
    fill: var(--sky-accent);
}

.sub-header-bar {
    width: 100%;
    border-top: 1px solid var(--sky-border);
    padding: 0.375rem 0;
    display: flex;
    align-items: center;
    justify-content: center;
}

.telemetry-readout-text {
    color: rgba(255, 255, 255, 0.9);
    font-size: 8px;
    letter-spacing: 0.25em;
    font-family: var(--font-tech);
    text-transform: uppercase;
    transition: color 0.3s ease;
}

/* Central Visualizer Layer */
.main-visualizer-container {
    flex: 1;
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 0.5rem 1rem;
}

#zenergy-pack-container {
    position: relative;
    width: 100%;
    max-width: 240px;
    aspect-ratio: 13 / 15;
    flex-shrink: 0;
    margin: 0 auto;
    filter: drop-shadow(0 40px 60px rgba(0,0,0,0.9));
}

.pack-viewport {
    position: relative;
    width: 100%;
    height: 100%;
    overflow: hidden;
    background: transparent;
}

#zenergy-pack-container img {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: contain;
}

.vector-overlay-layer {
    position: absolute;
    inset: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0.5rem;
    z-index: 20;
    pointer-events: none;
}

.svg-target-reticle {
    width: 100%;
    height: 100%;
    fill: none;
    stroke: rgba(255, 255, 255, 0.5);
    stroke-width: 1;
    transition: all 0.5s ease;
    transform-origin: center;
    transform: scale(1.2);
}

.svg-text-title {
    fill: #ffffff;
    font-size: 13px;
    letter-spacing: 0.25em;
    text-transform: uppercase;
    transition: all 0.5s ease;
}

.svg-text-desc {
    fill: var(--text-muted);
    font-size: 10px;
    letter-spacing: 0.35em;
    text-transform: uppercase;
    transition: all 0.5s ease;
}

/* Product Spec Strip & Controls Grid */
.info-strip {
    display: flex;
    align-items: center;
    justify-content: space-between;
    color: rgba(255, 255, 255, 0.9);
    font-size: 8px;
    letter-spacing: 0.25em;
    font-family: var(--font-tech);
    width: 100%;
    text-transform: uppercase;
    padding-top: 0.25rem;
    gap: 0.5rem;
}

.info-strip-content {
    width: 100%;
    border-bottom: 1px solid var(--sky-border);
    padding: 0.375rem 0;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
    text-align: center;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
}

.action-controls-grid {
    display: grid;
    grid-template-columns: 1fr auto 1fr;
    border-bottom: 1px solid var(--sky-border);
    align-items: center;
    width: 100%;
    padding: 0 1rem;
    height: 3rem;
}

.icon-stroke {
    width: 1rem;
    height: 1rem;
    stroke: #ffffff;
    transition: stroke 0.3s ease;
}

.btn-tele-glass:hover .icon-stroke {
    stroke: var(--sky-accent);
}

/* Footer */
.footer-container {
    height: 50px;
    width: 100%;
    flex-shrink: 0;
    background: linear-gradient(to top, rgba(0,0,0,0.8), rgba(0,0,0,0.3), transparent);
    backdrop-filter: blur(4px);
    z-index: 50;
    padding: 0 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
}

.footer-brand-text {
    font-size: 6px;
    letter-spacing: 0.35em;
    font-family: var(--font-tech);
    font-weight: 700;
    color: rgba(186, 230, 253, 0.4);
    text-transform: uppercase;
    transition: color 0.3s ease;
}

.footer-container:hover .footer-brand-text {
    color: rgba(125, 211, 252, 0.8);
}

/* Quantum Wave Helpers */
.rotate-neg-90 {
    transform: rotate(-90deg);
    transform-origin: 200px 200px;
}
EOF

# 3. Generate src/scripts/zenergy.js
cat << 'EOF' > src/scripts/zenergy.js
/**
 * Commercial Catalog Configuration
 */
const ZENERGY_CATALOG = {
    'BIORUSH': {
        defaultVariant: 'FOCUS',
        variants: {
            'FOCUS': { 
                label: 'BIORUSH PULSOR FOCUS', desc: 'Enfoque y claridad cognitiva', 
                spec: 'LION’S MANE', cant: '44X500MGRS', price: '$70MIL', id: 'FOCUS45',
                img: 'img/44caps.png', imgBack: 'img/44mane.png', imgRaw: 'img/maneRaw.png',
                telemetry: { COL: '24°', FRU: '18°', SEC: '40°', MOL: '98.2%' }
            },
            'ZEN': { 
                label: 'BIORUSH PULSOR ZEN', desc: 'Silencio mental óptimo', 
                spec: 'REISHI', cant: '44X500MGRS', price: '$70MIL', id: 'ZEN45',
                img: 'img/44caps.png', imgBack: 'img/44reishi.png', imgRaw: 'img/reishiRaw.png',
                telemetry: { COL: '22°', FRU: '16°', SEC: '38°', MOL: '97.5' }
            },
            'STAMINA': { 
                label: 'BIORUSH PULSOR STAMINA', desc: 'Potencia celular óptima', 
                spec: 'CORDYCEPS', cant: '44X500MGRS', price: '$70MIL', id: 'CORDY45',
                img: 'img/44caps.png', imgBack: 'img/44cordy.png', imgRaw: 'img/cordyRaw.png',
                telemetry: { COL: '20°', FRU: '15°', SEC: '42°', MOL: '99.0' }
            },
            'CORE': { 
                label: 'BIORUSH PULSOR CORE', desc: 'Respuesta inmune óptima', 
                spec: 'TURKEY TAIL', cant: '44X500MGRS', price: '$70MIL', id: 'CORE45',
                img: 'img/44caps.png', imgBack: 'img/44turkey.png', imgRaw: 'img/turkeyRaw.png',
                telemetry: { COL: '23°', FRU: '19°', SEC: '40°', MOL: '98.5' }
            }
        }
    }
};

// State Machine Globals
let currentBioItem = 'BIORUSH';
let currentBioVariant = 'FOCUS';
const targetPhoneNumber = "573025333130";
let currentSphereIdx = "0000";
let inspectModeIndex = 0; 

// Element Cache Map
const $ = (id) => document.getElementById(id);
const cachedElements = {};

function getCachedEl(id) {
    if (!cachedElements[id]) {
        cachedElements[id] = $(id);
    }
    return cachedElements[id];
}

/**
 * Trigger haptic feedback on compatible mobile devices
 * @param {number|Array} ms Pattern duration
 */
const triggerHaptic = (ms) => { 
    if (navigator.vibrate) navigator.vibrate(ms); 
};

/**
 * Visual Inspector Switching (Front, Back, Raw)
 * @param {string} mode Mode identifier
 */
function applyVisualMode(mode) {
    const front = getCachedEl('zenergy-pack-img');
    const back = getCachedEl('zenergy-pack-img-back');
    const raw = getCachedEl('zenergy-pack-img-raw');
    const svg = getCachedEl('laser-vector-target');

    [front, back, raw].forEach(el => { if(el) el.style.opacity = '0'; });
    
    if (mode === 'front') {
        inspectModeIndex = 0;
        front.style.opacity = '1';
        front.style.zIndex = '10';
        back.style.zIndex = '0';
        if (svg) { 
            svg.style.opacity = '1'; 
            svg.style.pointerEvents = 'auto'; 
        }
    } else if (mode === 'back') {
        inspectModeIndex = 1;
        back.style.opacity = '1';
        back.style.zIndex = '10';
        front.style.zIndex = '0';
        if (svg) { 
            svg.style.opacity = '0'; 
            svg.style.pointerEvents = 'none'; 
        }
    } else if (mode === 'raw') {
        inspectModeIndex = 2;
        raw.style.opacity = '1';
        if (svg) { 
            svg.style.opacity = '0'; 
            svg.style.pointerEvents = 'none'; 
        }
    }
}

/**
 * Bind UI Controls and Event Listeners
 */
function bindControls() {
    const btnBio = getCachedEl('btn-reveal-bio');
    const modes = ['front', 'back', 'raw'];

    if (btnBio && !btnBio.dataset.bound) {
        btnBio.dataset.bound = "true";
        btnBio.addEventListener('click', () => {
            inspectModeIndex = (inspectModeIndex + 1) % modes.length;
            applyVisualMode(modes[inspectModeIndex]);
            triggerHaptic(12);
        });
    }

    const btnNext = getCachedEl('btn-next-variant');
    if (btnNext && !btnNext.dataset.bound) {
        btnNext.dataset.bound = "true";
        btnNext.addEventListener('click', () => rotateBioVariant('next'));
    }
}

/**
 * Initialize Zenergy UI Component
 */
function initZenergy() {
    bindControls();
    updateBioUI();
}

/**
 * Rotate Active Product Variant
 * @param {string} direction Direction 'next' or 'prev'
 */
function rotateBioVariant(direction = 'next') {
    const itemConfig = ZENERGY_CATALOG[currentBioItem];
    const variantsKeys = Object.keys(itemConfig.variants);
    const currentIndex = variantsKeys.indexOf(currentBioVariant);
    
    let nextIndex = (direction === 'next') 
        ? (currentIndex + 1) % variantsKeys.length 
        : (currentIndex - 1 + variantsKeys.length) % variantsKeys.length;
    
    currentBioVariant = variantsKeys[nextIndex];
    updateBioUI();
    triggerHaptic(12);
}

/**
 * Update UI Elements based on current catalog selection
 */
function updateBioUI() {
    const itemConfig = ZENERGY_CATALOG[currentBioItem];
    const variantConfig = itemConfig.variants[currentBioVariant];
    
    const descEl = getCachedEl('zenergy-description');
    const packImg = getCachedEl('zenergy-pack-img');
    const packImgBack = getCachedEl('zenergy-pack-img-back');
    const zenergyLabel = getCachedEl('zenergy-label');
    
    if (descEl && packImg && packImgBack) {
        descEl.style.opacity = '0';
        
        setTimeout(() => {
            descEl.textContent = variantConfig.desc;
            packImg.src = variantConfig.img;
            packImgBack.src = variantConfig.imgBack;
            getCachedEl('zenergy-pack-img-raw').src = variantConfig.imgRaw;
            
            const labelTitle = getCachedEl('laser-variant-title');
            if (labelTitle) labelTitle.textContent = variantConfig.label;
            
            if (zenergyLabel) zenergyLabel.textContent = variantConfig.label;
            getCachedEl('zenergy-price').textContent = variantConfig.price;

            descEl.style.opacity = '1';
        }, 120);
    }
}

/**
 * Calculate Current Sphere Epoch Index
 */
function calculateSphereIndex() {
    const now = new Date();
    const epoch = new Date('2012-12-21T00:00:00Z');
    const daysSinceEpoch = Math.floor((now - epoch) / 86400000);
    const currentHour = now.getHours();
    const sphereQuadrant = Math.floor(currentHour / 6);
    return `${String((daysSinceEpoch * 4) + sphereQuadrant).padStart(4, '0')}`;
}

/**
 * Pseudo-3D Crystal Sphere Light Engine
 * Maps Heart Pressure (Solar Fire) & Brain Frequency (Lunar Refraction)
 */
function updateCrystalSphereEngine() {
    const now = new Date();
    const timestamp = now.getTime();

    // 1. HEART / SUN CIRCLE (Blood Pressure Fire & HRV 0.1Hz Resonance)
    const heartPulseDeg = (timestamp / 25) % 360; 
    const pitchHeart3D = Math.sin(timestamp / 900) * 28; 

    // 2. BRAIN / MOON CIRCLE (Neural Alpha Phase 8Hz-12Hz Refraction)
    const brainAlphaDeg = (timestamp / 15) % 360; 
    const rollBrain3D = Math.cos(timestamp / 1100) * 38; 

    // 3. TARGET DUAL CIRCLE SVG RINGS
    const ringEquator = getCachedEl('sphere-ring-equator');
    const ringMeridian = getCachedEl('sphere-ring-meridian');

    // 4. APPLY PSEUDO-3D PERSPECTIVE TRANSFORMATIONS
    if (ringEquator) {
        ringEquator.style.transform = `rotate(${heartPulseDeg.toFixed(2)}deg) rotateX(${pitchHeart3D.toFixed(2)}deg)`;
    }

    if (ringMeridian) {
        ringMeridian.style.transform = `rotate(-${brainAlphaDeg.toFixed(2)}deg) rotateY(${rollBrain3D.toFixed(2)}deg)`;
    }

// 5. UPDATE CENTRAL ALPHANUMERIC DIAL (Heart/Sun · Brain/Moon · Tension Matrix)
    const heartValue = Math.floor(60 + (Math.sin(timestamp / 800) + 1) * 20); // Simulated Cardiac Pulse BPM (60-100)
    const brainValue = (8 + (Math.cos(timestamp / 1200) + 1) * 2).toFixed(1); // Simulated Alpha Brainwave Hz (8-12Hz)
    const lightMatrixCode = `${heartValue}·α·${brainValue}`;

    const elDialPack = getCachedEl('z-dial-pack');
    if (elDialPack) elDialPack.textContent = lightMatrixCode;

    // 6. UPDATE SUB-HEADER TELEMETRY READOUTS
    const subSetsSolar = getCachedEl('sub-sets-solar');
    const subRepsTension = getCachedEl('sub-reps-tension');
    if (subSetsSolar) subSetsSolar.textContent = `${(brainValue / 100).toFixed(3)}`;
    if (subRepsTension) subRepsTension.textContent = `${(12.0 + (heartValue / 10)).toFixed(1)}`;

    // 7. ACTIVE TELEMETRY BAR UPDATE
    if (window.activeTelemetryBtnId && TELEMETRY_CONFIG[window.activeTelemetryBtnId]) {
        const telemetryData = getCachedEl('panel-telemetry-data');
        if (telemetryData) {
            const meaningConfig = TELEMETRY_CONFIG[window.activeTelemetryBtnId].meaning;
            const evaluatedMeaning = typeof meaningConfig === 'function' ? meaningConfig() : meaningConfig;
            telemetryData.innerHTML = evaluatedMeaning.toUpperCase();
        }
    }
}

/**
 * Telemetry Panel Label Configuration
 */
const TELEMETRY_CONFIG = {
    'btn-tele-hz': {
        meaning: "RESONANCIA CEREBRAL (ALFA)",
        targetElId: 'sub-sets-solar'
    },
    'btn-tele-dial': {
        meaning: () => {
            const dialText = getCachedEl('z-dial-pack')?.textContent || "COHERENCIA";
            return `COHERENCIA CARDIO-NEURAL: ${dialText}`;
        },
        targetElId: null
    },
    'btn-tele-tension': {
        meaning: "PRESIÓN SANGUÍNEA SOLAR",
        targetElId: 'sub-reps-tension'
    }
};

/**
 * Enable Telemetry Interactive Triggers
 */
function enableTelemetryReveal() {
    const telemetryData = getCachedEl('panel-telemetry-data');
    const sandwatchGroup = getCachedEl('sandwatch-group');
    let lastActiveData = null;

    Object.keys(TELEMETRY_CONFIG).forEach(btnId => {
        const btn = getCachedEl(btnId);
        if (!btn || btn.dataset.bound) return;
        btn.dataset.bound = "true";

        btn.addEventListener('click', () => {
            triggerHaptic(12);

            if (btnId === 'btn-tele-dial') {
                if (inspectModeIndex !== 0) {
                    applyVisualMode('front');
                    const zenergyLabel = getCachedEl('zenergy-label');
                    if (zenergyLabel) {
                        zenergyLabel.textContent = ZENERGY_CATALOG[currentBioItem].variants[currentBioVariant].label;
                    }
                }

                if (sandwatchGroup) {
                    sandwatchGroup.style.display = 'block';
                }
            } else {
                inspectModeIndex = 0; 
                applyVisualMode('front');
            }

            if (lastActiveData) {
                lastActiveData.classList.remove('is-active');
            }

            const targetDataEl = TELEMETRY_CONFIG[btnId].targetElId ? getCachedEl(TELEMETRY_CONFIG[btnId].targetElId) : null;
            if (targetDataEl) {
                targetDataEl.classList.add('is-active');
                lastActiveData = targetDataEl;
            }

            window.activeTelemetryBtnId = btnId;

            const meaningConfig = TELEMETRY_CONFIG[btnId].meaning;
            const evaluatedMeaning = typeof meaningConfig === 'function' ? meaningConfig() : meaningConfig;
            telemetryData.innerHTML = evaluatedMeaning.toUpperCase();
        });
    });
}

// DOM Ready Execution
document.addEventListener('DOMContentLoaded', () => {
    initZenergy();
    currentSphereIdx = calculateSphereIndex();
    
    // High-Frequency Render Loop (~60fps) for Smooth 3D Sphere Rotations
    function animationFrameLoop() {
        updateCrystalSphereEngine();
        requestAnimationFrame(animationFrameLoop);
    }
    
    requestAnimationFrame(animationFrameLoop);
    enableTelemetryReveal();
});
EOF

# 4. Generate docs/vision.html
cat << 'EOF' > docs/vision.html

EOF


# Make set.sh
chmod +x set.sh 

echo "=== Files created successfully ==="
echo "Run './set.sh'"
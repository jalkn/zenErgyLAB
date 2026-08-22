#!/usr/bin/env bash
set -e

echo "=== Refactoring ZENERGY.TECH-LAB: Removing Inspect Action & Redundancies ==="

# 0. Create required directory tree
mkdir -p src/styles src/scripts docs img

# 1. Generate index.html in the repository root
cat << 'EOF' > index.html
<!DOCTYPE html>
<html lang="en">
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
        
    <!-- BLOCK 1: Header Bar (Top Brand Header) -->
    <header class="header-container">
        <span class="header-brand-text">ZENERGY.TECH-LAB</span>
    </header>

    <!-- BLOCK 2: Central Visualizer & Generator Engine -->
    <main class="main-visualizer-container">
        <div id="zenergy-pack-container">
            <div class="pack-viewport">
                
                <!-- Progressive Image Stack (Dual Layer - Both Visible, Back Scaled Down) -->
                <img id="zenergy-pack-img-back" src="img/44mane.png" alt="Zenergy Pack Back" class="img-glow-transition pack-img-back" style="opacity: 0.85; pointer-events: none; z-index: 5;" />
                <img id="zenergy-pack-img" src="img/44caps.png" alt="Zenergy Pack Front" class="img-glow-transition" style="opacity: 1; pointer-events: auto; z-index: 10;" />
                
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

                        <!-- Sandwatch Group Mode -->
                        <g id="sandwatch-group" style="display: block; transform-origin: center; transform: scale(0.85); transition: all 0.5s ease;">
                            <g id="sandwatch-lines" style="transform-origin: 200px 200px;">
                                <!-- CIRCLE 1: HORIZONTAL EQUATORIAL RING -->
                                <g id="sphere-ring-equator" style="transform-origin: 200px 200px; transition: transform 0.1s linear;">
                                    <path d="M 110,200 A 90,45 0 0,1 290,200" stroke="#ffffff" stroke-width="2.1" opacity="0.8" fill="none" stroke-linecap="round" />
                                    <path d="M 110,200 A 90,45 0 0,0 290,200" stroke="#38bdf8" stroke-width="1.8" opacity="0.5" fill="none" stroke-dasharray="6 3" stroke-linecap="round" />
                                </g>

                                <!-- CIRCLE 2: VERTICAL MERIDIAN RING -->
                                <g id="sphere-ring-meridian" style="transform-origin: 200px 200px; transition: transform 0.1s linear;">
                                    <path d="M 200,110 A 45,90 0 0,1 200,290 M 200,110 A 45,90 0 0,0 200,290" stroke="#ffffff" stroke-width="1.4" opacity="0.45" fill="none" stroke-dasharray="2 3" />
                                </g>

                                <!-- PHOTONIC RECOVERY CORE -->
                                <circle cx="200" cy="200" r="3" fill="#38bdf8" opacity="0.7" />
                            </g>
                            <text id="z-dial-pack" x="200" y="210" text-anchor="middle" fill="#ffffff" font-weight="900" font-size="28" letter-spacing="0.4em" font-family="'Orbitron', sans-serif"></text>
                        </g>

                        <!-- Curved Bottom Descriptor -->
                        <text class="svg-text-desc">
                            <textPath id="zenergy-description" href="#textPath-bottom" startOffset="50%" text-anchor="middle">
                                Focus & Cognitive Clarity
                            </textPath>
                        </text>
                    </svg>
                </div>

            </div>
        </div>
    </main>

    <!-- BLOCK 3: Product Label Strip -->
    <div class="info-strip">
        <div class="info-strip-content">
            <span id="zenergy-label">BIORUSH PULSOR FOCUS</span>
            <span style="opacity: 0.7;">|</span>
            <span id="zenergy-price">$70K COP</span>
        </div>
    </div>

    <!-- BLOCK 4: Actions & Viewport Controls Grid -->
    <div class="action-controls-grid single-action">
        <!-- Next Variant Button -->
        <button id="btn-next-variant" title="Next Variant" class="btn-tele-glass">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="2" class="icon-stroke">
                <path stroke-linecap="round" stroke-linejoin="round" d="M9 5l7 7-7 7" />
            </svg>
        </button>
    </div>

    <!-- BLOCK 5: Footer Bar (Catalog Selector with Pure Text Branding) -->
    <footer class="header-container footer-container">
        <button id="btn-tele-biorush" title="Select BIORUSH" class="btn-brand-text">
            <span class="header-brand-text">BIORUSH</span>
        </button>
        <span class="header-brand-text divider">//</span>
        <button id="btn-tele-sugar" title="Select SUGARRUSH" class="btn-brand-text">
            <span class="header-brand-text">SUGARRUSH</span>
        </button>
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

/* Transition & Scale Utilities */
.img-glow-transition { 
    transition: opacity 0.5s ease-in-out, transform 0.5s ease-in-out; 
}

/* Reducción explícita de escala para la capa de hongo de fondo */
.pack-img-back {
    transform: scale(0.72);
    transform-origin: center center;
}

/* STYLE 1: Header & Footer Container */
.header-container {
    height: 50px;
    width: 100%;
    flex-shrink: 0;
    background: linear-gradient(to bottom, rgba(0,0,0,0.8), rgba(0,0,0,0.3), transparent);
    backdrop-filter: blur(4px);
    -webkit-backdrop-filter: blur(4px);
    z-index: 50;
    padding: 0 1rem;
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.5rem;
}

.footer-container {
    background: linear-gradient(to top, rgba(0,0,0,0.8), rgba(0,0,0,0.3), transparent);
    border-top: 1px solid rgba(14, 165, 233, 0.15);
}

.header-brand-text {
    font-size: 8px;
    letter-spacing: 0.35em;
    font-family: var(--font-tech);
    font-weight: 700;
    color: rgba(186, 230, 253, 0.4);
    text-transform: uppercase;
    transition: color 0.3s ease;
}

.header-brand-text.divider {
    color: rgba(186, 230, 253, 0.2);
    letter-spacing: 0.2em;
}

.header-container:hover .header-brand-text {
    color: rgba(125, 211, 252, 0.8);
}

/* Text Buttons in Footer */
.btn-brand-text {
    background: transparent;
    border: none;
    cursor: pointer;
    padding: 0.25rem 0.5rem;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: opacity 0.3s ease;
}

.btn-brand-text:hover .header-brand-text {
    color: var(--sky-accent);
}

.btn-brand-text:active {
    transform: scale(0.95);
}

/* STYLE 2: Main Visualizer Container */
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

/* STYLE 3: Product Label Strip */
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

/* STYLE 4: Action Controls Grid */
.action-controls-grid.single-action {
    display: flex;
    justify-content: center;
    align-items: center;
    border-bottom: 1px solid var(--sky-border);
    width: 100%;
    height: 3rem;
}

.btn-tele-glass {
    background-color: transparent;
    border: none;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
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

.icon-stroke {
    width: 1.1rem;
    height: 1.1rem;
    stroke: #ffffff;
    transition: stroke 0.3s ease;
}

.btn-tele-glass:hover .icon-stroke {
    stroke: var(--sky-accent);
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
                label: 'BIORUSH PULSOR FOCUS', desc: 'Focus & Cognitive Clarity', 
                price: '$70K COP', img: 'img/44caps.png', imgBack: 'img/44mane.png'
            },
            'ZEN': { 
                label: 'BIORUSH PULSOR ZEN', desc: 'Optimal Mental Silence', 
                price: '$70K COP', img: 'img/44caps.png', imgBack: 'img/44reishi.png'
            },
            'STAMINA': { 
                label: 'BIORUSH PULSOR STAMINA', desc: 'Optimal Cellular Power', 
                price: '$70K COP', img: 'img/44caps.png', imgBack: 'img/44cordy.png'
            },
            'CORE': { 
                label: 'BIORUSH PULSOR CORE', desc: 'Optimal Immune Response', 
                price: '$70K COP', img: 'img/44caps.png', imgBack: 'img/44turkey.png'
            }
        }
    },
    'SUGARRUSH': {
        defaultVariant: 'FOCUS',
        variants: {
            'FOCUS': { 
                label: 'SUGARRUSH PULSOR FOCUS', desc: 'Focus & Cognitive Clarity', 
                price: '$70K COP', img: 'img/44caps.png', imgBack: 'img/44mane.png'
            },
            'ZEN': { 
                label: 'SUGARRUSH PULSOR ZEN', desc: 'Optimal Mental Silence', 
                price: '$70K COP', img: 'img/44caps.png', imgBack: 'img/44reishi.png'
            },
            'STAMINA': { 
                label: 'SUGARRUSH PULSOR STAMINA', desc: 'Optimal Cellular Power', 
                price: '$70K COP', img: 'img/44caps.png', imgBack: 'img/44cordy.png'
            },
            'CORE': { 
                label: 'SUGARRUSH PULSOR CORE', desc: 'Optimal Immune Response', 
                price: '$70K COP', img: 'img/44caps.png', imgBack: 'img/44turkey.png'
            }
        }
    }
};

// State Machine Globals
let currentBioItem = 'BIORUSH';
let currentBioVariant = 'FOCUS';

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
 */
const triggerHaptic = (ms) => { 
    if (navigator.vibrate) navigator.vibrate(ms); 
};

/**
 * Switch Active Catalog Item
 */
function setCatalogItem(itemKey) {
    if (!ZENERGY_CATALOG[itemKey]) return;
    currentBioItem = itemKey;
    currentBioVariant = ZENERGY_CATALOG[itemKey].defaultVariant;
    updateBioUI();
    triggerHaptic(12);
}

/**
 * Bind UI Controls and Event Listeners
 */
function bindControls() {
    const btnNext = getCachedEl('btn-next-variant');
    const btnBiorush = getCachedEl('btn-tele-biorush');
    const btnSugar = getCachedEl('btn-tele-sugar');

    if (btnNext && !btnNext.dataset.bound) {
        btnNext.dataset.bound = "true";
        btnNext.addEventListener('click', () => rotateBioVariant('next'));
    }

    if (btnBiorush && !btnBiorush.dataset.bound) {
        btnBiorush.dataset.bound = "true";
        btnBiorush.addEventListener('click', () => setCatalogItem('BIORUSH'));
    }

    if (btnSugar && !btnSugar.dataset.bound) {
        btnSugar.dataset.bound = "true";
        btnSugar.addEventListener('click', () => setCatalogItem('SUGARRUSH'));
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
    const labelTitle = getCachedEl('laser-variant-title');
    const priceEl = getCachedEl('zenergy-price');

    if (descEl && packImg && packImgBack) {
        descEl.style.opacity = '0';
        if (labelTitle) labelTitle.style.opacity = '0';
        
        setTimeout(() => {
            descEl.textContent = variantConfig.desc;
            packImg.src = variantConfig.img;
            packImgBack.src = variantConfig.imgBack;
            
            if (labelTitle) {
                labelTitle.textContent = variantConfig.label;
                labelTitle.style.opacity = '1';
            }
            if (zenergyLabel) zenergyLabel.textContent = variantConfig.label;
            if (priceEl) priceEl.textContent = variantConfig.price;

            descEl.style.opacity = '1';
        }, 120);
    }
}

/**
 * Pseudo-3D Sandwatch Light Engine
 */
function updateCrystalSphereEngine() {
    const timestamp = Date.now();

    const heartPulseDeg = (timestamp / 25) % 360; 
    const pitchHeart3D = Math.sin(timestamp / 900) * 28; 

    const brainAlphaDeg = (timestamp / 15) % 360; 
    const rollBrain3D = Math.cos(timestamp / 1100) * 38; 

    const ringEquator = getCachedEl('sphere-ring-equator');
    const ringMeridian = getCachedEl('sphere-ring-meridian');

    if (ringEquator) {
        ringEquator.style.transform = `rotate(${heartPulseDeg.toFixed(2)}deg) rotateX(${pitchHeart3D.toFixed(2)}deg)`;
    }

    if (ringMeridian) {
        ringMeridian.style.transform = `rotate(-${brainAlphaDeg.toFixed(2)}deg) rotateY(${rollBrain3D.toFixed(2)}deg)`;
    }

    const heartValue = Math.floor(60 + (Math.sin(timestamp / 800) + 1) * 20);
    const brainValue = (8 + (Math.cos(timestamp / 1200) + 1) * 2).toFixed(1);
    const lightMatrixCode = `${heartValue}·α·${brainValue}`;

    const elDialPack = getCachedEl('z-dial-pack');
    if (elDialPack) elDialPack.textContent = lightMatrixCode;
}

// DOM Ready Execution
document.addEventListener('DOMContentLoaded', () => {
    initZenergy();
    
    function animationFrameLoop() {
        updateCrystalSphereEngine();
        requestAnimationFrame(animationFrameLoop);
    }
    
    requestAnimationFrame(animationFrameLoop);
});
EOF

# 4. Generate docs/roadmap.html
cat << 'EOF' > docs/roadmap.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link class="icon" type="image/png" href="../img/favicon.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <title>ZENERGY.TECH-LAB - Roadmap</title>

    <link href="https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Plus+Jakarta+Sans:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../src/styles/global.css">
    
    <style>
        .roadmap-list {
            list-style: none;
            display: flex;
            flex-direction: column;
            gap: 0.75rem;
            width: 100%;
            max-width: 480px;
            font-size: 11px;
            letter-spacing: 0.15em;
            text-align: left;
        }
        .roadmap-item {
            display: flex;
            align-items: center;
            gap: 0.75rem;
            padding: 0.6rem 0.8rem;
            border: 1px solid var(--sky-border);
            background: rgba(8, 47, 73, 0.2);
            backdrop-filter: blur(8px);
        }
        .roadmap-item input[type="checkbox"] {
            accent-color: var(--sky-accent);
            width: 14px;
            height: 14px;
        }
    </style>
</head>
<body>

    <!-- Ambient Overlays -->
    <div id="page-bg-overlay"></div>
    <div class="ambient-gradient"></div>
        
    <!-- BLOCK 1: Header Bar -->
    <header class="header-container">
        <span class="header-brand-text">ZENERGY.TECH-LAB</span>
    </header>

    <!-- BLOCK 2: Central Visualizer Container -->
    <main class="main-visualizer-container">
        <ul class="roadmap-list">
            <li class="roadmap-item">
                <input type="checkbox" checked disabled>
                <span>Full English translation across codebase, comments, and assets.</span>
            </li>
            <li class="roadmap-item">
                <input type="checkbox" checked disabled>
                <span>Streamlined Block 4 into single variant navigation action.</span>
            </li>
            <li class="roadmap-item">
                <input type="checkbox" checked disabled>
                <span>Render dual simultaneous layers with scaled-down background asset (.pack-img-back).</span>
            </li>
            <li class="roadmap-item">
                <input type="checkbox" checked disabled>
                <span>Purged inspect mode toggles and unreferenced data attributes across JS core.</span>
            </li>
        </ul>
    </main>

    <!-- BLOCK 3: Product Label Strip -->
    <div class="info-strip">
        <div class="info-strip-content">
            <span>ROADMAP MONITOR</span>
            <span style="opacity: 0.7;">|</span>
            <span>v1.0.9</span>
        </div>
    </div>

    <!-- BLOCK 4: Actions Grid -->
    <div class="action-controls-grid single-action">
        <button onclick="window.location.href='../index.html'" title="Return to Visualizer" class="btn-tele-glass">
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.8" class="icon-stroke">
                <path stroke-linecap="round" stroke-linejoin="round" d="M10.5 19.5 3 12m0 0 7.5-7.5M3 12h18" />
            </svg>
        </button>
    </div>

    <!-- BLOCK 5: Footer Bar -->
    <footer class="header-container footer-container">
        <span class="header-brand-text">ROADMAP FOOTER</span>
    </footer>

</body>
</html>
EOF

chmod +x set.sh

echo "=== Refactoring Complete. Execute ./set.sh to build ==="
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
                img: 'img/44caps.png', imgBack: 'img/44mane.png'
            },
            'ZEN': { 
                label: 'BIORUSH PULSOR ZEN', desc: 'Silencio mental óptimo', 
                spec: 'REISHI', cant: '44X500MGRS', price: '$70MIL', id: 'ZEN45',
                img: 'img/44caps.png', imgBack: 'img/44reishi.png'
            },
            'STAMINA': { 
                label: 'BIORUSH PULSOR STAMINA', desc: 'Potencia celular óptima', 
                spec: 'CORDYCEPS', cant: '44X500MGRS', price: '$70MIL', id: 'CORDY45',
                img: 'img/44caps.png', imgBack: 'img/44cordy.png'
            },
            'CORE': { 
                label: 'BIORUSH PULSOR CORE', desc: 'Respuesta inmune óptima', 
                spec: 'TURKEY TAIL', cant: '44X500MGRS', price: '$70MIL', id: 'CORE45',
                img: 'img/44caps.png', imgBack: 'img/44turkey.png'
            }
        }
    },
    'SUGARRUSH': {
        defaultVariant: 'FOCUS',
        variants: {
            'FOCUS': { 
                label: 'SUGARRUSH PULSOR FOCUS', desc: 'Enfoque y claridad cognitiva', 
                spec: 'LION’S MANE', cant: '44X500MGRS', price: '$70MIL', id: 'FOCUS45',
                img: 'img/44caps.png', imgBack: 'img/44mane.png'
            },
            'ZEN': { 
                label: 'SUGARRUSH PULSOR ZEN', desc: 'Silencio mental óptimo', 
                spec: 'REISHI', cant: '44X500MGRS', price: '$70MIL', id: 'ZEN45',
                img: 'img/44caps.png', imgBack: 'img/44reishi.png'
            },
            'STAMINA': { 
                label: 'SUGARRUSH PULSOR STAMINA', desc: 'Potencia celular óptima', 
                spec: 'CORDYCEPS', cant: '44X500MGRS', price: '$70MIL', id: 'CORDY45',
                img: 'img/44caps.png', imgBack: 'img/44cordy.png'
            },
            'CORE': { 
                label: 'SUGARRUSH PULSOR CORE', desc: 'Respuesta inmune óptima', 
                spec: 'TURKEY TAIL', cant: '44X500MGRS', price: '$70MIL', id: 'CORE45',
                img: 'img/44caps.png', imgBack: 'img/44turkey.png'
            }
        }
    }
};

// State Machine Globals
let currentBioItem = 'BIORUSH';
let currentBioVariant = 'FOCUS';
let inspectModeIndex = 0; // 0 = front, 1 = back

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
 * Visual Inspector Switching (Dual Mode: Front / Back)
 * @param {string} mode Mode identifier ('front' | 'back')
 */
function applyVisualMode(mode) {
    const front = getCachedEl('zenergy-pack-img');
    const back = getCachedEl('zenergy-pack-img-back');
    const svg = getCachedEl('laser-vector-target');

    if (mode === 'front') {
        inspectModeIndex = 0;
        if (front) { front.style.opacity = '1'; front.style.zIndex = '10'; }
        if (back) { back.style.opacity = '0'; back.style.zIndex = '0'; }
        if (svg) { svg.style.opacity = '1'; svg.style.pointerEvents = 'auto'; }
    } else {
        inspectModeIndex = 1;
        if (back) { back.style.opacity = '1'; back.style.zIndex = '10'; }
        if (front) { front.style.opacity = '0'; front.style.zIndex = '0'; }
        if (svg) { svg.style.opacity = '0'; svg.style.pointerEvents = 'none'; }
    }
}

/**
 * Switch Active Catalog Item
 * @param {string} itemKey Item key ('BIORUSH' | 'SUGARRUSH')
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
    const btnBio = getCachedEl('btn-reveal-bio');
    const btnNext = getCachedEl('btn-next-variant');
    const btnTension = getCachedEl('btn-tele-tension');
    const btnHz = getCachedEl('btn-tele-hz');
    const modes = ['front', 'back'];

    if (btnBio && !btnBio.dataset.bound) {
        btnBio.dataset.bound = "true";
        btnBio.addEventListener('click', () => {
            inspectModeIndex = (inspectModeIndex + 1) % modes.length;
            applyVisualMode(modes[inspectModeIndex]);
            triggerHaptic(12);
        });
    }

    if (btnNext && !btnNext.dataset.bound) {
        btnNext.dataset.bound = "true";
        btnNext.addEventListener('click', () => rotateBioVariant('next'));
    }

    if (btnTension && !btnTension.dataset.bound) {
        btnTension.dataset.bound = "true";
        btnTension.addEventListener('click', () => setCatalogItem('BIORUSH'));
    }

    if (btnHz && !btnHz.dataset.bound) {
        btnHz.dataset.bound = "true";
        btnHz.addEventListener('click', () => setCatalogItem('SUGARRUSH'));
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
 * Rotates equatorial and meridian rings and syncs dial matrix text
 */
function updateCrystalSphereEngine() {
    const timestamp = Date.now();

    // 1. EQUATORIAL RING ROTATION
    const heartPulseDeg = (timestamp / 25) % 360; 
    const pitchHeart3D = Math.sin(timestamp / 900) * 28; 

    // 2. MERIDIAN RING ROTATION
    const brainAlphaDeg = (timestamp / 15) % 360; 
    const rollBrain3D = Math.cos(timestamp / 1100) * 38; 

    // 3. TARGET SVG RINGS
    const ringEquator = getCachedEl('sphere-ring-equator');
    const ringMeridian = getCachedEl('sphere-ring-meridian');

    if (ringEquator) {
        ringEquator.style.transform = `rotate(${heartPulseDeg.toFixed(2)}deg) rotateX(${pitchHeart3D.toFixed(2)}deg)`;
    }

    if (ringMeridian) {
        ringMeridian.style.transform = `rotate(-${brainAlphaDeg.toFixed(2)}deg) rotateY(${rollBrain3D.toFixed(2)}deg)`;
    }

    // 4. CALCULATE METRICS AND UPDATE DIAL TEXT
    const heartValue = Math.floor(60 + (Math.sin(timestamp / 800) + 1) * 20);
    const brainValue = (8 + (Math.cos(timestamp / 1200) + 1) * 2).toFixed(1);
    const lightMatrixCode = `${heartValue}·α·${brainValue}`;

    const elDialPack = getCachedEl('z-dial-pack');
    if (elDialPack) elDialPack.textContent = lightMatrixCode;
}

// DOM Ready Execution
document.addEventListener('DOMContentLoaded', () => {
    initZenergy();
    
    // High-Frequency Render Loop (~60fps)
    function animationFrameLoop() {
        updateCrystalSphereEngine();
        requestAnimationFrame(animationFrameLoop);
    }
    
    requestAnimationFrame(animationFrameLoop);
});

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
        // Transición de salida (fade-out) limpia
        descEl.style.opacity = '0';
        packImg.style.opacity = '0';
        packImgBack.style.opacity = '0';
        if (labelTitle) labelTitle.style.opacity = '0';
        
        setTimeout(() => {
            descEl.textContent = variantConfig.desc;
            packImg.src = variantConfig.img;
            packImgBack.src = variantConfig.imgBack;
            
            // Garantizar la fusión visual y visibilidad de ambas capas
            packImg.style.mixBlendMode = 'screen';
            packImg.style.opacity = '1';
            packImgBack.style.opacity = '1';

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

/**
 * Commercial Catalog Configuration - ZENERGIA
 */
const ZENERGY_CATALOG = {
    'BIORUSH': {
        defaultVariant: 'FOCUS',
        variants: {
            'FOCUS': { 
                label: 'BIORUSH PULSOR FOCUS', desc: 'ENFOQUE Y CLARIDAD COGNITIVA', 
                spec: 'LION’S MANE · 44 CAPS X 500MG', price: '$70.000', id: 'FOCUS45',
                imgBack: 'img/44mane.png'
            },
            'ZEN': { 
                label: 'BIORUSH PULSOR ZEN', desc: 'SILENCIO MENTAL Y DESCANSO', 
                spec: 'REISHI · 44 CAPS X 500MG', price: '$70.000', id: 'ZEN45',
                imgBack: 'img/44reishi.png'
            },
            'STAMINA': { 
                label: 'BIORUSH PULSOR STAMINA', desc: 'POTENCIA Y ENERGÍA CELULAR', 
                spec: 'CORDYCEPS · 44 CAPS X 500MG', price: '$70.000', id: 'CORDY45',
                imgBack: 'img/44cordy.png'
            },
            'CORE': { 
                label: 'BIORUSH PULSOR CORE', desc: 'RESPUESTA INMUNE ÓPTIMA', 
                spec: 'TURKEY TAIL · 44 CAPS X 500MG', price: '$70.000', id: 'CORE45',
                imgBack: 'img/44turkey.png'
            }
        }
    }
};

// State Machine
let currentBioItem = 'BIORUSH';
let currentBioVariant = 'FOCUS';

// DOM Cache
const $ = (id) => document.getElementById(id);
const elements = {};

function getEl(id) {
    if (!elements[id]) elements[id] = $(id);
    return elements[id];
}

const triggerHaptic = (ms = 12) => { 
    if (navigator.vibrate) navigator.vibrate(ms); 
};

/**
 * Rotate Variant
 */
function rotateBioVariant(direction = 'next') {
    const variantsKeys = Object.keys(ZENERGY_CATALOG[currentBioItem].variants);
    const currentIndex = variantsKeys.indexOf(currentBioVariant);
    
    const nextIndex = (direction === 'next') 
        ? (currentIndex + 1) % variantsKeys.length 
        : (currentIndex - 1 + variantsKeys.length) % variantsKeys.length;
    
    currentBioVariant = variantsKeys[nextIndex];
    updateBioUI();
    triggerHaptic(14);
}

/**
 * Update UI Texts & Images
 */
function updateBioUI() {
    const variantConfig = ZENERGY_CATALOG[currentBioItem].variants[currentBioVariant];
    
    const packImgBack = getEl('zenergy-pack-img-back');
    const labelEl = getEl('strip-label');
    const descEl = getEl('strip-desc');
    const specEl = getEl('strip-spec');

    if (packImgBack) {
        packImgBack.style.opacity = '0';

        setTimeout(() => {
            packImgBack.src = variantConfig.imgBack;

            if (labelEl) labelEl.textContent = variantConfig.label;
            if (descEl) descEl.textContent = variantConfig.desc;
            if (specEl) specEl.textContent = variantConfig.spec;

            packImgBack.style.opacity = '1';
        }, 120);
    }
}

/**
 * Event Bindings
 */
function initZenergy() {
    const btnNext = getEl('btn-next-variant');

    if (btnNext) btnNext.addEventListener('click', () => rotateBioVariant('next'));

    updateBioUI();
}

document.addEventListener('DOMContentLoaded', initZenergy);
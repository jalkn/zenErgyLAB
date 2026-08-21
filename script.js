/**
 * Commercial Catalog Configuration
 */
const BIORUSH_CATALOG = {
    'PULSOR': {
        defaultVariant: 'FOCUS',
        variants: {
            'FOCUS': { 
                label: 'PULSOR FOCUS', desc: 'Enfoque y claridad cognitiva', 
                spec: 'LION’S MANE', cant: '44X500MGRS', price: '$70MIL', id: 'FOCUS45',
                img: 'img/44caps.png', imgBack: 'img/44mane.png', imgRaw: 'img/maneRaw.png',
                telemetry: { COL: '24°', FRU: '18°', SEC: '40°', MOL: '98.2%' }
            },
            'ZEN': { 
                label: 'PULSOR ZEN', desc: 'Silencio mental óptimo', 
                spec: 'REISHI', cant: '44X500MGRS', price: '$70MIL', id: 'ZEN45',
                img: 'img/44caps.png', imgBack: 'img/44reishi.png', imgRaw: 'img/reishiRaw.png',
                telemetry: { COL: '22°', FRU: '16°', SEC: '38°', MOL: '97.5' }
            },
            'STAMINA': { 
                label: 'PULSOR STAMINA', desc: 'Potencia celular óptima', 
                spec: 'CORDYCEPS', cant: '44X500MGRS', price: '$70MIL', id: 'CORDY45',
                img: 'img/44caps.png', imgBack: 'img/44cordy.png', imgRaw: 'img/cordyRaw.png',
                telemetry: { COL: '20°', FRU: '15°', SEC: '42°', MOL: '99.0' }
            },
            'CORE': { 
                label: 'PULSOR CORE', desc: 'Respuesta inmune óptima', 
                spec: 'TURKEY TAIL', cant: '44X500MGRS', price: '$70MIL', id: 'CORE45',
                img: 'img/44caps.png', imgBack: 'img/44turkey.png', imgRaw: 'img/turkeyRaw.png',
                telemetry: { COL: '23°', FRU: '19°', SEC: '40°', MOL: '98.5' }
            }
        }
    }
};

// State Machine Globals
let currentBioItem = 'PULSOR';
let currentBioVariant = 'FOCUS';
const targetPhoneNumber = "573025333130";
let currentSphereIdx = "0000";
let activeNodeVal = "0000";
let biokineticWaveHistory = [];
let waveDisplayState = 0; 
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

const VECTOR_TO_CLOCK_INDEX = {
    'P': 1,  'U': 2,  'L': 3,  'S': 4,
    'PL': 5, 'PU': 6, 'LU': 7, 'SU': 8,
    'PUL': 9,'LPS': 10,'SPU': 11,'ULS': 12
};

/**
 * Visual Inspector Switching (Front, Back, Raw)
 * @param {string} mode Mode identifier
 */
function applyVisualMode(mode) {
    const front = getCachedEl('biorush-pack-img');
    const back = getCachedEl('biorush-pack-img-back');
    const raw = getCachedEl('biorush-pack-img-raw');
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
 * Initialize BioRush UI Component
 */
function initBioRush() {
    bindControls();
    updateBioUI();
}

/**
 * Rotate Active Product Variant
 * @param {string} direction Direction 'next' or 'prev'
 */
function rotateBioVariant(direction = 'next') {
    const itemConfig = BIORUSH_CATALOG[currentBioItem];
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
    const itemConfig = BIORUSH_CATALOG[currentBioItem];
    const variantConfig = itemConfig.variants[currentBioVariant];
    
    const descEl = getCachedEl('biorush-description');
    const packImg = getCachedEl('biorush-pack-img');
    const packImgBack = getCachedEl('biorush-pack-img-back');
    const biorushLabel = getCachedEl('biorush-label');
    
    if (descEl && packImg && packImgBack) {
        descEl.style.opacity = '0';
        
        setTimeout(() => {
            descEl.textContent = variantConfig.desc;
            packImg.src = variantConfig.img;
            packImgBack.src = variantConfig.imgBack;
            getCachedEl('biorush-pack-img-raw').src = variantConfig.imgRaw;
            
            const labelTitle = getCachedEl('laser-variant-title');
            if (labelTitle) labelTitle.textContent = variantConfig.label;
            
            if (biorushLabel) biorushLabel.textContent = variantConfig.label;
            getCachedEl('biorush-price').textContent = variantConfig.price;

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
 * Main PULS Telemetry Engine Loop
 */
function updateZ() {
    let biokineticCoordinate = "";
    const now = new Date();
    const hours = now.getHours(); 
    const minutes = now.getMinutes();
    const seconds = now.getSeconds();

    currentSphereIdx = calculateSphereIndex();

    let setsStage = 1;  
    let repsStage = 1;  
    let currentAction = 'P'; 

    if (seconds % 2 !== 0) {
        const progress1s = now.getMilliseconds() / 1000; 
        setsStage = Math.floor(progress1s * 12) + 1;
        repsStage = 13 - setsStage; 

        if (progress1s < 0.25) currentAction = 'P';
        else if (progress1s < 0.5) currentAction = 'U';
        else if (progress1s < 0.75) currentAction = 'L';
        else currentAction = 'S';
    } else {
        setsStage = Math.floor((minutes % 12) + 1);
        
        if (seconds < 30) {
            const subSlot = Math.floor((seconds % 30) / 7.5);
            currentAction = ["PL", "PU", "LU", "SU"][subSlot] || "PL";
            repsStage = Math.floor((seconds % 10) + 2);
        } else {
            const subSlot = Math.floor(((seconds - 30) % 30) / 7.5);
            currentAction = ["PUL", "LPS", "SPU", "ULS"][subSlot] || "ULS";
            repsStage = Math.floor(((seconds - 30) % 10) + 3);
        }
    }

    setsStage = Math.max(1, Math.min(12, setsStage));
    repsStage = Math.max(1, Math.min(12, repsStage));
    biokineticCoordinate = `${setsStage}${currentAction}${repsStage}`;

    const vectorIndex = VECTOR_TO_CLOCK_INDEX[currentAction] || 1;

    biokineticWaveHistory.unshift({
        sets: setsStage,
        vector: vectorIndex,
        reps: repsStage
    });
    if (biokineticWaveHistory.length > 12) biokineticWaveHistory.pop();

    renderBiokineticWaves();

    const elDialPack = getCachedEl('z-dial-pack');
    const elDialTele = getCachedEl('z-dial-telemetry');

    if (elDialPack) elDialPack.textContent = biokineticCoordinate;
    if (elDialTele) elDialTele.textContent = biokineticCoordinate;
            
    const totalSecondsSinceMidnight = (hours * 3600) + (minutes * 60) + seconds;
    activeNodeVal = `${String(totalSecondsSinceMidnight + 1).padStart(4, '0')}`;

    const subSetsSolar = getCachedEl('sub-sets-solar');
    const subRepsTension = getCachedEl('sub-reps-tension');
    if (subSetsSolar) subSetsSolar.textContent = `${(0.05 + (setsStage / 240)).toFixed(3)}`;
    if (subRepsTension) subRepsTension.textContent = `${(14.2 + (repsStage * 0.8)).toFixed(1)}`;

    if (window.activeTelemetryBtnId && TELEMETRY_CONFIG[window.activeTelemetryBtnId]) {
        const telemetryData = getCachedEl('panel-telemetry-data');
        
        if (telemetryData) {
            if (window.activeTelemetryBtnId === 'btn-tele-dial') {
                if (waveDisplayState === 0) {
                    telemetryData.innerHTML = biokineticCoordinate;
                } else {
                    const meaningConfig = TELEMETRY_CONFIG['btn-tele-dial'].meaning;
                    const evaluatedMeaning = typeof meaningConfig === 'function' ? meaningConfig() : meaningConfig;
                    telemetryData.innerHTML = evaluatedMeaning.toUpperCase();
                }
            } else {
                const meaningConfig = TELEMETRY_CONFIG[window.activeTelemetryBtnId].meaning;
                const evaluatedMeaning = typeof meaningConfig === 'function' ? meaningConfig() : meaningConfig;
                telemetryData.innerHTML = evaluatedMeaning.toUpperCase();
            }
        }
    }
}

const TELEMETRY_CONFIG = {
    'btn-tele-hz': {
        meaning: "Frecuencia de resonancia",
        targetElId: 'sub-sets-solar'
    },
    'btn-tele-dial': {
        meaning: () => {
            const coord = getCachedEl('z-dial-telemetry')?.textContent || "1P1";
            const match = coord.match(/^(\d+)([A-Z]+)(\d+)$/);
            if (!match) return "MATRIZ BIOCINÉTICA ACTIVA.";
            
            const [_, sets, action, reps] = match;
            let vectorText = "";

            switch (action) {
                case 'P':  vectorText = `PASOS X${sets}`; break;
                case 'S':  vectorText = `SALTOS X${sets}`; break; 
                case 'U':  vectorText = `PRESIONES X${sets}`; break; 
                case 'L':  vectorText = `CARGAS X${sets}`; break;    
                case 'PL': vectorText = `PASOS CON CARGA X${sets}`; break;
                case 'PU': vectorText = `PASOS CON PRESIÓN X${sets}`; break;
                case 'LU': vectorText = `CARGAS CON PRESIÓN X${sets}`; break;
                case 'SU': vectorText = `SALTOS CON PRESIÓN X${sets}`; break;
                case 'PUL': vectorText = `PASOS CON PRESIÓN Y CARGA X${sets}`; break;
                case 'LPS': vectorText = `CARGAS CON PASO Y SALTO X${sets}`; break;
                case 'SPU': vectorText = `SALTOS CON PASO Y PRESIÓN X${sets}`; break; 
                case 'ULS': vectorText = `PRESIONES CON CARGA Y SALTO X${sets}`; break;
                default: vectorText = "ONDAS BIOCINÉTICAS REGENERATIVAS";
            }

            return `${reps} ${vectorText}`;
        },
        targetElId: null
    },
    'btn-tele-tension': {
        meaning: "Magnetismo gravitacional",
        targetElId: 'sub-reps-tension'
    }
};

/**
 * Render Biokinetic Wave Vector Layers into SVG Container
 */
function renderBiokineticWaves() {
    const container = $('wave-quantum-container');
    if (!container) return;

    if (waveDisplayState === 1) {
        container.innerHTML = '';
        return;
    }

    if (biokineticWaveHistory.length === 0) return;

    let htmlContent = '';
    biokineticWaveHistory.forEach((dial, tIndex) => {
        const currentScale = (tIndex + 5) * 0.85;
        const baseOpacity = 1.0 - (tIndex * 0.12);
        if (baseOpacity <= 0) return;

        const viewFactor = 8.5; 
        const layers = [
            { id: 'internal',     r: (currentScale * 1.0) * viewFactor, opacity: baseOpacity * 0.80, value: dial.sets },
            { id: 'intermediate', r: (currentScale * 1.4) * viewFactor, opacity: baseOpacity * 0.60, value: dial.vector },
            { id: 'external',     r: (currentScale * 1.8) * viewFactor, opacity: baseOpacity * 0.40, value: dial.reps }
        ];

        layers.forEach(layer => {
            if (layer.r <= 0) return;
            const circumference = 2 * Math.PI * layer.r;
            const angle = (layer.value - 1) * 30; 
            const arcLength = (layer.value / 12) * circumference;
            const dashArray = `${arcLength} ${circumference}`;

            htmlContent += `
                <circle 
                    cx="200" 
                    cy="200" 
                    r="${layer.r}" 
                    transform="rotate(${angle} 200 200)"
                    style="stroke: #ffffff; transition: all 0.3s ease; stroke-width: ${tIndex === 0 ? 1.5 : 1.0}; stroke-opacity: ${layer.opacity}; stroke-dasharray: ${dashArray}; stroke-linecap: round; fill: none;"
                />`;
        });
    });
    container.innerHTML = htmlContent;
}

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
                    const biorushLabel = getCachedEl('biorush-label');
                    if (biorushLabel) {
                        biorushLabel.textContent = BIORUSH_CATALOG[currentBioItem].variants[currentBioVariant].label;
                    }
                }

                if (window.activeTelemetryBtnId === 'btn-tele-dial') {
                    waveDisplayState = (waveDisplayState === 0) ? 1 : 0;
                } else {
                    waveDisplayState = 0;
                }

                if (sandwatchGroup) {
                    sandwatchGroup.style.display = (waveDisplayState === 1) ? 'block' : 'none';
                }
                renderBiokineticWaves();
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

            let evaluatedMeaning = "";
            if (btnId === 'btn-tele-dial') {
                if (waveDisplayState === 0) {
                    evaluatedMeaning = getCachedEl('z-dial-telemetry')?.textContent || "8UST11";
                } else {
                    const meaningConfig = TELEMETRY_CONFIG[btnId].meaning;
                    evaluatedMeaning = typeof meaningConfig === 'function' ? meaningConfig() : meaningConfig;
                }
            } else {
                const meaningConfig = TELEMETRY_CONFIG[btnId].meaning;
                evaluatedMeaning = typeof meaningConfig === 'function' ? meaningConfig() : meaningConfig;
            }
            
            telemetryData.innerHTML = evaluatedMeaning.toUpperCase();
        });
    });
}

// DOM Ready Execution
document.addEventListener('DOMContentLoaded', () => {
    initBioRush();
    updateZ(); 
    setInterval(updateZ, 1000);
    enableTelemetryReveal();
});
{{flutter_js}}
{{flutter_build_config}}

const searchParams = new URLSearchParams(window.location.search);
const renderer = searchParams.get('renderer');
const userConfig = {
    renderer: renderer || '',
    canvasKitVariant: 'auto',
    canvasKitMaximumSurfaces: getCanvasKitMaximumSurfaces(),
};

createProgressBar();
setProgress(85);

_flutter.loader.load(
    {
        serviceWorkerSettings: {
            serviceWorkerVersion: '{{flutter_service_worker_version}}',
        },
        config: userConfig,
        onEntrypointLoaded: async function (engineInitializer) {
            setProgress(100);
            let appRunner = await engineInitializer.initializeEngine();
            await appRunner.runApp();
            window.dispatchEvent(new Event('flutter-initialized'));
        }
    }
);

function setProgress(value) {
    if (value < 0) value = 0;
    if (value > 100) value = 100;
    
    let progressBar = document.querySelector('.progress-bar');
    if (progressBar) {
        let currentProgress = parseInt(progressBar.getAttribute('aria-valuenow')) || 0;
        
        function animateProgress() {
            let difference = value - currentProgress;
            let step = difference / 10;
            step = step * 0.9 + (difference > 0 ? 0.1 : -0.1);
            
            if (Math.abs(difference) < 0.5) {
                currentProgress = value;
            } else {
                currentProgress += step;
                requestAnimationFrame(animateProgress);
            }
            
            progressBar.style.width = currentProgress + '%';
            progressBar.setAttribute('aria-valuenow', Math.round(currentProgress));
            progressBar.textContent = Math.round(currentProgress) + '%';
        }
        
        animateProgress();
    }
}

function createProgressBar() {
    let div = document.createElement('div');
    document.body.appendChild(div);
    div.insertAdjacentHTML(
        'afterbegin',
        `<div class="progress col-4" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
            <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width:0%">
                0%
            </div>
        </div>`
    );
}

function getCanvasKitMaximumSurfaces() {
    const memory = navigator.deviceMemory || 4;
    const cpuCores = navigator.hardwareConcurrency || 2;

    if (memory <= 2 || cpuCores <= 2) {
        return 2; // Low-end device
    } else if (memory >= 8 && cpuCores >= 6) {
        return 8; // High-end device
    } else {
        return 4; // Medium-range device
    }
}
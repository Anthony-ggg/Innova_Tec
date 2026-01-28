// Global function for non-module usage
async function loadBottomNav(activeItem) {
    // Nav Template as String to avoid CORS/Fetch issues on local files
    const navHTML = `
    <nav class="z-30 flex h-20 w-full items-start justify-between border-t border-slate-100 dark:border-slate-800 bg-white/90 dark:bg-background-dark/90 px-6 pt-3 backdrop-blur-xl">

        <a data-nav="map" href="../users/map.html" class="nav-item flex flex-col items-center gap-1">
            <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">map</span>
            <span class="text-[10px]">Map</span>
        </a>

        <a data-nav="coupons" href="../users/hot_cupons.html" class="nav-item flex flex-col items-center gap-1">
            <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">local_fire_department</span>
            <span class="text-[10px]">Hot Deals</span>
        </a>

        <a data-nav="favorites" href="../users/favorites_bussines.html" class="nav-item flex flex-col items-center gap-1">
            <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">favorite</span>
            <span class="text-[10px]">Favorites</span>
        </a>

        <a data-nav="alerts" href="../users/notifications_list.html" class="nav-item flex flex-col items-center gap-1 relative">
            <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">notifications</span>
            <span class="absolute top-0 right-1 h-2 w-2 rounded-full bg-red-500 border-2 border-white dark:border-slate-900" style="font-variation-settings: 'FILL' 1;"></span>
            <span class="text-[10px]">Alerts</span>
        </a>

        <a data-nav="profile" href="../users/user_profile.html" class="nav-item flex flex-col items-center gap-1">
            <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">person</span>
            <span class="text-[10px]">Profile</span>
        </a>

    </nav>
    `;

    // Buscar el template existente o crear uno nuevo
    let template = document.getElementById("bottom-nav-template");

    if (!template) {
        // Crear elemento temporal
        const tempDiv = document.createElement('div');
        tempDiv.innerHTML = navHTML;

        // Asignar funcionalidad
        const navElement = tempDiv.firstElementChild;

        // Estilos
        const ACTIVE_CLASSES = "text-primary font-bold";
        const INACTIVE_CLASSES = "text-slate-400 dark:text-slate-500 font-medium";

        // Activar item correcto
        navElement.querySelectorAll(".nav-item").forEach(item => {
            const name = item.dataset.nav;

            if (name === activeItem) {
                item.classList.add(...ACTIVE_CLASSES.split(" "));
                item.classList.remove(...INACTIVE_CLASSES.split(" "));
            } else {
                item.classList.add(...INACTIVE_CLASSES.split(" "));
                item.classList.remove(...ACTIVE_CLASSES.split(" "));
            }
        });

        // Insertar en el contenedor
        const container = document.getElementById("bottom-nav-container");
        if (container) {
            container.innerHTML = ""; // Limpiar contenedor
            container.classList.add("fixed", "bottom-0", "w-full", "z-50", "max-w-7xl", "mx-auto", "bg-background-light", "dark:bg-background-dark", "shadow-2xl");
            container.appendChild(navElement);
        } else {
            console.error("Container #bottom-nav-container not found!");
        }
    }
}

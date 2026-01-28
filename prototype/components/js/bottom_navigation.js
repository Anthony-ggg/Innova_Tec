/**
 * Bottom Navigation Component
 * Dynamically renders navigation based on User Role (Client, Owner, Admin)
 * Dependencies: dataManager.js (Must be loaded before or accessible)
 */

async function loadBottomNav(activeItem) {
    // Ensure DataManager is available
    if (typeof DataManager === 'undefined') {
        console.warn('DataManager not found. defaulting to static client nav.');
    }

    const user = (typeof DataManager !== 'undefined') ? DataManager.getSession() : null;
    const role = user ? user.role : 'client'; // Default to client if no session or no DataManager

    let navItems = [];

    // Define Nav Items per Role
    if (role === 'admin') {
        navItems = [
            { id: 'analytics', icon: 'monitoring', label: 'Analytics', url: '../admin/analytics.html' },
            { id: 'verifications', icon: 'verified', label: 'Verificar', url: '../admin/verifications_bussines.html' },
            // Admin Profile could be just logout or simple profile
            { id: 'profile', icon: 'person', label: 'Admin', url: '../users/user_profile.html' }
        ];
    } else if (role === 'owner') {
        navItems = [
            { id: 'business', icon: 'store', label: 'Mi Negocio', url: '../onwer/my_bussines.html' },
            { id: 'requests', icon: 'assignment', label: 'Solicitudes', url: '../onwer/request_bussines.html' },
            { id: 'profile', icon: 'person', label: 'Perfil', url: '../onwer/onwer_profile.html' }
        ];
    } else {
        // Client (Default)
        navItems = [
            { id: 'map', icon: 'map', label: 'Map', url: '../users/map.html' },
            { id: 'coupons', icon: 'local_fire_department', label: 'Hot Deals', url: '../users/hot_cupons.html' },
            { id: 'favorites', icon: 'favorite', label: 'Favorites', url: '../users/favorites_bussines.html' },
            { id: 'alerts', icon: 'notifications', label: 'Alerts', url: '../users/notifications_list.html', badge: true },
            { id: 'profile', icon: 'person', label: 'Profile', url: '../users/user_profile.html' }
        ];
    }

    // Generate HTML
    const generateNavHTML = (items) => {
        const linksHtml = items.map(item => {
            const isActive = item.id === activeItem;
            const activeClass = "text-primary font-bold";
            const inactiveClass = "text-slate-400 dark:text-slate-500 font-medium";
            const classes = isActive ? activeClass : inactiveClass;

            let badgeHtml = '';
            if (item.badge) {
                badgeHtml = `<span class="absolute top-0 right-1 h-2 w-2 rounded-full bg-red-500 border-2 border-white dark:border-slate-900" style="font-variation-settings: 'FILL' 1;"></span>`;
            }

            return `
            <a data-nav="${item.id}" href="${item.url}" class="nav-item flex flex-col items-center gap-1 relative ${classes}">
                <span class="material-symbols-outlined text-2xl" style="font-variation-settings: 'FILL' 1;">${item.icon}</span>
                ${badgeHtml}
                <span class="text-[10px]">${item.label}</span>
            </a>
            `;
        }).join('');

        return `
        <nav class="z-30 flex h-20 w-full items-start justify-evenly border-t border-slate-100 dark:border-slate-800 bg-white/90 dark:bg-background-dark/90 px-2 pt-3 backdrop-blur-xl">
            ${linksHtml}
        </nav>
        `;
    };

    const navHTML = generateNavHTML(navItems);

    // Inject
    const container = document.getElementById("bottom-nav-container");
    if (container) {
        container.innerHTML = "";
        // Ensure container styles
        container.classList.add("fixed", "bottom-0", "left-0", "right-0", "z-50", "w-full", "max-w-[480px]", "mx-auto");
        // Note: added left-0 right-0 and mx-auto max-w-[480px] to match mobile view constraints if needed, 
        // or keep original classes. Keeping similar to original but fully fixed.

        container.innerHTML = navHTML;
    } else {
        console.error("Container #bottom-nav-container not found!");
    }
}

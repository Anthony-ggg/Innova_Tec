/**
 * DataManager - Simula una base de datos usando localStorage
 * Maneja Usuarios, Negocios y Sesiones.
 */

const DataManager = {
    // Claves de Storage
    KEYS: {
        USERS: 'cuponea_users',
        BUSINESSES: 'cuponea_businesses',
        COUPONS: 'cuponea_coupons',
        ORDERS: 'cuponea_orders',
        SESSION: 'cuponea_active_session',
        INIT: 'cuponea_initialized_v2' // Bump version to force re-seed
    },

    // Inicializar datos (Seed)
    init: () => {
        if (localStorage.getItem(DataManager.KEYS.INIT) !== 'true') {
            console.log('Inicializando datos simulados...');

            // 1. Admin Default
            const adminUser = {
                id: 'admin-001',
                email: 'admin@cuponea.com',
                password: 'admin', // En prod esto sería hash
                name: 'Administrador Principal',
                role: 'admin',
                isProfileComplete: true,
                createdAt: new Date().toISOString()
            };

            // 2. Demo Owner
            const ownerUser = {
                id: 'owner-001',
                email: 'dueno@negocio.com',
                password: 'owner',
                name: 'Roberto Dueño',
                role: 'owner',
                isProfileComplete: true,
                createdAt: new Date().toISOString()
            };

            // 3. Demo Client
            const clientUser = {
                id: 'client-001',
                email: 'cliente@gmail.com',
                password: 'client',
                name: 'Ana Clienta',
                role: 'client',
                isProfileComplete: true,
                createdAt: new Date().toISOString()
            };

            DataManager.saveUsers([adminUser, ownerUser, clientUser]);

            // 4. Demo Business
            const demoBusiness = {
                id: 'bus-001',
                ownerId: 'owner-001',
                name: 'Cafetería Central',
                address: 'Av. Principal 123',
                image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA2OmTZU7mdd1aWiB51rynqMISxmy0QKp-IEPfeF6lHNTYKJEL1VrzXDiMT72aYl7MVGFmA28nL5-GNDY272l5m2Ry0TDwS1y-Ia5KV4m-ROT7Ng5S3mwaCvPvpyqDB6ZuT43mjwGVHhNZmks20fCsirn_5n4A4mt_wyqB-f6ljbzsj82fcIFF0fZiSu9jjgeC_QTR2LFa8aOSeePlYUVW8JiicaleUnyVNGOxpivJq1eZ5cGl58dAWKh1huNi27ugeJEWKiNOJs_8M',
                category: 'Restaurante',
                status: 'verified',
                stats: { views: 120, couponsRedeemed: 45 }
            };
            DataManager.saveBusinesses([demoBusiness]);

            // 5. Demo Coupons
            const coupons = [
                {
                    id: 'cpn-001',
                    businessId: 'bus-001',
                    title: '2x1 en Cappuccinos',
                    description: 'Presenta este cupón para obtener un cafe gratis.',
                    discount: '50%',
                    price: 15.00,
                    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuA2OmTZU7mdd1aWiB51rynqMISxmy0QKp-IEPfeF6lHNTYKJEL1VrzXDiMT72aYl7MVGFmA28nL5-GNDY272l5m2Ry0TDwS1y-Ia5KV4m-ROT7Ng5S3mwaCvPvpyqDB6ZuT43mjwGVHhNZmks20fCsirn_5n4A4mt_wyqB-f6ljbzsj82fcIFF0fZiSu9jjgeC_QTR2LFa8aOSeePlYUVW8JiicaleUnyVNGOxpivJq1eZ5cGl58dAWKh1huNi27ugeJEWKiNOJs_8M',
                    expires: '2026-12-31',
                    isHot: true,
                    stock: 50
                },
                {
                    id: 'cpn-002',
                    businessId: 'bus-001',
                    title: 'Postre Gratis con Almuerzo',
                    description: 'Válido de Lunes a Viernes.',
                    discount: '100% OFF',
                    price: 0,
                    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDb1MrDMzR9WXN0wFinmVAEZyCoO7Sh3MDbz8iih_pecQJFIKExLTa03nyI-UrKS_YZ2dPBTJvM7Gi87gRKXqg1aLZM5Cj9cxU2sYDcmTVMtBbp00lJ1CKjuwn2pfBRCBfb0L-zeytR1M2kIntXr8yX8gdQY_5ncxH6n7jfLw2RiiI69AF8GahsToTmHZmZ-2ZiFbd2pqa4Uqr_bumzmrC6O5igyx971E2C2ek4Gjai7Ya7M6QIziQGIGyMAWAeG-M6phlvwt9kDFgz',
                    expires: '2026-06-30',
                    isHot: false,
                    stock: 20
                },
                {
                    id: 'cpn-003',
                    businessId: 'bus-001',
                    title: '30% Descuento en Pastas',
                    description: 'La mejor pasta de la ciudad.',
                    discount: '30%',
                    price: 30.00,
                    finalPrice: 21.00,
                    image: 'https://lh3.googleusercontent.com/aida-public/AB6AXuC7emgT-oxp1AqRt4SxJDlLbHA1EK6xc31HHGvgPn0054_xGCfDmPYViqEMoEBV5BAnG4GzjgjpkMpqCWHa3aMLVBAxgA45IQmk0zmTJ1NG3YgrJEpyYBbjI2VTQcIGa4l9C1Oyo8Q7o3c5Yp8JtfJGo_eUNHY9IRamLNK6cf3zVE54O5Ep06qLaLObE4mT4VBVJ8DN9l174K8963pv-wL_FUHBBIHNCnLnxCoPu7iLFxBHIDBy-N70zWjLuXcY71_6Yb6haS8A8tf3',
                    expires: '2026-03-15',
                    isHot: true,
                    stock: 5
                }
            ];
            DataManager.saveCoupons(coupons);

            localStorage.setItem(DataManager.KEYS.INIT, 'true');
        }
    },

    // --- USERS ---
    getUsers: () => {
        return JSON.parse(localStorage.getItem(DataManager.KEYS.USERS) || '[]');
    },

    saveUsers: (users) => {
        localStorage.setItem(DataManager.KEYS.USERS, JSON.stringify(users));
    },

    createUser: (userData) => {
        const users = DataManager.getUsers();
        // Check duplicate
        if (users.find(u => u.email === userData.email)) {
            throw new Error('El usuario ya existe');
        }

        const newUser = {
            id: 'usr-' + Date.now(),
            createdAt: new Date().toISOString(),
            isProfileComplete: false, // Default false until profile step
            ...userData // password, email, defaults
        };

        users.push(newUser);
        DataManager.saveUsers(users);
        return newUser;
    },

    updateUser: (id, updates) => {
        const users = DataManager.getUsers();
        const index = users.findIndex(u => u.id === id);
        if (index === -1) throw new Error('Usuario no encontrado');

        users[index] = { ...users[index], ...updates };
        DataManager.saveUsers(users);

        // Update session if it's the current user
        const session = DataManager.getSession();
        if (session && session.id === id) {
            DataManager.setSession(users[index]);
        }

        return users[index];
    },

    findUserByEmail: (email) => {
        const users = DataManager.getUsers();
        return users.find(u => u.email === email);
    },

    authenticate: (email, password) => {
        const user = DataManager.findUserByEmail(email);
        if (!user) return null;
        if (user.password !== password) return null; // Simple check for prototype
        return user;
    },

    // --- SESSION ---
    setSession: (user) => {
        // Don't store password in session
        const { password, ...safeUser } = user;
        localStorage.setItem(DataManager.KEYS.SESSION, JSON.stringify(safeUser));
    },

    getSession: () => {
        return JSON.parse(localStorage.getItem(DataManager.KEYS.SESSION) || 'null');
    },

    clearSession: () => {
        localStorage.removeItem(DataManager.KEYS.SESSION);
    },

    // --- BUSINESSES ---
    getBusinesses: () => {
        return JSON.parse(localStorage.getItem(DataManager.KEYS.BUSINESSES) || '[]');
    },

    saveBusinesses: (list) => {
        localStorage.setItem(DataManager.KEYS.BUSINESSES, JSON.stringify(list));
    },

    getBusinessByOwner: (ownerId) => {
        const list = DataManager.getBusinesses();
        return list.find(b => b.ownerId === ownerId);
    },

    getBusinessesByOwner: (ownerId) => {
        const list = DataManager.getBusinesses();
        return list.filter(b => b.ownerId === ownerId);
    },

    createBusiness: (businessData) => {
        const list = DataManager.getBusinesses();
        const newBusiness = {
            id: 'bus-' + Date.now(),
            status: 'pending', // Default status
            ratings: 0,
            stats: { views: 0, couponsRedeemed: 0 },
            createdAt: new Date().toISOString(),
            ...businessData
        };
        list.push(newBusiness);
        DataManager.saveBusinesses(list);
        return newBusiness;
    },

    updateBusinessStatus: (id, newStatus) => {
        const list = DataManager.getBusinesses();
        const index = list.findIndex(b => b.id === id);
        if (index !== -1) {
            list[index].status = newStatus;
            DataManager.saveBusinesses(list);
            return true;
        }
        return false;
    },

    // --- COUPONS ---
    getCoupons: () => {
        return JSON.parse(localStorage.getItem(DataManager.KEYS.COUPONS) || '[]');
    },

    saveCoupons: (list) => {
        localStorage.setItem(DataManager.KEYS.COUPONS, JSON.stringify(list));
    },

    getCouponById: (id) => {
        const list = DataManager.getCoupons();
        return list.find(c => c.id === id);
    },

    // --- ORDERS ---
    getOrders: () => {
        return JSON.parse(localStorage.getItem(DataManager.KEYS.ORDERS) || '[]');
    },

    saveOrders: (list) => {
        localStorage.setItem(DataManager.KEYS.ORDERS, JSON.stringify(list));
    },

    createOrder: (orderData) => {
        const orders = DataManager.getOrders();
        const newOrder = {
            id: 'ord-' + Date.now(),
            createdAt: new Date().toISOString(),
            status: 'completed',
            ...orderData
        };
        orders.push(newOrder);
        DataManager.saveOrders(orders);
        return newOrder;
    },

    getOrdersByUser: (userId) => {
        const list = DataManager.getOrders();
        return list
            .filter(o => o.userId === userId)
            .sort((a, b) => new Date(b.createdAt) - new Date(a.createdAt));
    }
};

// Auto-init on load
DataManager.init();

// Expose globally
window.DataManager = DataManager;

/**
 * Auth Manager
 * Handles Login, Register, Logout and Redirects based on roles
 * Dependencies: dataManager.js
 */

const Auth = {
    login: (email, password) => {
        try {
            const user = DataManager.authenticate(email, password);
            if (!user) {
                return { success: false, message: 'Credenciales inválidas' };
            }
            DataManager.setSession(user);
            return { success: true, user: user };
        } catch (e) {
            console.error(e);
            return { success: false, message: 'Ocurrió un error' };
        }
    },

    register: (email, password) => {
        try {
            const newUser = DataManager.createUser({
                email,
                password,
                role: 'client' // Default role, user can change later or in profile step
            });
            DataManager.setSession(newUser);
            return { success: true, user: newUser };
        } catch (e) {
            return { success: false, message: e.message };
        }
    },

    logout: () => {
        DataManager.clearSession();
        window.location.href = '/prototype/auth/singIn.html'; // Adjust path as needed
    },

    checkAuth: () => {
        const user = DataManager.getSession();
        if (!user) {
            // If we are not in auth pages, redirect to login
            if (!window.location.href.includes('auth/')) {
                window.location.href = '/prototype/auth/singIn.html';
            }
        }
        return user;
    },

    redirectBasedOnUser: (user) => {
        if (!user.isProfileComplete) {
            // Force profile completion
            // Construct absolute path relative to repo root if possible, or relative
            // Assuming we are in /auth/ or root
            window.location.href = '../users/complete_profile.html';
            return;
        }

        switch (user.role) {
            case 'admin':
                window.location.href = '../admin/analytics.html';
                break;
            case 'owner':
                // Check if has business
                const business = DataManager.getBusinessByOwner(user.id);
                if (business) {
                    window.location.href = '../onwer/my_bussines.html';
                } else {
                    window.location.href = '../onwer/request_bussines.html';
                }
                break;
            case 'client':
            default:
                window.location.href = '../users/map.html';
                break;
        }
    }
};

window.Auth = Auth;

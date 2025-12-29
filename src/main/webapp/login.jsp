<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login - Gestão de Funcionários</title>
<script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-color: #f7fee7; /* lime-50 */
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center p-4">

    <!-- Login Container -->
    <div class="w-full max-w-md bg-white rounded-2xl shadow-xl p-8 border border-lime-100">
        
        <!-- Simplified Header -->
        <div class="mb-8 text-center">
            <div class="inline-flex items-center justify-center w-12 h-12 bg-lime-100 rounded-xl mb-4">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 text-lime-600" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
                </svg>
            </div>
            <h1 class="text-2xl font-bold text-gray-800">Login</h1>
            <p class="text-gray-500 text-sm mt-1">Acesse sua conta</p>
        </div>

        <!-- Form Section -->
        <form id="loginForm" action="Login" method="POST" class="space-y-6">
            
            <!-- Email Input -->
            <div>
                <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email ou Usuário</label>
                <input 
                    type="text" 
                    id="email" 
                    name="username"
                    placeholder="hello@example.com"
                    class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:ring-2 focus:ring-lime-500 focus:border-lime-500 outline-none transition-all"
                    required
                >
            </div>

            <!-- Password Input -->
            <div>
                <div class="flex justify-between items-center mb-1">
                    <label for="password" class="block text-sm font-medium text-gray-700">Senha</label>
                    <!-- 
                    <a href="#" class="text-xs text-lime-600 hover:text-lime-700 font-semibold transition-colors">Forgot password?</a>
                    -->
                </div>
                <input 
                    type="password" 
                    id="password" 
                    name="password"
                    placeholder="••••••••"
                    class="w-full px-4 py-3 rounded-lg border border-gray-200 focus:ring-2 focus:ring-lime-500 focus:border-lime-500 outline-none transition-all"
                    required
                >
            </div>

            <!-- Remember Me -->
            <!-- 
            <div class="flex items-center">
                <input 
                    type="checkbox" 
                    id="remember" 
                    class="w-4 h-4 text-lime-600 border-gray-300 rounded focus:ring-lime-500"
                >
                <label for="remember" class="ml-2 block text-sm text-gray-600">
                    Keep me signed in
                </label>
            </div>
            -->

            <!-- Submit Button -->
            <button 
                type="submit" 
                class="w-full bg-lime-500 hover:bg-lime-600 text-white font-bold py-3 rounded-lg shadow-lg shadow-lime-200 transition-all transform active:scale-[0.98]"
            >
                Entrar
            </button>

            <!-- Status Message Box (Hidden by default) -->
            <div id="statusMessage" class="hidden p-3 rounded-lg text-sm text-center"></div>

            <!-- Footer Link -->
            <!--
            <p class="text-center text-sm text-gray-500">
                Don't have an account? 
                <a href="#" class="text-lime-600 font-bold hover:underline">Create Account</a>
            </p>
            -->
        </form>
    </div>

</body>
</html>
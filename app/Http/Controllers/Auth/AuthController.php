<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function showLogin()
    {
        if (Auth::check()) {
            return $this->redirectByRole();
        }

        return redirect()->to(route('home') . '#login');
    }

    public function login(Request $request)
    {
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ], [
            'username.required' => 'Username wajib diisi.',
            'password.required' => 'Password wajib diisi.',
        ]);

        $credentials = $request->only('username', 'password');

        if (!Auth::attempt($credentials, $request->boolean('remember'))) {
            return back()
                ->withInput($request->only('username'))
                ->with('error', 'Username atau password salah.');
        }

        $request->session()->regenerate();
        $user = Auth::user();

        return $this->redirectByRole();
    }

    public function adminLogin(Request $request)
    {
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ], [
            'username.required' => 'Username admin wajib diisi.',
            'password.required' => 'Password admin wajib diisi.',
        ]);

        $credentials = $request->only('username', 'password');

        if (!Auth::attempt($credentials, $request->boolean('remember'))) {
            return back()
                ->withInput($request->only('username'))
                ->with('error', 'Username admin atau password salah.');
        }

        $request->session()->regenerate();

        if (!Auth::user()->isAdmin()) {
            Auth::logout();

            return back()
                ->withInput($request->only('username'))
                ->with('error', 'Form login admin hanya untuk akun admin.');
        }

        return $this->redirectByRole();
    }

    public function showRegister()
    {
        if (Auth::check()) {
            return $this->redirectByRole();
        }

        return view('auth.register');
    }

    public function register(Request $request)
    {
        $request->validate([
            'username' => 'required|string|max:50|unique:users,username',
            'password' => 'required|string|min:6',
        ], [
            'username.required' => 'Username wajib diisi.',
            'username.unique' => 'Username sudah digunakan, pilih yang lain.',
            'password.required' => 'Password wajib diisi.',
            'password.min' => 'Password minimal 6 karakter.',
        ]);

        $user = User::create([
            'nama' => $request->username,
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'role' => 'petani',
        ]);

        Auth::login($user);

        return redirect()
            ->route('user.profile.edit')
            ->with('success', 'Registrasi berhasil. Anda bisa melengkapi profil nanti jika diperlukan.');
    }

    public function logout(Request $request)
    {
        if (Auth::check()) {
            Auth::logout();
        }

        if ($request->hasSession()) {
            $request->session()->invalidate();
            $request->session()->regenerateToken();
        }

        return redirect()->route('home')->with('success', 'Anda telah berhasil logout.');
    }

    private function redirectByRole()
    {
        return Auth::user()->isAdmin()
            ? redirect()->route('admin.dashboard')
            : redirect()->route('user.dashboard');
    }

}

<?php

namespace App\Http\Controllers;

use App\Support\ProjectImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    public function edit()
    {
        return view('profile.edit', [
            'user' => Auth::user(),
        ]);
    }

    public function update(Request $request)
    {
        $user = Auth::user();

        $validated = $request->validate([
            'nama' => 'required|string|max:100',
            'username' => ['required', 'string', 'max:50', Rule::unique('users', 'username')->ignore($user->id)],
            'alamat' => 'nullable|string',
            'catatan_profil' => 'nullable|string',
            'foto_profil' => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'password_lama' => 'nullable|string',
            'password' => 'nullable|string|min:6|confirmed',
        ], [
            'nama.required' => 'Nama wajib diisi.',
            'username.required' => 'Username wajib diisi.',
            'password.min' => 'Password minimal 6 karakter.',
            'password.confirmed' => 'Konfirmasi password tidak cocok.',
        ]);

        if (!empty($validated['password'])) {
            if (empty($validated['password_lama']) || !Hash::check($validated['password_lama'], $user->password)) {
                return back()
                    ->withInput($request->except(['password', 'password_confirmation', 'password_lama']))
                    ->withErrors(['password_lama' => 'Password lama tidak sesuai.']);
            }

            $user->password = Hash::make($validated['password']);
        }

        if ($request->hasFile('foto_profil')) {
            ProjectImage::delete($user->foto_profil);
            $user->foto_profil = ProjectImage::store($request->file('foto_profil'), 'profil');
        }

        $user->fill([
            'nama' => $validated['nama'],
            'username' => $validated['username'],
            'alamat' => $validated['alamat'] ?? null,
            'catatan_profil' => $validated['catatan_profil'] ?? null,
        ]);

        $user->save();

        return back()->with('success', 'Profil berhasil diperbarui.');
    }

    public function sendVerificationEmail(Request $request)
    {
        return back()->withErrors(['profile' => 'Fitur email telah dinonaktifkan.']);
    }

    public function verifyEmail(Request $request)
    {
        return redirect()->route('user.profile.edit')->withErrors(['profile' => 'Fitur verifikasi email telah dinonaktifkan.']);
    }
}

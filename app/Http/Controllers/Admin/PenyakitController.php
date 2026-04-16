<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gejala;
use App\Models\Penyakit;
use App\Support\AutoCodeGenerator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PenyakitController extends Controller
{
    public function index()
    {
        $penyakit = Penyakit::withCount('gejala')->orderBy('kode')->paginate(10);
        return view('admin.penyakit.index', compact('penyakit'));
    }

    public function create()
    {
        $gejala = Gejala::orderBy('kode')->get();
        $nextCode = AutoCodeGenerator::generate(Penyakit::class, 'kode', 'P');
        return view('admin.penyakit.create', compact('gejala', 'nextCode'));
    }

    public function store(Request $request)
    {
        $request->merge([
            'kode' => AutoCodeGenerator::generate(Penyakit::class, 'kode', 'P'),
        ]);

        $request->validate([
            'kode'      => 'required|string|max:10|unique:penyakit,kode',
            'nama'      => 'required|string|max:100',
            'deskripsi' => 'nullable|string',
            'gambar'    => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'gejala'    => 'nullable|array',
            'gejala.*'  => 'exists:gejala,id',
        ]);

        $data = $request->only('kode', 'nama', 'deskripsi');
        if ($request->hasFile('gambar')) {
            $data['gambar'] = $request->file('gambar')->store('penyakit', 'public');
        }

        $p = Penyakit::create($data);

        if ($request->filled('gejala')) {
            $p->gejala()->sync($request->gejala);
        }

        return redirect()->route('admin.penyakit.index')
            ->with('success', 'Data penyakit berhasil ditambahkan.');
    }

    public function edit(Penyakit $penyakit)
    {
        $gejala         = Gejala::orderBy('kode')->get();
        $gejalaSelected = $penyakit->gejala->pluck('id')->toArray();
        return view('admin.penyakit.edit', compact('penyakit', 'gejala', 'gejalaSelected'));
    }

    public function update(Request $request, Penyakit $penyakit)
    {
        $request->validate([
            'kode'      => 'required|string|max:10|unique:penyakit,kode,' . $penyakit->id,
            'nama'      => 'required|string|max:100',
            'deskripsi' => 'nullable|string',
            'gambar'    => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
            'gejala'    => 'nullable|array',
            'gejala.*'  => 'exists:gejala,id',
        ]);

        $data = $request->only('kode', 'nama', 'deskripsi');
        if ($request->hasFile('gambar')) {
            if ($penyakit->gambar) {
                Storage::disk('public')->delete($penyakit->gambar);
            }
            $data['gambar'] = $request->file('gambar')->store('penyakit', 'public');
        }

        $penyakit->update($data);
        $penyakit->gejala()->sync($request->gejala ?? []);

        return redirect()->route('admin.penyakit.index')
            ->with('success', 'Data penyakit berhasil diperbarui.');
    }

    public function destroy(Penyakit $penyakit)
    {
        if ($penyakit->gambar) {
            Storage::disk('public')->delete($penyakit->gambar);
        }
        $penyakit->delete();
        return redirect()->route('admin.penyakit.index')
            ->with('success', 'Data penyakit berhasil dihapus.');
    }
}

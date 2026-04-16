<?php
// ── GejalaController ─────────────────────────────────────────
namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Gejala;
use App\Support\AutoCodeGenerator;
use Illuminate\Http\Request;

class GejalaController extends Controller
{
    public function index()
    {
        $gejala = Gejala::withCount('penyakit')->orderBy('kode')->paginate(15);
        return view('admin.gejala.index', compact('gejala'));
    }

    public function create()
    {
        $nextCode = AutoCodeGenerator::generate(Gejala::class, 'kode', 'G');
        return view('admin.gejala.create', compact('nextCode'));
    }

    public function store(Request $request)
    {
        $request->merge([
            'kode' => AutoCodeGenerator::generate(Gejala::class, 'kode', 'G'),
        ]);

        $request->validate([
            'kode'        => 'required|string|max:10|unique:gejala,kode',
            'nama_gejala' => 'required|string|max:200',
        ]);
        Gejala::create($request->only('kode', 'nama_gejala'));
        return redirect()->route('admin.gejala.index')
            ->with('success', 'Gejala berhasil ditambahkan.');
    }

    public function edit(Gejala $gejala)
    {
        return view('admin.gejala.edit', compact('gejala'));
    }

    public function update(Request $request, Gejala $gejala)
    {
        $request->validate([
            'kode'        => 'required|string|max:10|unique:gejala,kode,' . $gejala->id,
            'nama_gejala' => 'required|string|max:200',
        ]);
        $gejala->update($request->only('kode', 'nama_gejala'));
        return redirect()->route('admin.gejala.index')
            ->with('success', 'Gejala berhasil diperbarui.');
    }

    public function destroy(Gejala $gejala)
    {
        $gejala->delete();
        return redirect()->route('admin.gejala.index')
            ->with('success', 'Gejala berhasil dihapus.');
    }
}

<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Pestisida;
use App\Support\AutoCodeGenerator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PestisidaController extends Controller
{
    public function index()
    {
        $pestisida = Pestisida::orderBy('kode')->paginate(10);
        return view('admin.pestisida.index', compact('pestisida'));
    }

    public function create()
    {
        $nextCode = AutoCodeGenerator::generate(Pestisida::class, 'kode', 'PS');
        return view('admin.pestisida.create', compact('nextCode'));
    }

    public function store(Request $request)
    {
        $request->merge([
            'kode' => AutoCodeGenerator::generate(Pestisida::class, 'kode', 'PS'),
        ]);

        $request->validate([
            'kode'         => 'required|string|max:10|unique:pestisida,kode',
            'nama'         => 'required|string|max:100',
            'jenis'        => 'required|in:fungisida,bakterisida,insektisida,herbisida',
            'bahan_aktif'  => 'nullable|string|max:200',
            'kandungan_detail' => 'nullable|string',
            'fungsi' => 'nullable|string',
            'dosis'        => 'nullable|string|max:100',
            'takaran' => 'nullable|string|max:255',
            'efek_penggunaan' => 'nullable|string',
            'cara_aplikasi' => 'nullable|string',
            'jadwal_umur_aplikasi' => 'nullable|string',
            'frekuensi_aplikasi' => 'nullable|string',
            'harga'        => 'required|numeric|min:0',
            'satuan_harga' => 'required|string|max:30',
            'gambar'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);
        $data = $request->only(
            'kode',
            'nama',
            'jenis',
            'bahan_aktif',
            'kandungan_detail',
            'fungsi',
            'dosis',
            'takaran',
            'efek_penggunaan',
            'cara_aplikasi',
            'jadwal_umur_aplikasi',
            'frekuensi_aplikasi',
            'harga',
            'satuan_harga'
        );
        if ($request->hasFile('gambar')) {
            $data['gambar'] = $request->file('gambar')->store('pestisida', 'public');
        }
        Pestisida::create($data);
        return redirect()->route('admin.pestisida.index')
            ->with('success', 'Data pestisida berhasil ditambahkan.');
    }

    public function edit(Pestisida $pestisida)
    {
        return view('admin.pestisida.edit', compact('pestisida'));
    }

    public function update(Request $request, Pestisida $pestisida)
    {
        $request->validate([
            'kode'         => 'required|string|max:10|unique:pestisida,kode,' . $pestisida->id,
            'nama'         => 'required|string|max:100',
            'jenis'        => 'required|in:fungisida,bakterisida,insektisida,herbisida',
            'bahan_aktif'  => 'nullable|string|max:200',
            'kandungan_detail' => 'nullable|string',
            'fungsi' => 'nullable|string',
            'dosis'        => 'nullable|string|max:100',
            'takaran' => 'nullable|string|max:255',
            'efek_penggunaan' => 'nullable|string',
            'cara_aplikasi' => 'nullable|string',
            'jadwal_umur_aplikasi' => 'nullable|string',
            'frekuensi_aplikasi' => 'nullable|string',
            'harga'        => 'required|numeric|min:0',
            'satuan_harga' => 'required|string|max:30',
            'gambar'       => 'nullable|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);
        $data = $request->only(
            'kode',
            'nama',
            'jenis',
            'bahan_aktif',
            'kandungan_detail',
            'fungsi',
            'dosis',
            'takaran',
            'efek_penggunaan',
            'cara_aplikasi',
            'jadwal_umur_aplikasi',
            'frekuensi_aplikasi',
            'harga',
            'satuan_harga'
        );
        if ($request->hasFile('gambar')) {
            if ($pestisida->gambar) {
                Storage::disk('public')->delete($pestisida->gambar);
            }
            $data['gambar'] = $request->file('gambar')->store('pestisida', 'public');
        }
        $pestisida->update($data);
        return redirect()->route('admin.pestisida.index')
            ->with('success', 'Data pestisida berhasil diperbarui.');
    }

    public function destroy(Pestisida $pestisida)
    {
        if ($pestisida->gambar) {
            Storage::disk('public')->delete($pestisida->gambar);
        }
        $pestisida->delete();
        return redirect()->route('admin.pestisida.index')
            ->with('success', 'Data pestisida berhasil dihapus.');
    }
}

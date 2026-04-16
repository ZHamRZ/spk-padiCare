<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Kriteria;
use Illuminate\Http\Request;

class KriteriaController extends Controller
{
    public function index()
    {
        $kriteria = Kriteria::orderBy('kode')->get();
        $totalBobot = $kriteria->sum('bobot');
        return view('admin.kriteria.index', compact('kriteria', 'totalBobot'));
    }

    public function edit(Kriteria $kriteria)
    {
        return view('admin.kriteria.edit', compact('kriteria'));
    }

    public function update(Request $request, Kriteria $kriteria)
    {
        $request->validate([
            'nama'       => 'required|string|max:100',
            'jenis'      => 'required|in:benefit,cost',
            'bobot'      => 'required|numeric|min:0|max:1',
            'keterangan' => 'nullable|string',
        ]);
        $kriteria->update($request->only('nama', 'jenis', 'bobot', 'keterangan'));
        return redirect()->route('admin.kriteria.index')
            ->with('success', 'Kriteria & bobot berhasil diperbarui.');
    }
}

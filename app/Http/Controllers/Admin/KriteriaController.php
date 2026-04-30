<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Kriteria;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class KriteriaController extends Controller
{
    public function index()
    {
        $kriteria = Kriteria::orderBy('kode')->get();
        $averageBobot = $kriteria->avg('bobot') ?? 0;
        return view('admin.kriteria.index', compact('kriteria', 'averageBobot'));
    }

    public function updateBulk(Request $request)
    {
        $request->validate([
            'kriteria' => 'required|array',
            'kriteria.*.nama' => 'required|string|max:100',
            'kriteria.*.jenis' => 'required|in:benefit,cost',
            'kriteria.*.bobot' => 'required|numeric|min:0|max:1',
            'kriteria.*.keterangan' => 'nullable|string',
        ]);

        try {
            DB::beginTransaction();
            
            foreach ($request->kriteria as $id => $data) {
                $kriteria = Kriteria::find($id);
                if ($kriteria) {
                    $kriteria->update([
                        'nama'       => $data['nama'],
                        'jenis'      => $data['jenis'],
                        'bobot'      => round((float) $data['bobot'], 2),
                        'keterangan' => $data['keterangan'] ?? null,
                    ]);
                }
            }
            
            DB::commit();
            
            return redirect()->route('admin.kriteria.index')
                ->with('success', 'Semua parameter prioritas berhasil diperbarui.');
        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->route('admin.kriteria.index')
                ->with('error', 'Gagal memperbarui data: ' . $e->getMessage());
        }
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
            ->with('success', 'Parameter prioritas berhasil diperbarui.');
    }
}

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('users', function (Blueprint $table) {
            $table->string('no_telp', 30)->nullable()->after('email');
            $table->text('alamat')->nullable()->after('no_telp');
            $table->text('catatan_profil')->nullable()->after('alamat');
        });

        Schema::table('rekomendasi', function (Blueprint $table) {
            $table->string('preferensi_label', 50)->nullable()->after('tanggal');
            $table->json('preferensi_pengguna')->nullable()->after('preferensi_label');
        });
    }

    public function down(): void
    {
        Schema::table('rekomendasi', function (Blueprint $table) {
            $table->dropColumn(['preferensi_label', 'preferensi_pengguna']);
        });

        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn(['no_telp', 'alamat', 'catatan_profil']);
        });
    }
};

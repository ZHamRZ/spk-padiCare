<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::table('penyakit_gejala', function (Blueprint $table) {
            if (!Schema::hasColumn('penyakit_gejala', 'mb')) {
                $table->decimal('mb', 4, 3)->default(0.700)->after('id_gejala');
            }

            if (!Schema::hasColumn('penyakit_gejala', 'md')) {
                $table->decimal('md', 4, 3)->default(0.100)->after('mb');
            }
        });

        if (!Schema::hasTable('penyakit_pupuk')) {
            Schema::create('penyakit_pupuk', function (Blueprint $table) {
                $table->id();
                $table->foreignId('id_penyakit')->constrained('penyakit')->cascadeOnDelete();
                $table->foreignId('id_pupuk')->constrained('pupuk')->cascadeOnDelete();
                $table->decimal('mb', 4, 3)->default(0.700);
                $table->decimal('md', 4, 3)->default(0.100);
                $table->timestamps();
                $table->unique(['id_penyakit', 'id_pupuk']);
            });
        }

        if (!Schema::hasTable('penyakit_pestisida')) {
            Schema::create('penyakit_pestisida', function (Blueprint $table) {
                $table->id();
                $table->foreignId('id_penyakit')->constrained('penyakit')->cascadeOnDelete();
                $table->foreignId('id_pestisida')->constrained('pestisida')->cascadeOnDelete();
                $table->decimal('mb', 4, 3)->default(0.700);
                $table->decimal('md', 4, 3)->default(0.100);
                $table->timestamps();
                $table->unique(['id_penyakit', 'id_pestisida']);
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('penyakit_pestisida');
        Schema::dropIfExists('penyakit_pupuk');

        Schema::table('penyakit_gejala', function (Blueprint $table) {
            if (Schema::hasColumn('penyakit_gejala', 'mb')) {
                $table->dropColumn('mb');
            }

            if (Schema::hasColumn('penyakit_gejala', 'md')) {
                $table->dropColumn('md');
            }
        });
    }
};

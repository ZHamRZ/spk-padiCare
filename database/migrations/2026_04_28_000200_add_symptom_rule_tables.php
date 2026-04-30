<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        if (!Schema::hasTable('gejala_pupuk')) {
            Schema::create('gejala_pupuk', function (Blueprint $table) {
                $table->id();
                $table->foreignId('id_gejala')->constrained('gejala')->cascadeOnDelete();
                $table->foreignId('id_pupuk')->constrained('pupuk')->cascadeOnDelete();
                $table->decimal('mb', 4, 3)->default(0.700);
                $table->decimal('md', 4, 3)->default(0.100);
                $table->timestamps();
                $table->unique(['id_gejala', 'id_pupuk']);
            });
        }

        if (!Schema::hasTable('gejala_pestisida')) {
            Schema::create('gejala_pestisida', function (Blueprint $table) {
                $table->id();
                $table->foreignId('id_gejala')->constrained('gejala')->cascadeOnDelete();
                $table->foreignId('id_pestisida')->constrained('pestisida')->cascadeOnDelete();
                $table->decimal('mb', 4, 3)->default(0.700);
                $table->decimal('md', 4, 3)->default(0.100);
                $table->timestamps();
                $table->unique(['id_gejala', 'id_pestisida']);
            });
        }
    }

    public function down(): void
    {
        Schema::dropIfExists('gejala_pestisida');
        Schema::dropIfExists('gejala_pupuk');
    }
};

<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // Drop rating_pestisida table (unused)
        Schema::dropIfExists('rating_pestisida');

        // Drop rating_pupuk table (unused)
        Schema::dropIfExists('rating_pupuk');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Recreate rating_pupuk table
        Schema::create('rating_pupuk', function ($table) {
            $table->id();
            $table->unsignedBigInteger('id_pupuk');
            $table->unsignedBigInteger('id_kriteria');
            $table->unsignedBigInteger('id_penyakit');
            $table->decimal('nilai', 5, 2);
            $table->timestamps();

            $table->unique(['id_pupuk', 'id_kriteria', 'id_penyakit']);
            $table->foreign('id_kriteria')->references('id')->on('kriteria')->onDelete('cascade');
            $table->foreign('id_penyakit')->references('id')->on('penyakit')->onDelete('cascade');
            $table->foreign('id_pupuk')->references('id')->on('pupuk')->onDelete('cascade');
        });

        // Recreate rating_pestisida table
        Schema::create('rating_pestisida', function ($table) {
            $table->id();
            $table->unsignedBigInteger('id_pestisida');
            $table->unsignedBigInteger('id_kriteria');
            $table->unsignedBigInteger('id_penyakit');
            $table->decimal('nilai', 5, 2);
            $table->timestamps();

            $table->unique(['id_pestisida', 'id_kriteria', 'id_penyakit']);
            $table->foreign('id_kriteria')->references('id')->on('kriteria')->onDelete('cascade');
            $table->foreign('id_penyakit')->references('id')->on('penyakit')->onDelete('cascade');
            $table->foreign('id_pestisida')->references('id')->on('pestisida')->onDelete('cascade');
        });
    }
};

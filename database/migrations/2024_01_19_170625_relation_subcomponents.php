<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('relation_subcomponent', function (Blueprint $table) {
            $table->id();
            $table->foreignId('subcomponent_related_id')->constrained('subcomponent')
                ->on('subcomponent')
                ->onDelete('cascade');
            $table->foreignId('subcomponent_id')->references('id')->on('subcomponent')
                ->onDelete('cascade');
            // Otros campos para la relación muchos a muchos
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('relation_subcomponent');

    }
};

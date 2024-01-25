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
        Schema::table('subcomponent', function (Blueprint $table) {
            // Agrega la columna 'order' después de alguna otra columna existente
            $table->integer('order')->after('subcomponent_id')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('subcomponent', function (Blueprint $table) {
            //
        });
    }
};

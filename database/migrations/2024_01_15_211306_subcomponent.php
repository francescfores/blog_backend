<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('subcomponent', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->unsignedBigInteger('component_child_id')->nullable();
            $table->foreign('component_child_id')->references('id')->on('component')
                ->onDelete('cascade');
            $table->unsignedBigInteger('component_parent_id')->nullable();
            $table->foreign('component_parent_id')->references('id')->on('component')
                ->onDelete('cascade');
            $table->unsignedBigInteger('subcomponent_id')->nullable(); // Nuevo campo

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('subcomponent');
    }
};

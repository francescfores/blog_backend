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
        Schema::create('component', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            //$table->string('num')->nullable();
            $table->text('name');
            $table->string('desc');
            $table->unsignedBigInteger('component_type_id')->nullable();
            $table->foreign('component_type_id')->references('id')->on('component_type')
                ->onDelete('cascade');
            //$table->string('img')->nullable();
            //$table->string('img_url')->nullable();
            //$table->unsignedBigInteger('recycled_id')->nullable();
            //$table->unsignedBigInteger('copied_id')->nullable();
            //$table->boolean('global')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('component');
    }
};

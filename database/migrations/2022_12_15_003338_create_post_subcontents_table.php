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
        Schema::create('post_subcontents', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->unsignedBigInteger('content_child_id')->nullable();
            $table->foreign('content_child_id')->references('id')->on('post_contents')
                ->onDelete('cascade');
            $table->unsignedBigInteger('content_parent_id')->nullable();
            $table->foreign('content_parent_id')->references('id')->on('post_contents')
                ->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('post_subcontents');
    }
};

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
        Schema::create('post_contents', function (Blueprint $table) {
            $table->id();
            $table->timestamps();
            $table->string('num');
            $table->text('name');
            $table->string('desc');
            $table->string('img')->nullable();
            $table->string('img_url')->nullable();
            $table->unsignedBigInteger('post_id')->nullable();
            $table->foreign('post_id')->references('id')->on('posts')
                ->onDelete('cascade');
            $table->unsignedBigInteger('post_content_type_id')->nullable();
            $table->foreign('post_content_type_id')->references('id')->on('post_content_types')
                ->onDelete('cascade');
            $table->unsignedBigInteger('post_content_id')->nullable();
            $table->foreign('post_content_id')->references('id')->on('post_contents')
                ->onDelete('cascade');
                $table->unsignedBigInteger('recycled_id')->nullable();
                $table->unsignedBigInteger('copied_id')->nullable();
                $table->boolean('global')->nullable();

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('post_contents');
    }
};

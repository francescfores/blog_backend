<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    //exec seeder
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('clients', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('nick');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
//            $table->string('name');
//            $table->string('surnames');
//            $table->string('dni');
//            $table->string('phone');
//            $table->string('address');
//            $table->string('address_detail');
//            $table->string('notes');
//            $table->string('country');
//            $table->string('zip');
//            $table->string('city');
//            $table->string('province');
//            $table->string('location');
//            $table->string('lat');
//            $table->string('lng');
            //$table->string('gender');
            //$table->string('points');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //        Schema::table('businesses', function (Blueprint $table) {
//            $table->dropForeign(['businesses_federation_id_foreign']);
//            $table->dropColumn('businesses_federation_id_foreign');
//            $table->dropForeign(['businesses_user_id_foreign']);
//            $table->dropColumn('businesses_user_id_foreign');
//        });
        Schema::dropIfExists('clients');
    }
};

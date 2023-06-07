<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // \App\Models\User::factory(10)->create();

        // \App\Models\User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);
        $user = User::create([
            'id' => '1',
            'name' => 'superadmin',
            'email' => 'superadmin@gmail.com',
            'email_verified_at' => NULL,
            'password' => Hash::make('123456'),
            'phone' => '977502170',
            'address' => 'Calle',
            'firstName' => 'super',
            'lastName' => 'admin',
        ]);
    }
}

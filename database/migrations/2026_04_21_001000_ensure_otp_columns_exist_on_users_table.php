<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        $columnsToAdd = [];

        if (!Schema::hasColumn('users', 'phone_verified_at')) {
            $columnsToAdd[] = 'phone_verified_at';
        }

        if (!Schema::hasColumn('users', 'login_otp_code')) {
            $columnsToAdd[] = 'login_otp_code';
        }

        if (!Schema::hasColumn('users', 'login_otp_expires_at')) {
            $columnsToAdd[] = 'login_otp_expires_at';
        }

        if (!Schema::hasColumn('users', 'login_otp_sent_at')) {
            $columnsToAdd[] = 'login_otp_sent_at';
        }

        if ($columnsToAdd === []) {
            return;
        }

        Schema::table('users', function (Blueprint $table) use ($columnsToAdd) {
            foreach ($columnsToAdd as $column) {
                match ($column) {
                    'phone_verified_at' => $table->timestamp('phone_verified_at')->nullable()->after('email_verified_at'),
                    'login_otp_code' => $table->string('login_otp_code')->nullable()->after('remember_token'),
                    'login_otp_expires_at' => $table->timestamp('login_otp_expires_at')->nullable()->after('login_otp_code'),
                    'login_otp_sent_at' => $table->timestamp('login_otp_sent_at')->nullable()->after('login_otp_expires_at'),
                    default => null,
                };
            }
        });
    }

    public function down(): void
    {
        $columnsToDrop = array_values(array_filter([
            Schema::hasColumn('users', 'phone_verified_at') ? 'phone_verified_at' : null,
            Schema::hasColumn('users', 'login_otp_code') ? 'login_otp_code' : null,
            Schema::hasColumn('users', 'login_otp_expires_at') ? 'login_otp_expires_at' : null,
            Schema::hasColumn('users', 'login_otp_sent_at') ? 'login_otp_sent_at' : null,
        ]));

        if ($columnsToDrop === []) {
            return;
        }

        Schema::table('users', function (Blueprint $table) use ($columnsToDrop) {
            $table->dropColumn($columnsToDrop);
        });
    }
};

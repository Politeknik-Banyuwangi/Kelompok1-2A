# SirDi
## _Simple Point Of Sales WebApp For Tyas Grosir_
[![Laravel](https://github.com/galangw/PBLKasir/actions/workflows/testing.yml/badge.svg)](https://github.com/galangw/PBLKasir/actions/workflows/testing.yml) [![Laravel](https://img.shields.io/github/v/release/galangw/PBLKasir)](https://github.com/galangw/PBLKasir/releases) [![Laravel](https://img.shields.io/github/commit-activity/w/galangw/PBLKasir)](https://github.com/galangw/PBLKasir/commits/main)

Aplikasi SirDi adalah sebuah sistem kasir (Point of Sales) dan manajemen barang yang dibuat menggunakan framework Laravel yang terdiri Dari 2 Versi, yaitu Web dan Juga REST API
## Fitur
1. Autentikasi User
- Login Dan Logout User 
- Ganti Password User(Karyawan)
2. Manajemen Produk
- List Produk, Kategori, Supplier
- Input Produk, Kategori, Supplier
- Hapus Produk, Kategori, Supplier
3. Transaksi
- Pencarian produk
- Konfirmasi Transaksi
- Cetak nota
4. Manajemen Transaksi
- List Transaksi Menurut Input tanggal
- Rekap Penjualan Dan Laba Menurut Input Tanggal
5. Manajemen User
- List User (karyawan)
- Input User Baru (karyawan)
- Edit User (karyawan)
- Hapus User (karyawan)

## Demo Aplikasi 
| URL | http://api.glng.my.id/login |
| --- | --- |
| email | admin@admin.com |
| password | password |

## Instalasi

### Spesifikasi
- PHP ^8.1
- PHP Composer
- Database MySQL atau MariaDB

### Cara Install

1. Clone atau download source code
    - Pada terminal, clone repo `git clone https://github.com/galangw/PBLKasir/`
    - Jika tidak menggunakan Git, silakan **Download Zip** dan *extract* pada direktori web server (misal: xampp/htdocs)
2. `cd PBLKasir`
3. `composer install`
4. `cp .env.example .env`
    - Jika tidak menggunakan Git, bisa rename file `.env.example` menjadi `.env`
5. Pada terminal `php artisan key:generate`
6. Buat **database pada mysql** untuk aplikasi ini
7. **Setting database** pada file `.env`
8. `php artisan migrate`
8. `php artisan db:seed`
9. `php artisan serve`
10. Selesai

### Login Admin
```
Username: admin@admin.com
Password: password
```
## Api Akses Dan Dokumentasi
Dokumentasi Api Bisa Diakses Di : https://documenter.getpostman.com/view/23565435/2s8YzXvfNJ
## Screenshots
<p></p><div class="separator" style="clear: both; text-align: left;">Halaman Login</div><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEiqfUdvVa3jWETMXehv-VCNcilrk6gH-IJuhL7Xlqyk0IAoLu_MuJhWNfIMPEperwnZvSImjJOfNb4Ei6p0H7iRFyWLUFph7IImFW2VU0lUh2_WPnSoVeVEHnPKzQDBMO91FtBsjEu8Cwa2c5OI45x59Mpi0fzPLdFfToAwN5INwz20ZG0mT8bHluJi" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="480" data-original-width="994" height="310" src="https://blogger.googleusercontent.com/img/a/AVvXsEiqfUdvVa3jWETMXehv-VCNcilrk6gH-IJuhL7Xlqyk0IAoLu_MuJhWNfIMPEperwnZvSImjJOfNb4Ei6p0H7iRFyWLUFph7IImFW2VU0lUh2_WPnSoVeVEHnPKzQDBMO91FtBsjEu8Cwa2c5OI45x59Mpi0fzPLdFfToAwN5INwz20ZG0mT8bHluJi=w640-h310" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman Home</div><div class="separator" style="clear: both; text-align: left;"><div class="separator" style="clear: both; text-align: left;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEhWjXgqd7nGtSnKUCFqVzsi9IpzQGbj9EtwldtP1uf3hsKubPafSL9i8KE1WIfI2nwi3yheAL13u3FyizHDgcBalNevIVHdZuTuvdzZ11c6f9M4sBERtU1JmYXaCajwUCNKOXYQSNCXukgPdXGtETUd-C4oz17p61ohJjOMCYEacbYw-orHXyzYXKBi" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEhWjXgqd7nGtSnKUCFqVzsi9IpzQGbj9EtwldtP1uf3hsKubPafSL9i8KE1WIfI2nwi3yheAL13u3FyizHDgcBalNevIVHdZuTuvdzZ11c6f9M4sBERtU1JmYXaCajwUCNKOXYQSNCXukgPdXGtETUd-C4oz17p61ohJjOMCYEacbYw-orHXyzYXKBi=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;"><br /></div>Halaman Transaksi&nbsp;</div><div class="separator" style="clear: both; text-align: left;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEg1xRDMKUNd5MkPoGbNxauDrUOZIJwmtIKSTK49UAk2OW1OaEedMpl_SAP_1erYUJkqPsl6ESEcLoTc7qweZPxvWj4eR8E0i6b2ixdgHFJBOZCpqFdaFbrwVLTomh12Ne6YZmW3pPh6A_dsILVXdkVbPEMDS-AU2XRfy0mx1rhCirbsoM_M6J9rH0Ah" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEg1xRDMKUNd5MkPoGbNxauDrUOZIJwmtIKSTK49UAk2OW1OaEedMpl_SAP_1erYUJkqPsl6ESEcLoTc7qweZPxvWj4eR8E0i6b2ixdgHFJBOZCpqFdaFbrwVLTomh12Ne6YZmW3pPh6A_dsILVXdkVbPEMDS-AU2XRfy0mx1rhCirbsoM_M6J9rH0Ah=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman Manajemen Barang</div><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEhV9kCwEWY0xZCTpLbq9C0tu_WrFaqaZwYblKeB1mhWG21NNAymjoyptr9o7N5yTYYGKYWW9RIRTsBAp9EHFN43XRy1qMcKGcnFDvpNBm0t3KJxh9CYkb7Av9ZPmPnMO9GM5qWQv5p2FrYzE4yaOsJCUl_FHaT1eq5p366yVYCl87lCQWQk-OJBMwtw" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEhV9kCwEWY0xZCTpLbq9C0tu_WrFaqaZwYblKeB1mhWG21NNAymjoyptr9o7N5yTYYGKYWW9RIRTsBAp9EHFN43XRy1qMcKGcnFDvpNBm0t3KJxh9CYkb7Av9ZPmPnMO9GM5qWQv5p2FrYzE4yaOsJCUl_FHaT1eq5p366yVYCl87lCQWQk-OJBMwtw=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman Manajemen kategori</div><div class="separator" style="clear: both; text-align: center;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEiWZGxiteeXuahS2Fc_OYlpKuSbUOldUPKzn80VxrYHprQi_PiWdryRPu_13Lv38s2VgDfqOTbrjHUbDVW170I2s6IfMJVFgTsm02bI4eGiAe2Q967WdrLNQkiEUOdpdnGUVMmzHln7vSTw4Qvq1JLzhQKzpWF5LuE8sffiGzd5z3_Q6lf0R60nT8AE" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEiWZGxiteeXuahS2Fc_OYlpKuSbUOldUPKzn80VxrYHprQi_PiWdryRPu_13Lv38s2VgDfqOTbrjHUbDVW170I2s6IfMJVFgTsm02bI4eGiAe2Q967WdrLNQkiEUOdpdnGUVMmzHln7vSTw4Qvq1JLzhQKzpWF5LuE8sffiGzd5z3_Q6lf0R60nT8AE=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman Manajemen Suplier</div><div class="separator" style="clear: both; text-align: center;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEiZRtA7WZrhNVtg3T5Z3KE0BfXDsG-9swY29WIMMr_nGhETZcXXtROsh4eZsOQgnQO0hOll6GZLH0KbqQkbrzuJge8vGgkvPpPnguAOsQhKyt7ZJDOJJ-k_0LeKk9rO-w7XeF5RRbYwDAuyRENHZOENPLt9diOv9qlwDX5qnQNoLsXE6utJbKFwT-j9" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEiZRtA7WZrhNVtg3T5Z3KE0BfXDsG-9swY29WIMMr_nGhETZcXXtROsh4eZsOQgnQO0hOll6GZLH0KbqQkbrzuJge8vGgkvPpPnguAOsQhKyt7ZJDOJJ-k_0LeKk9rO-w7XeF5RRbYwDAuyRENHZOENPLt9diOv9qlwDX5qnQNoLsXE6utJbKFwT-j9=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman history Transaksi</div><div class="separator" style="clear: both; text-align: center;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEhW4VhWgUiKNI6I5KJXdZ-Di4ahCV-4hIHBISOBF5qRmKrSOmyGqs5hSTRDqC3_bHTsf2rSiVehPAMlgfXsU0QM2ddjFUSalHXcarI5Ku9F0m3mcnOcKtqgbeo95Ry9CPNKY-6PJbSzGS--EV_oInp88aPM45hv4dwORBHw_1zIS65crJUoEh2jDmmh" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEhW4VhWgUiKNI6I5KJXdZ-Di4ahCV-4hIHBISOBF5qRmKrSOmyGqs5hSTRDqC3_bHTsf2rSiVehPAMlgfXsU0QM2ddjFUSalHXcarI5Ku9F0m3mcnOcKtqgbeo95Ry9CPNKY-6PJbSzGS--EV_oInp88aPM45hv4dwORBHw_1zIS65crJUoEh2jDmmh=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman manajemen Karyawan</div><div style="text-align: left;"><br /></div><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEgHyiZPqtTRWXvhmEYGauUhFoRDC67Dten0DOKjCIcPEwqzqtUAWodE99Vn5Hi--lZ4llzY0vg24bcGqSNnn3gEr55MIBpjbNjwUisak-LhsBs4zr4fBLdu6DIc2xjjdZWp-8HqqFk5niWcYggofGsg1Ts6XLJWaM7ab2ArTPsC8x4bFFsyP-Ko3SW2" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEgHyiZPqtTRWXvhmEYGauUhFoRDC67Dten0DOKjCIcPEwqzqtUAWodE99Vn5Hi--lZ4llzY0vg24bcGqSNnn3gEr55MIBpjbNjwUisak-LhsBs4zr4fBLdu6DIc2xjjdZWp-8HqqFk5niWcYggofGsg1Ts6XLJWaM7ab2ArTPsC8x4bFFsyP-Ko3SW2=w640-h322" width="640" /></a></div><div style="text-align: left;"><br /></div><div style="text-align: left;"><br /></div></div><div style="text-align: left;"><br /></div><div style="text-align: left;"><br /></div></div><div style="text-align: left;"><br /></div><div style="text-align: left;"><br /></div></div><br /><br /><br /><br /></div><br /><br /></div><br /><p></p>

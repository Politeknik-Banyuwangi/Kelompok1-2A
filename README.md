# SirDi

## _Simple Point Of Sales WebApp For Tyas Grosir_

[![Laravel](https://github.com/galangw/PBLKasir/actions/workflows/testing.yml/badge.svg)](https://github.com/galangw/PBLKasir/actions/workflows/testing.yml) [![Laravel](https://img.shields.io/github/v/release/galangw/PBLKasir)](https://github.com/galangw/PBLKasir/releases) [![Laravel](https://img.shields.io/github/commit-activity/w/galangw/PBLKasir)](https://github.com/galangw/PBLKasir/commits/main)

Aplikasi SirDi adalah sebuah sistem kasir (Point of Sales) dan manajemen barang yang dibuat menggunakan framework Laravel yang terdiri Dari Versi Web, Mobile, Dan REST API

## Kelompok 1 Kelas 2A

1. Galang Wijaya
2. Galih Titis Bagus Catry
3. Aza Faiz
4. Tio Ramadhani
5. Rafa Putra

## Original Repository

Web & Rest Api
https://github.com/galangw/PBLKasir
Mobile Flutter
https://github.com/DeFaustus/pbl-kasir-flutter

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

## Demo Web

| URL      | http://api.glng.my.id/login |
| -------- | --------------------------- |
| email    | admin@admin.com             |
| password | password                    |

## Instalasi WEB & REST API

### Spesifikasi

- PHP ^8.1
- PHP Composer
- Database MySQL atau MariaDB

### Cara Install

1. Clone atau download source code
   - Pada terminal, clone repo `git clone https://github.com/galangw/PBLKasir/`
   - Jika tidak menggunakan Git, silakan **Download Zip** dan _extract_ pada direktori web server (misal: xampp/htdocs)
2. `cd PBLKasir`
3. `composer install`
4. `cp .env.example .env`
   - Jika tidak menggunakan Git, bisa rename file `.env.example` menjadi `.env`
5. Pada terminal `php artisan key:generate`
6. Buat **database pada mysql** untuk aplikasi ini
7. **Setting database** pada file `.env`
8. `php artisan migrate`
9. `php artisan db:seed`
10. `php artisan serve`
11. Selesai

### Login Admin

```
Username: admin@admin.com
Password: password
```

## Api Akses Dan Dokumentasi

Dokumentasi Api Bisa Diakses Di : https://documenter.getpostman.com/view/23565435/2s8YzXvfNJ

## Screenshots

<p></p><div class="separator" style="clear: both; text-align: left;">Halaman Login</div><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEiqfUdvVa3jWETMXehv-VCNcilrk6gH-IJuhL7Xlqyk0IAoLu_MuJhWNfIMPEperwnZvSImjJOfNb4Ei6p0H7iRFyWLUFph7IImFW2VU0lUh2_WPnSoVeVEHnPKzQDBMO91FtBsjEu8Cwa2c5OI45x59Mpi0fzPLdFfToAwN5INwz20ZG0mT8bHluJi" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="480" data-original-width="994" height="310" src="https://blogger.googleusercontent.com/img/a/AVvXsEiqfUdvVa3jWETMXehv-VCNcilrk6gH-IJuhL7Xlqyk0IAoLu_MuJhWNfIMPEperwnZvSImjJOfNb4Ei6p0H7iRFyWLUFph7IImFW2VU0lUh2_WPnSoVeVEHnPKzQDBMO91FtBsjEu8Cwa2c5OI45x59Mpi0fzPLdFfToAwN5INwz20ZG0mT8bHluJi=w640-h310" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman Home</div><div class="separator" style="clear: both; text-align: left;"><div class="separator" style="clear: both; text-align: left;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEhWjXgqd7nGtSnKUCFqVzsi9IpzQGbj9EtwldtP1uf3hsKubPafSL9i8KE1WIfI2nwi3yheAL13u3FyizHDgcBalNevIVHdZuTuvdzZ11c6f9M4sBERtU1JmYXaCajwUCNKOXYQSNCXukgPdXGtETUd-C4oz17p61ohJjOMCYEacbYw-orHXyzYXKBi" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEhWjXgqd7nGtSnKUCFqVzsi9IpzQGbj9EtwldtP1uf3hsKubPafSL9i8KE1WIfI2nwi3yheAL13u3FyizHDgcBalNevIVHdZuTuvdzZ11c6f9M4sBERtU1JmYXaCajwUCNKOXYQSNCXukgPdXGtETUd-C4oz17p61ohJjOMCYEacbYw-orHXyzYXKBi=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;"><br /></div>Halaman Transaksi&nbsp;</div><div class="separator" style="clear: both; text-align: left;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEg1xRDMKUNd5MkPoGbNxauDrUOZIJwmtIKSTK49UAk2OW1OaEedMpl_SAP_1erYUJkqPsl6ESEcLoTc7qweZPxvWj4eR8E0i6b2ixdgHFJBOZCpqFdaFbrwVLTomh12Ne6YZmW3pPh6A_dsILVXdkVbPEMDS-AU2XRfy0mx1rhCirbsoM_M6J9rH0Ah" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEg1xRDMKUNd5MkPoGbNxauDrUOZIJwmtIKSTK49UAk2OW1OaEedMpl_SAP_1erYUJkqPsl6ESEcLoTc7qweZPxvWj4eR8E0i6b2ixdgHFJBOZCpqFdaFbrwVLTomh12Ne6YZmW3pPh6A_dsILVXdkVbPEMDS-AU2XRfy0mx1rhCirbsoM_M6J9rH0Ah=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman Manajemen Barang</div><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEhV9kCwEWY0xZCTpLbq9C0tu_WrFaqaZwYblKeB1mhWG21NNAymjoyptr9o7N5yTYYGKYWW9RIRTsBAp9EHFN43XRy1qMcKGcnFDvpNBm0t3KJxh9CYkb7Av9ZPmPnMO9GM5qWQv5p2FrYzE4yaOsJCUl_FHaT1eq5p366yVYCl87lCQWQk-OJBMwtw" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEhV9kCwEWY0xZCTpLbq9C0tu_WrFaqaZwYblKeB1mhWG21NNAymjoyptr9o7N5yTYYGKYWW9RIRTsBAp9EHFN43XRy1qMcKGcnFDvpNBm0t3KJxh9CYkb7Av9ZPmPnMO9GM5qWQv5p2FrYzE4yaOsJCUl_FHaT1eq5p366yVYCl87lCQWQk-OJBMwtw=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman Manajemen kategori</div><div class="separator" style="clear: both; text-align: center;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEiWZGxiteeXuahS2Fc_OYlpKuSbUOldUPKzn80VxrYHprQi_PiWdryRPu_13Lv38s2VgDfqOTbrjHUbDVW170I2s6IfMJVFgTsm02bI4eGiAe2Q967WdrLNQkiEUOdpdnGUVMmzHln7vSTw4Qvq1JLzhQKzpWF5LuE8sffiGzd5z3_Q6lf0R60nT8AE" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEiWZGxiteeXuahS2Fc_OYlpKuSbUOldUPKzn80VxrYHprQi_PiWdryRPu_13Lv38s2VgDfqOTbrjHUbDVW170I2s6IfMJVFgTsm02bI4eGiAe2Q967WdrLNQkiEUOdpdnGUVMmzHln7vSTw4Qvq1JLzhQKzpWF5LuE8sffiGzd5z3_Q6lf0R60nT8AE=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman Manajemen Suplier</div><div class="separator" style="clear: both; text-align: center;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEiZRtA7WZrhNVtg3T5Z3KE0BfXDsG-9swY29WIMMr_nGhETZcXXtROsh4eZsOQgnQO0hOll6GZLH0KbqQkbrzuJge8vGgkvPpPnguAOsQhKyt7ZJDOJJ-k_0LeKk9rO-w7XeF5RRbYwDAuyRENHZOENPLt9diOv9qlwDX5qnQNoLsXE6utJbKFwT-j9" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEiZRtA7WZrhNVtg3T5Z3KE0BfXDsG-9swY29WIMMr_nGhETZcXXtROsh4eZsOQgnQO0hOll6GZLH0KbqQkbrzuJge8vGgkvPpPnguAOsQhKyt7ZJDOJJ-k_0LeKk9rO-w7XeF5RRbYwDAuyRENHZOENPLt9diOv9qlwDX5qnQNoLsXE6utJbKFwT-j9=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman history Transaksi</div><div class="separator" style="clear: both; text-align: center;"><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEhW4VhWgUiKNI6I5KJXdZ-Di4ahCV-4hIHBISOBF5qRmKrSOmyGqs5hSTRDqC3_bHTsf2rSiVehPAMlgfXsU0QM2ddjFUSalHXcarI5Ku9F0m3mcnOcKtqgbeo95Ry9CPNKY-6PJbSzGS--EV_oInp88aPM45hv4dwORBHw_1zIS65crJUoEh2jDmmh" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEhW4VhWgUiKNI6I5KJXdZ-Di4ahCV-4hIHBISOBF5qRmKrSOmyGqs5hSTRDqC3_bHTsf2rSiVehPAMlgfXsU0QM2ddjFUSalHXcarI5Ku9F0m3mcnOcKtqgbeo95Ry9CPNKY-6PJbSzGS--EV_oInp88aPM45hv4dwORBHw_1zIS65crJUoEh2jDmmh=w640-h322" width="640" /></a></div><div class="separator" style="clear: both; text-align: left;">Halaman manajemen Karyawan</div><div style="text-align: left;"><br /></div><div class="separator" style="clear: both; text-align: left;"><a href="https://blogger.googleusercontent.com/img/a/AVvXsEgHyiZPqtTRWXvhmEYGauUhFoRDC67Dten0DOKjCIcPEwqzqtUAWodE99Vn5Hi--lZ4llzY0vg24bcGqSNnn3gEr55MIBpjbNjwUisak-LhsBs4zr4fBLdu6DIc2xjjdZWp-8HqqFk5niWcYggofGsg1Ts6XLJWaM7ab2ArTPsC8x4bFFsyP-Ko3SW2" style="margin-left: 1em; margin-right: 1em;"><img alt="" data-original-height="902" data-original-width="1788" height="322" src="https://blogger.googleusercontent.com/img/a/AVvXsEgHyiZPqtTRWXvhmEYGauUhFoRDC67Dten0DOKjCIcPEwqzqtUAWodE99Vn5Hi--lZ4llzY0vg24bcGqSNnn3gEr55MIBpjbNjwUisak-LhsBs4zr4fBLdu6DIc2xjjdZWp-8HqqFk5niWcYggofGsg1Ts6XLJWaM7ab2ArTPsC8x4bFFsyP-Ko3SW2=w640-h322" width="640" /></a></div><div style="text-align: left;"><br /></div><div style="text-align: left;"><br /></div></div><div style="text-align: left;"><br /></div><div style="text-align: left;"><br /></div></div><div style="text-align: left;"><br /></div><div style="text-align: left;"></div></div></div></div>

## Mobile APPS

cara installasi :

    - Clone project ini<br>
    - ketikkan perintah flutter pub get di terminal<br>
    - lalu ganti url di lib/utils/base_url.dart<br>
    - pilih salah satu dari http://10.0.2.2:8000/api untuk localhost, https://api.glng.my.id/api untuk yang  online
    
cara run project : 

    - ketikkan flutter run di terminal<br>
    - pilih devices yang akan menjalankan flutter nya ( windows,browser ). jika sudah membuka emulator android, maka akan otomatis memilih android nya<br>
    - pilih nomor devices nya<br>
    - kemudian tunggu sampai proses compile nya selesai

## Screenshot Mobile APPS

login <br>
<img src="https://user-images.githubusercontent.com/62246951/210553612-2995bf63-7823-4722-8375-90a99bb52d3a.png" width="250" height="470"><br>
beranda<br>
<img src="https://user-images.githubusercontent.com/62246951/210553557-9ca8e3ac-f611-4f72-a58e-7c066ec5bcd1.png" width="250" height="470"><br>
sidebar<br>
<img src="https://user-images.githubusercontent.com/62246951/210553618-4508bad5-4f8c-4274-bff3-e793191cc4e1.png" width="250" height="470"><br>
daftar kategori<br>
<img src="https://user-images.githubusercontent.com/62246951/210553576-9b820a4b-e37b-4f91-8d1e-e0727d194220.png" width="250" height="470"><br>
barang transaksi<br>
<img src="https://user-images.githubusercontent.com/62246951/210553565-197c4394-2264-4104-bf33-0083bb86b7d9.png" width="250" height="470"><br>
daftar barang<br>
<img src="https://user-images.githubusercontent.com/62246951/210553568-2559afe7-e8e0-4d08-a696-404b6d41f97f.png" width="250" height="470"><br>
daftar karyawan<br>
<img src="https://user-images.githubusercontent.com/62246951/210553572-6dbaaa8c-1bac-4233-82f4-63b7369112b8.png" width="250" height="470"><br>

daftar supplier<br>
<img src="https://user-images.githubusercontent.com/62246951/210553579-5b268f24-c192-4141-80bd-ad2201f99726.png" width="250" height="470"><br>
edit barang<br>
<img src="https://user-images.githubusercontent.com/62246951/210553585-ea4b868a-2120-4a17-acce-c6216f4fdb17.png" width="250" height="470"><br>
edit karyawan<br>
<img src="https://user-images.githubusercontent.com/62246951/210553587-5c7185ff-270c-4430-8502-74bf94e4671c.png" width="250" height="470"><br>
edit kategori<br>
<img src="https://user-images.githubusercontent.com/62246951/210553591-9a667e1f-01c4-4eea-a96a-39f878b7951f.png" width="250" height="470"><br>
update supplier<br>
<img src="https://user-images.githubusercontent.com/62246951/210553597-384ea062-5b80-4309-8ebb-52deacddec7b.png" width="250" height="470"><br>
hapus karyawan<br>
<img src="https://user-images.githubusercontent.com/62246951/210553598-69434727-c579-4348-b2af-b0a3c1c79133.png" width="250" height="470"><br>
laporan barang masuk<br>
<img src="https://user-images.githubusercontent.com/62246951/210553601-f7fc45d6-ffa6-43e7-9c4d-f50e11a6b278.png" width="250" height="470"><br>
laporan penjualan hari ini<br>
<img src="https://user-images.githubusercontent.com/62246951/210553604-4e1a0620-3eef-49b0-ae02-364b831e1b3f.png" width="250" height="470"><br>
laporan penjualan semua<br>
<img src="https://user-images.githubusercontent.com/62246951/210553606-04de50c5-a6fc-4c2d-ab1d-5ccd263ac363.png" width="250" height="470"><br>
list transaksi<br>
<img src="https://user-images.githubusercontent.com/62246951/210553608-2ad13d43-b309-4f26-8848-77ac467eb844.png" width="250" height="470"><br>
checkout<br>
<img src="https://user-images.githubusercontent.com/62246951/210553562-2574e6b1-83d6-4e9b-9012-f44e6184b651.png" width="250" height="470"><br>
nota<br>
<img src="https://user-images.githubusercontent.com/62246951/210553615-f21a3bf0-828a-4960-a195-943d42b800a0.png" width="250" height="470"><br>

tambah barang<br>
<img src="https://user-images.githubusercontent.com/62246951/210553621-8e59d92b-84bb-49df-b41d-bccc88a97caf.png" width="250" height="470"><br>
tambah karyawan<br>
<img src="https://user-images.githubusercontent.com/62246951/210553625-1beb3c53-ab1e-4a54-8656-e4e138677c9f.png" width="250" height="470"><br>
tambah kategori<br>
<img src="https://user-images.githubusercontent.com/62246951/210553628-188e38fa-5cfc-492f-8dbe-45ace34cf98c.png" width="250" height="470"><br>
tambah stok<br>
<img src="https://user-images.githubusercontent.com/62246951/210553631-9b524b0b-013a-4ca6-ba0e-98c8b35e359a.png" width="250" height="470"><br>
tambah supplier<br>
<img src="https://user-images.githubusercontent.com/62246951/210553635-19677292-0541-4eca-9c85-c73e00891385.png" width="250" height="470"><br>

> 18223122 Anggita Najmi Layali

![Produce 48](https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/blob/main/pd48.jpeg)

## Deskripsi
Database ini merepresentasikan overview survival show **Produce 48**, mencakup data **trainee (kontestan), performance, dan sistem ranking**. Top 12 trainee pada final ranking debut sebagai girlgroup K-Pop IZONE. 

Topik ini dipilih selain karena merupakan hal yang disukai *author*, tapi juga karena Produce48 sempat menjadi sorotan besar pada tahun 2018–2020 akibat **kontroversi manipulasi vote dan ranking debut** oleh company pelaksananya, MNet. Isu ini menjadi signifikan karena Produce48 memiliki fandom yang besar, sehingga berdampak pada menurunnya kepercayaan publik terhadap survival show MNet di tahun-tahun berikutnya.

Kasus ini tentu menjadi bahan yang menarik terkait studi transparansi data. 

<br>

## Penggunaan Scraper
1. Menyiapkan library: pandas, lxml
2. Jalankan script scraper.ipynb, sesuaikan url dan path folder tujuan.

Data hasil scraping digunakan sebagai basis untuk mengisi tabel di database PostgreSQL dengan insert.ipynb

## Struktur Output .json
Output scraper berupa array JSON yang berisi objek-objek. Setiap objek merepresentasikan satu entitas data yang sesuai dengan nama file-nya.

## Struktur ERD dan Diagram Relasional
![ERD](https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/blob/main/Data%20Storing/design/Seleksi_basdat-ERD.png)
![Relational](https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/blob/main/Data%20Storing/design/Seleksi_Basdat-Relasional%20Diagram.drawio.png)

Translasi ERD ke Relasional Model:
- One-to-One: mencantumkan salah satu PK sebagai FK di tabel lainnya.
- Relasi Many-to-One mencantumkan PK relasy One ke relasi Many.
- Relasi Many-to-Many dibuat menjadi sebuah relasi baru untuk menghubungkan keduanya. Relasi baru memuat PK dari kedua relasi.

## Dokumentasi

## Referensi
> scraping & preprocessing library: python beautifulsoup, pandas, re, json
> data storing library: python psycopg2, json

Link referensi:
https://produce101.fandom.com/wiki/Produce_48
https://akb48.fandom.com/wiki/Produce_48
https://en.wikipedia.org/wiki/Produce_48
https://en.wikipedia.org/wiki/List_of_Produce_48_contestants 






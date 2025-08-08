# Produce48 ETL
> 18223122 Anggita Najmi Layali

![Produce 48](https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/blob/main/pd48.jpeg)

Database merepresentasikan overview survival show **Produce 48**, mencakup data **trainee (kontestan), performance, dan sistem ranking**. Top 12 trainee pada final ranking debut sebagai girlgroup K-Pop IZ*ONE. 

Topik ini dipilih selain karena merupakan hal yang disukai *author*, tapi juga karena Produce48 sempat menjadi sorotan besar pada tahun 2018–2020 akibat **kontroversi manipulasi vote dan ranking debut** oleh company pelaksananya, MNet. Isu ini menjadi signifikan karena Produce48 memiliki fandom yang besar, sehingga berdampak pada menurunnya kepercayaan publik terhadap survival show MNet di tahun-tahun berikutnya.

---

## Penggunaan Scraper
1. Menyiapkan library
    ```bash
    pip install pandas beautifulsoup4 requests
    ```
2. Jalankan setiap cell scraper.ipynb, sesuaikan url dan path folder tujuan.

Data hasil scraping perlu dilakukan cleaning dan transformation dengan preprocessing.ipynb. Data siap pakai yang disimpan pada ../Data Scraping/data/cleaned digunakan sebagai basis untuk mengisi tabel di database PostgreSQL dengan insert.ipynb

## Struktur Output .json
Output scraper berupa array JSON yang berisi objek-objek. Setiap objek merepresentasikan satu entitas data yang sesuai dengan nama file-nya.

## Struktur ERD dan Diagram Relasional
<p align="center">
    <img src="" alt="ERD" />
</p>

<p align="center">
    <img src="" alt="Relational" />
</p>

**Translasi ERD ke Relasional Model:**
- One-to-One: mencantumkan salah satu PK sebagai FK di tabel lainnya.
- Relasi Many-to-One mencantumkan PK relasy One ke relasi Many.
- Relasi Many-to-Many dibuat menjadi sebuah relasi baru untuk menghubungkan keduanya. Relasi baru memuat PK dari kedua relasi.
  Relasi baru hasil M2M: trainee_episode_rank, trainee_evaluation

## Dokumentasi
![trainee]
![]

---

## Library
**S-craping & preprocessing:** python BeautifulSoup4, Pandas, requests
**Data storing:** python psycopg2

**Referensi scraping:**
- [Produce 48 - Produce 101 Fandom](https://produce101.fandom.com/wiki/Produce_48)
- [Produce 48 - AKB48 Fandom](https://akb48.fandom.com/wiki/Produce_48)
- [Produce 48 - Wikipedia](https://en.wikipedia.org/wiki/Produce_48)
- [List of Produce 48 Contestants - Wikipedia](https://en.wikipedia.org/wiki/List_of_Produce_48_contestants)

**Referensi pengerjaan, design, dan modelling:**
- Salindia IF2140 Pemodelan Basis Data
- [Stack Overflow - ](https://stackoverflow.com/questions/77460334/total-disjoint-vs-u-type-in-eerd#:~:text=The%20D%20stands%20for%20Disjoint,subclasses%20under%20a%20same%20D)
- [SIT University of Capetown Materials](https://www.cs.uct.ac.za/mit_notes/database/htmls/chp06.html)







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
Output scraper berupa array JSON yang berisi objek-objek. Setiap objek merepresentasikan satu entitas data yang sesuai dengan nama file-nya. Daftar entitas,
- trainee: id_trainee, name, nationality, age, 1st_grade, last_grade, 1st_rank, final_rank
- singles: id_single, title, lyrics_writer, music_producer, arrangement, duration
- album: id_album, title, release_date, label, formats, jpn_hot, jpn_digital, us_world, sales
- single_chart: id_single, id_album, year, peak_kor, kor_hot_100
- episodes: episode, broadcast_date, seoul_rate, nationwide_rate
- individual_evaluation: id_perform, id_trainee, company, grade, song
- group_battle_evaluation: id_perform, id_trainee, song, original_artist, team_name, trainee_position, trainee_votes, trainee_bonus
- position_evaluation: id_perform, id_trainee, category, song, original_artist, trainee_votes, rank_in_team, trainee_bonus
- concept_evaluation: id_perform, id_trainee, id_single, trainee_position, trainee_votes, trainee_rank, trainee_bonus
- debut_evaluation: id_perform, id_trainee, id_single, trainee_position


## Struktur ERD dan Diagram Relasional
<p align="center">
    <img src="https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/blob/main/Data%20Storing/design/Seleksi_basdat-ERD.png" alt="ERD" />
</p>

<p align="center">
    <img src="https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/blob/main/Data%20Storing/design/Seleksi_Basdat-Relasional%20Diagram.png" alt="Relational" />
</p>

**Translasi ERD ke Relasional Model:**
- One-to-One: mencantumkan salah satu PK sebagai FK di tabel lainnya.
- Relasi Many-to-One mencantumkan PK relasy One ke relasi Many.
- Relasi Many-to-Many dibuat menjadi sebuah relasi baru untuk menghubungkan keduanya. Relasi baru memuat PK dari kedua relasi.
  Relasi baru hasil M2M: trainee_episode_rank

## Dokumentasi
<p align="center">
    <img src="https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/blob/main/Data%20Storing/screenshot/00trainee.png" alt="ERD" />
</p>
<p align="center">
    <img src="https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/blob/main/Data%20Storing/screenshot/01singles.png" alt="ERD" />
</p>
<p align="center">
    <img src="https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/blob/main/Data%20Storing/screenshot/concept_eval.png" alt="ERD" />
</p>

Dokumentasi lengkap dapat diakses pada folder ![Data Storing/screenshot](https://github.com/gitaa001/TUGAS_SELEKSI_1_18223122/tree/main/Data%20Storing/screenshot)

---

## Library
**Scraping & preprocessing:** python BeautifulSoup4, Pandas, requests
**Data storing:** python psycopg2

**Referensi scraping:**
- [Produce 48 - Produce 101 Fandom](https://produce101.fandom.com/wiki/Produce_48)
- [Produce 48 - AKB48 Fandom](https://akb48.fandom.com/wiki/Produce_48)
- [Produce 48 - Wikipedia](https://en.wikipedia.org/wiki/Produce_48)
- [List of Produce 48 Contestants - Wikipedia](https://en.wikipedia.org/wiki/List_of_Produce_48_contestants)

**Referensi pengerjaan, design, dan modelling:**
- Salindia IF2140 Pemodelan Basis Data
- [SIT University of Capetown Materials](https://www.cs.uct.ac.za/mit_notes/database/htmls/chp06.html)







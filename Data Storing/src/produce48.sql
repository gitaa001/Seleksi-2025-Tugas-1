-- Tabel trainee
CREATE TABLE trainee (
    id_trainee INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    company TEXT,
    age TEXT,
    korean_name TEXT,
    japanese_name TEXT,
    first_grade TEXT,
    last_grade TEXT,
    first_rank INTEGER,
    final_rank TEXT
    UNIQUE(name)
);

-- Tabel episodes
CREATE TABLE episodes (
    episode INTEGER PRIMARY KEY,
    broadcast_date TEXT,
    nationwide_rate REAL,
    seoul_rate REAL
);

-- Tabel trainee_episode_rank
CREATE TABLE trainee_episode_rank (
    episode INTEGER NOT NULL,
    id_trainee INTEGER NOT NULL,
    rank TEXT,
    PRIMARY KEY (episode, id_trainee),
    FOREIGN KEY (episode) REFERENCES episodes(episode) ON DELETE CASCADE,
    FOREIGN KEY (id_trainee) REFERENCES trainee(id_trainee) ON DELETE CASCADE
);

--------- SINGLE & ALBUM TABLES ---------

-- Tabel singles
CREATE TABLE singles (
    id_single INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    release_date TEXT,
    lyrics_writer TEXT,
    music_producer TEXT,
    arrangement TEXT,
    duration TEXT
);

-- Table single_chart
CREATE TABLE single_chart (
    id_single INTEGER NOT NULL,
    jpn_hot INTEGER,
    jpn_digital INTEGER,
    us_world INTEGER,
    FOREIGN KEY (id_single) REFERENCES singles(id_single)
);

-- Tabel album
CREATE TABLE album (
    id_album INTEGER PRIMARY KEY,
    title TEXT NOT NULL,
    release_date TEXT,
    label TEXT,
    formats TEXT,
    jpn_hot INTEGER,
    jpn_digital INTEGER,
    us_world INTEGER,
    sales INTEGER
);

------------- EVALUATION TABLES -------------

-- Tabel evaluation
CREATE TABLE evaluation (
    evaluation_id INTEGER PRIMARY KEY,
    evaluation_type TEXT NOT NULL
);

-- Tabel individual_evaluation
CREATE TABLE individual_evaluation (
    id_perform INTEGER PRIMARY KEY,
    evaluation_id INTEGER NOT NULL,
    song TEXT,
    original_artist TEXT,
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(evaluation_id)
);

-- Tabel group_battle_evaluation
CREATE TABLE group_battle_evaluation (
    id_perform INTEGER PRIMARY KEY,
    evaluation_id INTEGER NOT NULL,
    original_artist TEXT,
    song TEXT,
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(evaluation_id)
);

-- Tabel group_battle_performance
CREATE TABLE group_battle_performance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_perform INTEGER NOT NULL,
    team_name TEXT,
    trainee_id INTEGER NOT NULL,
    trainee_position TEXT,
    trainee_votes INTEGER,
    trainee_bonus INTEGER,
    FOREIGN KEY (id_perform) REFERENCES group_battle_evaluation(id_perform),
    FOREIGN KEY (trainee_id) REFERENCES trainee(id_trainee)
);

-- Tabel position_evaluation
CREATE TABLE position_evaluation (
    id_perform INTEGER PRIMARY KEY,
    evaluation_id INTEGER NOT NULL,
    position TEXT,
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(evaluation_id)
);

-- Tabel position_performance
CREATE TABLE position_performance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_perform INTEGER NOT NULL,
    trainee_id INTEGER NOT NULL,
    trainee_position TEXT,
    trainee_votes INTEGER,
    trainee_rank INTEGER,
    bonus INTEGER,
    FOREIGN KEY (id_perform) REFERENCES position_evaluation(id_perform),
    FOREIGN KEY (trainee_id) REFERENCES trainee(id_trainee)
);

-- Tabel concept_evaluation
CREATE TABLE concept_evaluation (
    id_perform INTEGER PRIMARY KEY,
    evaluation_id INTEGER NOT NULL,
    concept TEXT,
    producer TEXT,
    id_single INTEGER,
    votes INTEGER,
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(evaluation_id),
    FOREIGN KEY (id_single) REFERENCES single(id_single)
);

-- Tabel concept_performance
CREATE TABLE concept_performance (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    id_perform INTEGER NOT NULL,
    trainee_position TEXT,
    trainee_id INTEGER NOT NULL,
    trainee_votes INTEGER,
    trainee_rank INTEGER,
    bonus INTEGER,
    FOREIGN KEY (id_perform) REFERENCES concept_evaluation(id_perform),
    FOREIGN KEY (trainee_id) REFERENCES trainee(id_trainee)
);

-- Tabel debut_evaluation
CREATE TABLE debut_evaluation (
    id_perform INTEGER PRIMARY KEY,
    evaluation_id INTEGER NOT NULL,
    song TEXT,
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(evaluation_id)
);

-- Tabel trainee_evaluation (relasi M2M)
CREATE TABLE trainee_evaluation (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    trainee_id INTEGER NOT NULL,
    evaluation_id INTEGER NOT NULL,
    FOREIGN KEY (trainee_id) REFERENCES trainee(id_trainee),
    FOREIGN KEY (evaluation_id) REFERENCES evaluation(evaluation_id),
    UNIQUE(trainee_id, evaluation_id)
);

-- Contoh trigger: otomatis hapus trainee_episode_rank jika trainee dihapus
CREATE TRIGGER delete_trainee_rank
AFTER DELETE ON trainee
FOR EACH ROW
BEGIN
    DELETE FROM trainee_episode_rank WHERE id_trainee = OLD.id_trainee;
END;

-- Contoh trigger: otomatis hapus group_battle_performance jika group_battle_evaluation dihapus
CREATE TRIGGER delete_group_battle_perf
AFTER DELETE ON group_battle_evaluation
FOR EACH ROW
BEGIN
    DELETE FROM group_battle_performance WHERE id_perform = OLD.id_perform;
END;

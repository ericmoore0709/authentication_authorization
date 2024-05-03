DROP TABLE IF EXISTS users;
CREATE TABLE IF NOT EXISTS users (
    id SERIAL NOT NULL,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    email VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR Not NULL,
    PRIMARY KEY (id)
);
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        1,
        'zboughey0',
        'fR3!$*33x0{Z7U',
        'zboughey0@indiatimes.com',
        'Zonda',
        'Boughey'
    );
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        2,
        'cmelvin1',
        'xA9>fNnW%v6UD',
        'cmelvin1@chron.com',
        'Chauncey',
        'Melvin'
    );
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        3,
        'fharlin2',
        'bF5@or(UFc\pR"=',
        'fharlin2@twitpic.com',
        'Francisco',
        'Harlin'
    );
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        4,
        'jfinlay3',
        'rT2/&<ip',
        'jfinlay3@weebly.com',
        'Jeana',
        'Finlay'
    );
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        5,
        'awitchalls4',
        'nX2&%dN{''7JCb}W`',
        'awitchalls4@technorati.com',
        'Aundrea',
        'Witchalls'
    );
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        6,
        'bparkhouse5',
        'iZ8"MNj/fh{`',
        'bparkhouse5@newyorker.com',
        'Bell',
        'Parkhouse'
    );
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        7,
        'bkimbling6',
        'oN0#,4J63e=L!J',
        'bkimbling6@facebook.com',
        'Bud',
        'Kimbling'
    );
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        8,
        'fvials7',
        'hY8%jb''7',
        'fvials7@creativecommons.org',
        'Frederigo',
        'Vials'
    );
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        9,
        'cthackeray8',
        'oK4@j\/5yL',
        'cthackeray8@vk.com',
        'Cy',
        'Thackeray'
    );
INSERT INTO users (
        id,
        username,
        password,
        email,
        first_name,
        last_name
    )
VALUES (
        10,
        'qrichley9',
        'wF5<8jMc/=g'')',
        'qrichley9@spiegel.de',
        'Quill',
        'Richley'
    );
SELECT setval(
        ' users_id_seq ',
        (
            SELECT MAX(id)
            FROM users
        ) + 1
    );
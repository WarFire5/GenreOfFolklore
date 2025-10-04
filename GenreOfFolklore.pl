%————— факты: жанры фольклора —————%
genre(skazka).
genre(bylina).
genre(legenda).
genre(chastushka).
genre(zagadka).

%————— факты: жанры ↔ мотивы —————%
has_motif(skazka,    "волшебные помощники").
has_motif(skazka,    "три испытания").
has_motif(skazka,    "злой колдун").
has_motif(skazka,    "оборотничество").
has_motif(skazka,    "чудесное спасение").
has_motif(skazka,    "умная невеста").

has_motif(bylina,    "оборотничество").
has_motif(bylina,    "чудесное спасение").
has_motif(bylina,    "умная невеста").
has_motif(bylina,    "герои-богатыри").

has_motif(legenda,    "злой колдун").
has_motif(legenda,    "оборотничество").
has_motif(legenda,    "чудесное спасение").

%————— факты: произведения и места сбора —————%
work("Гуси-Лебеди",            skazka).
work("Крошечка-Хаврошечка",    skazka).
work("Марья Моревна",          skazka).

work("Илья Муромец и Соловей-разбойник", bylina).
work("Добрыня Никитич и Змей Горыныч",     bylina).
work("Садко",                           bylina).

collected_in("Гуси-Лебеди",            "Курская область").
collected_in("Крошечка-Хаврошечка",    "Курская область").
collected_in("Марья Моревна",          "Архангельская область").

collected_in("Илья Муромец и Соловей-разбойник", "Владимирская область").
collected_in("Добрыня Никитич и Змей Горыныч",     "Новгородская область").
collected_in("Садко",                           "Новгородская область").

%————— факты: эпические жанры —————%
epic(skazka).
epic(bylina).
epic(legenda).

%————— интерфейсные предикаты —————%
% жанр по названию
genre_of_work(Title, Genre) :-
    work(Title, Genre).

% все жанры с данным мотивом (список Genres)
genre_with_motif(Motif, Genres) :-
    setof(Genre, has_motif(Genre, Motif), Genres).

% все произведения из региона (список Titles)
works_in_region(Region, Titles) :-
    setof(Title, collected_in(Title, Region), Titles).

% проверка принадлежности к эпосу
is_epic(Genre) :-
    epic(Genre).


%————— примеры запросов —————%

?- genre_of_work("Садко", Genre).
% Genre = bylina

?- genre_with_motif("умная невеста", Genre).
% Genre = [bylina, skazka]

?- works_in_region("Новгородская область", Title).
% Title = ["Добрыня Никитич и Змей Горыныч", "Садко"]

?- is_epic(skazka).
% true
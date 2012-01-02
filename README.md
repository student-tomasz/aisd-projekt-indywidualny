# Projekt indywidualny z przedmiotu Algorytmy i Struktury Danych

## Uruchomienie

Program uruchamiany jest poleceniem:

    ruby application.rb sciezka/do/siatki.txt

## Profilowanie

Wydajność badana jest wykorzystując bibliotekę `perftools`. Przeprowadzenie
profilowanie i generacja graficznej reprezentacji wyników:

    rake profile

Wymagane pakiety / gemy:

* `bundler`
* `rake`
* `perftools.rb` [strona projektu](https://github.com/tmm1/perftools.rb)
* `graphviz`
* `ghostscript`

Instalacja odbywa się przez komendy:

    gem install bundler
    rake install

## Wymagania na projekt

> Zadanie polega na napisaniu aplikacji, która dostarczałaby użytecznych
> informacji o wczytanej siatce powierzchniowej. Siatki powierzchniowe opisane
> są jako zbiór podstawowych elementów (trójkątów), składających się z dokładnie
> trzech węzłów. Opisane są jako lista czterech liczb (indeks, współrzędna x,
> współrzędna y i z) definiujących węzeł, oraz jako lista elementów zdefiniowana
> jako cztery liczby (indeks, indeks węzła 1, indeks węzła 2 i indeks węzła 3).
> 
> Docelowo, aplikacja powinna udostępniać następujące informacje o siatce:
> 
> * indeksy węzłów podanego elementu,
> * indeksy węzłów bezpośrednio sąsiadujących z podanym węzłem,
> * indeksy elementów bezpośrednio sąsiadujących z podanym węzłem.
> 
> Oprócz tego, aplikacja powinna operować również na krawędziach, które nie są
> zdefiniowane jawnie w pliku z siatką. Krawędzie te należy generować po
> wczytaniu pliku. Z krawędziami związane są następujące operacje wyświetlające:
> 
> * indeksy węzłów podanej krawędzi,
> * indeksy elementów przyległych do podanej krawędzi,
> * indeksy węzłów bezpośrednio sąsiadujących z podaną krawędzią,
> * indeksy elementów bezpośrednio sąsiadujących z podaną krawędzią,
> * indeksy krawędzi bezpośrednio sąsiadujących z podaną krawędzią.
> 
> Zadaniem ćwiczenia jest wykorzystanie takich struktur danych, które
> najefektywniej pozwolą uzyskać żądane informacje o siatce.
> 
> Dodatkowe wymagania projektu:
> 
> * napisany w jednym z podanych języków programowania: C, C++, Java, Python, Ruby,
> * prosty interfejs użytkownika (preferowany tekstowy),
> * musi uruchamiać się w systemie Linux,
> * musi operować na dużych siatkach ( > 10tys. elementów, > 20tys. elementów, > 65tys. elementów ),
> * po wykonaniu każdej operacji powinien zostać wyświetlony czas jej działania w milisekundach,
> * argumentem programu powinien być plik z siatką,
> * należy samemu implementować najważniejsze struktury danych.
> 
> Sprawozdanie powinno zawierać:
> 
> * opis funkcjonalny programu,
> * opis wykorzystanych algorytmów i struktur danych,
> * krótki przegląd kodu z diagramem klas,
> * opis przypadków testowych,
> * wnioski z testów.

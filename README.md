# komp
Opis:
Repozytorium zawiera kod jednoprzebiegowego kompilatora uproszczonego języka programowania Mini
Efektem kompilacji ma być kod źródłowy w języku CIL, który może być za
pomocą programu ilasm przekształcony w plik wykonywalny (*.exe) systemu Windows.

Technologia:
Kompilator został napisany przy użyciu narzędzi Gardens Point - gplex v1.2.2 i gppg v.1.5.2 w środowisku Windows 10 z wykorzystaniem C# 7 i Visual Studio 2017. 

Uruchomienie:
Aby uruchomic kompilator, uruchamiamy "kompilatorXDD.exe" z folderu bin\Release, podajac jako argument sciezke do pliku z programem w jezyku Mini - zostanie wygeneruje plik *.il. 

Uruchamiamy program ilasm w Developer Command Prompt VS, jako argument podajemy wygenerowany plik - otrzymujemy plik wykonywalny naszego programu w języku Mini

Język Mini:
1) Elementy języka.
Elementami podstawowej wersji języka Mini są następujące terminale:
- słowa kluczowe: program if else while read write return int double bool true false
- operatory i symbole specjalne: = || && | & == != > >= < <= + - * / ! ~ ( ) { } ;
- identyfikatory i liczby
Identyfikator to ciąg znaków składający się liter i cyfr rozpoczynający się od litery, dozwolone są
duże i małe litery i są one rozróżnialne (słowa kluczowe muszą być zapisane małymi literami).
Liczba zmiennopozycyjna składa się z ciągu cyfr oznaczających część całkowitą liczby, kropki
dziesiętnej oraz ciągu cyfr oznaczających część ułamkową liczby. Wszystkie te elementy są
obowiązkowe. Zero wiodące dozwolone jest jedynie gdy jest jedyną cyfrą części całkowitej.
Liczba całkowita składa się z ciągu cyfr. Zero wiodące dozwolone jest jedynie gdy jest jedyną cyfrą
w zapisie liczby.
Ponadto w kodzie źródłowym mogą pojawiać się również spacje, tabulacje i znaki przejścia do
nowej linii. Są one ignorowane (ale rozdzielają sąsiadujące z nimi elementy).
Język dopuszcza również komentarze rozpoczynające się znakami // i kończące znakiem przejścia do
nowej linii oraz napisy czyli ciągi znaków ujęte w cudzysłowy (napisy nie mogą zawierać znaku
przejścia do nowej linii).
Komentarze są ignorowane (ale rozdzielają sąsiadujące z nimi elementy). Napisy mogą wystąpić
jedynie w instrukcji write.
Inne znaki są w kodzie źródłowym (poza komentarzami i napisani) niedozwolone i powinny
powodować błąd kompilacji (w komentarzach i napisach dozwolone są dowolne znaki, oprócz
przejścia do nowej linii).
2) Program
Program rozpoczyna się od słowa kluczowego program, po którym następują ujęte w nawiasy
klamrowe ciąg deklaracji i ciąg instrukcji.
Przykład:
program
 {
 int a;
 a = 3;
 write a+1;
 }
Uwaga: zarówno ciąg deklaracji jak i instrukcji mogą być puste, czyli poprawny jest program
program {} 
3) Deklaracje
Pojedyncza deklaracja składa się z typu, identyfikatora i średnika.
Dozwolone typy to int (32-bitowa liczba całkowita ze znakiem), double (64-bitowa liczba
zmiennopozycyjna) i bool (wartość logiczna - true lub false).
Wartości logiczne reprezentowane są jako liczby całkowite 1 (true) i 0 (false).
Deklaracje nie zawierają inicjalizatorów, ale zmienne inicjowane są niejawnie wartościami zerowymi
odpowiedniego typu.
Przykłady:
int n;
double wynik;
bool isOK;
Uwaga 1: Wszystkie zmienne muszą być zadeklarowane, próba użycia niezadeklarowanej zmiennej
powinna powodować błąd kompilacji z komunikatem "undeclared variable"
Uwaga 2: Nazwy zmiennych (identyfikatory) muszą być unikalne, próba ponownej deklaracji
zmiennej o takiej samej nazwie jak wcześniej zadeklarowana powinna powodować błąd kompilacji z
komunikatem "variable already declared "
4) Instrukcje
Język zawiera 7 instrukcji
A) Instrukcja blokowa to ciąg instrukcji ujętych w nawiasy klamrowe, jest użyteczna tam gdzie
składnia języka wymaga pojedynczej instrukcji (np. jako instrukcje wewnętrzne w if lub while),
a należy wykonać cały ciąg operacji.
Przykład:
{ read n; i = i+n; }
Uwaga: dozwolona jest instrukcja blokowa z pustym ciągiem instrukcji postaci { }.
B) Instrukcja wyrażeniowa to dowolne wyrażenie, po którym następuje średnik (analogicznie jak w
języku C/C++).
Przykłady:
n = 1;
x+y;
( a>=0 && a<10 ) || b>3 ;
Uwaga: wyrażenia opisane będą w dalszej części dokumentu.
C) Instrukcja warunkowa ma dwie postaci.
Postać "z elsem" rozpoczyna się od słowa kluczowego if, po którym następuje ujęte z nawiasy
wyrażenie typu bool, po nim instrukcja, a następne słowo kluczowe else i kolejna instrukcja.
Postać "bez elsa" jest taka sama z tym, że nie ma słowa else i następującej po nim instrukcji.
Działanie instrukcji warunkowej jest standardowe (jeśli warunek jest prawdziwy to wykonywana jest
instrukcja następująca bezpośrednio po nim, a jeśli warunek jest fałszywy to wykonywana jest
instrukcja po słowie kluczowym else, a dla wersji "bez else" nic nie jest wykonywane).

Przykłady:
if ( n > k )
 k = k*2;
else
 k - k/2;
if ( x==0 ) { res = 1; return; }

D) Instrukcja pętli rozpoczyna się od słowa kluczowego while, po którym następuje ujęte z nawiasy
wyrażenie typu bool, a po nim instrukcja.
Działanie instrukcji pętli jest standardowe (jeśli warunek jest prawdziwy to wykonywana jest
następująca po nim instrukcja, a następnie warunek sprawdzany jest ponownie i tak dalej).
Przykład:
n = 0;
while ( n<10 )
 {
 n = n + 1;
 write n;
 }
E) Instrukcja wejściowa rozpoczyna się od słowa kluczowego read, po którym następuje
identyfikator, a po nim średnik.
W wyniku wykonania instrukcji wejściowej zmienna określona występującym i niej identyfikatorem
otrzymuje wartość wczytaną ze strumienia wejściowego.
Uwaga 1: Strumień wejściowy standardowo oznacza klawiaturę, ale MUSI być prawidłowo
obsługiwane przekierowanie strumienia wejściowego na wejście z pliku (jest to niezbędne dla
prawidłowego przebiegu testów programu).
Uwaga 2: W zależności od typu zmiennej, do której wczytywane są dane instrukcja wejściowa musi
prawidłowo obsługiwać ciągi odpowiadające liczbom całkowitym, liczbom zmiennopozycyjnym lub
stałym true i false. Język nie definiuje zachowania programu dla niewłaściwego ciągu wejściowego.
Uwaga 2a: Elementem liczb zmiennopozycyjnych zawsze jest kropka (nigdy przecinek), niezależnie
od ustawień systemu Windows.
F) Instrukcja wyjściowa ma dwie postaci.
Pierwsza postać rozpoczyna się od słowa kluczowego write, po którym następuje wyrażenie, a po nim
średnik. W wyniku wykonania instrukcji wyjściowej do strumienia wyjściowego wypisywana jest
wartość wyrażenia.
Druga postać rozpoczyna się od słowa kluczowego write, po którym następuje napis, a po nim
średnik. W wyniku wykonania instrukcji wyjściowej do strumienia wyjściowego wypisywany jest
podany napis. Napis to dowolny ciąg znaków ujęty w cudzysłowy.
Uwaga 1: Strumień wyjściowy standardowo oznacza ekran monitora, ale MUSI być prawidłowo
obsługiwane przekierowanie strumienia wyjściowego do pliku (jest to niezbędne dla prawidłowego
przebiegu testów programu).
Uwaga 2: Postać wypisywanych wyników MUSI być dokładnie taka jak w poniższym przykładzie
(jest to niezbędne dla prawidłowego przebiegu testów programu). 

Przykład:
Następujący program
program
 {
 int i;
 double d;
 bool b;
 i = 5;
 d = 123.456;
 b = true;
 write i;
 write "\n";
 write d;
 write "\n";
 write b;
 write "\n";
 }
Wypisuje na strumień wyjściowy
5
123.456000
True
Czyli dokładnie to samo co następujący fragment kodu w języku C#
static void Main()
 {
 int i = 5;
 double d = 123.456;
 bool b = true;
 Console.Write(i);
 Console.Write("\n");
 Console.Write(string.Format(
 System.Globalization.CultureInfo.InvariantCulture,
 "{0:0.000000}",d));
 Console.Write("\n");
 Console.Write(b);
 Console.Write("\n");
 }
G) Instrukcja powrotu składa się ze słowa kluczowego return i średnika.
Wykonanie instrukcji powrotu powoduje zakończenie programu.
Uwaga: Dotarcie sterowania do nawiasu klamrowego kończącego blok programu automatycznie
kończy wykonanie programu, w takim przypadku instrukcja powrotu nie jest konieczna. 

5) Wyrażenia
Poniższa tabela opisuje wszystkie operatory występujące w języku i ich podstawowe własności.
Lp. Grupa - priorytet Nazwa Symbol Łączność
minus unarny -
negacja bitowa ~
negacja logiczna !
konwersja na int (int)
1 unarne
konwersja na double (double)
prawostronna
suma bitowa | 2 bitowe iloczyn bitowy & lewostronna
mnożenie 3 multiplikatywne dzielenie lewostronna
dodawanie 4 addytywne odejmowanie lewostronna
równe ==
różne !=
większe niż >
większe niż lub równe >=
mniejsze niż <
5 relacje
mniejsze niż lub równe <=
lewostronna
suma logiczna || 6 logiczne iloczyn logiczna && lewostronna
7 przypisanie przypisanie = prawostronna
Operatory z jednej grupy mają ten sam priorytet, w tabeli operatory umieszczone są w kolejności od
najwyższego priorytetu (operatory unarne) do najniższego (przypisanie).
Uwaga: priorytety są inne niż w powszechnie używanych językach programowania (jest to świadoma
decyzja).
1) Operatory unarne
A) Argument minusa unarnego może być typu int lub double, wynik jest takiego samego typu jak
argument.
B) Argument negacji bitowej musi być typu int, wynik również jest typu int.
C) Argument negacji logicznej musi być typu bool, wynik również jest typu bool.
D) Argument konwersji na int może być dowolnego typu, wynik jest typu int.
uwaga 1: wynikiem konwersji wartości false jest 0, a true 1.
uwaga 2: konwersja z double na int polega na odrzuceniu części ułamkowej
E) Argument konwersji na double może być dowolnego typu, wynik jest typu double
uwaga 1: wynikiem konwersji wartości false jest 0.0, a true 1.0.
uwaga 2: dozwolona jest również niejawna konwersja z int na double.
Wszystkie operatory unarne umieszcza się przed ich argumentem.
Wszystkie operatory unarne można wielokrotnie powtarzać.
2) Operatory bitowe
Oba argumenty operatorów bitowych muszą być typu int, wynik również jest typu int.
3,4) Operatory multiplikatywne i addytywne
Każdy z argumentów operatorów multiplikatywnych i addytywnych może być typu int lub double.
Jeśli oba argumenty są typu int to wynik również jest typu int, w przeciwnym przypadku wynik jest
typu double. 

5) Relacje
Każdy z argumentów operatorów relacyjnych może być typu int lub double, wynik jest typu bool.
Dla operatorów == i != dozwolone są również oba argumenty typu bool (wynik oczywiście też jest
typu bool).
6) Operatory logiczne
Każdy z argumentów operatorów logicznych musi być typu bool, wynik jest typu bool.
Operatory logiczne MUSZĄ zostać zrealizowane jako obliczenia skrócone.
7) Przypisanie
Lewym argumentem przypisania musi być zmienna (identyfikator).
Do zmiennej typu double można przypisać wartość wyrażenia typu double lub int.
Do zminennych typu int i bool można przypisać jedynie wartość wyrażenia takiego samego typu jak
zmienna.
Ponadto elementem wyrażeń mogą być również nawiasy ( ).
Ich znaczenie jest standardowe.
Jeśli opisane powyżej w punktach 1-7 zasady dotyczące typów nie są zachowane kompilator powinien
sygnalizować błąd.
6) Obsługa błędów
W przypadku bezbłędnej kompilacji program musi kończyć się z kodem wyjścia 0, w przypadku
błędów kod wyjścia musi być większy od 0 (jest to niezbędne do testowania).
Błędy w kodzie źródłowym nie mogą powodować zapętlenie ani zawieszenia się kompilatora (coś
takiego uniemożliwia automatyczne testowanie i jest poważnym błędem). Niedopuszczalne jest
również zakończenie pracy kompilatora zgłoszeniem wyjątku.
Nie wszystkie błędy muszą być wykryte, ale błędny program nie może być uznany za poprawny i nie
może być dla niego próby generowania kodu.
Błędy powinny być możliwie dokładnie lokalizowane (powinny być podawane sensowne numery
linii). Natomiast opisy błędów składniowych nie muszą być precyzyjne (dozwolone jest nawet proste
"syntax error" z numerem linii). Błędy semantyczne jako łatwiejsze do zdiagnozowania powinny być
opisane precyzyjniej.

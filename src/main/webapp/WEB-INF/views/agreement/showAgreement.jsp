<%--
  Created by IntelliJ IDEA.
  User: wojtek
  Date: 10.06.2020
  Time: 15:44
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="pl-PL">
<head>

    <title>Agreement</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value="/css/style.css"/>">
</head>
<body>
<p>Umowa nr ${client.id}</p>
<p>Zawarta w ${client.town} dnia ${transaction.dateOfSign} pomiędzy</p>
<p>Firmą ${client.name} z siedzibą w ${client.town} przy ul. ${client.town} /// dodać blok i mieszkanie z mechanizmem że jak nie ma mieszkania to się nie pojawia, kod pocztowy ${client.postalCode}, REGON ${client.REGON}, NIP
${client.NIP},
reprezentowaną przez: .........................................................................................
(imię i nazwisko, uprawnienie do reprezentacji)
    zwaną dalej <b>Faktorantem</b>
a
2. Firmą Faktoring dla wszystkich S.A. z siedzibą w Warszawie przy ul.
Finansowej 1, kod pocztowy 01-111, REGON 111111111, NIP
2222222222,
reprezentowaną przez ................................................................................
(imię i nazwisko, uprawnienie do reprezentacji)
    zwaną dalej <b>Faktorem</b>.
Strony zawierają umowę o następującej treści:
§ 1
Faktorant oświadcza, że przysługuje mu w stosunku do jego dłużnika, zwanego dalej Dłużnikiem, niesporna wierzytelność w
kwocie .............. (słownie: .......................) zł z tytułu ........................................... ​
(np.
sprzedaży, dostawy) wynikająca z umowy nr ...................... z dnia ................ i faktury nr
................................. wystawionej dnia ....................... z terminem płatności
............................ Kopia umowy oraz faktory stanowi załącznik nr 1 do niniejszej umowy.
§ 2
1. Faktorant przenosi na rzecz Faktora wierzytelność określoną w § 1, a Faktor
przyjmuje przelew.
2. Wraz z wierzytelnością przelane zostają na Faktora wszelkie świadczenia uboczne,
w szczególności roszczenie o odsetki z tytułu opóźnienia Dłużnika w zapłacie ceny.
3. Przelew będzie skuteczny po zawiadomieniu Dłużnika o dokonaniu przelewu
wierzytelności i potwierdzenia przez niego przyjęcia do wiadomości dokonanego
przelewu. Potwierdzenie musi być pisemne.
4. Faktorant zobowiązuje się powiadomić Dłużnika o przelewie oraz przedstawić
Faktorowi pisemne potwierdzenie Dłużnika, o którym mowa w poprzednim ustępie.
5. W ramach niniejszej umowy Faktor zobowiązuje się monitorować wypłacalność
Dłużnika oraz prowadzić wszelkie rozliczenia związane z wierzytelnością, inkasować
i ewidencjonować wpływy należności.
§ 3
Wykup wierzytelności nastąpi na podstawie doręczonej przez Faktoranta uwierzytelnionej
kopii faktury, stwierdzającej wierzytelność.
§ 4
Faktorant oświadcza, że wierzytelność, o której mowa w § 1 nie jest przedawniona,
obciążona prawami osób trzecich, nie została również zajęta przez organy egzekucyjne.
Ponadto Faktorant oświadcza, że przelewowi nie sprzeciwiają się ograniczenia umowne
oraz że Dłużnikowi nie przysługują wobec Faktoranta wierzytelności, które mogłyby zostać
potrącone z wierzytelności określonej w § 1.
§ 5
1. Faktor zapłaci Faktorantowi kwotę stanowiącą .....% wartości nominalnej przelanej
wierzytelności w terminie ..... dni od zawarcia umowy. Pozostałe ....% wartości
nominalnej wierzytelności, pomniejszone o ....% wartości nominalnej wierzytelności,
które stanowi wynagrodzenie dla Faktora, Faktor wypłaci Faktorantowi ..... dni od
daty zapłaty długu przez Dłużnika.
2. Zapłata nastąpi przelewem na rachunek Faktoranta nr ........................................ Datą
zapłaty jest data księgowania polecenia obciążenia rachunku Faktora.
§ 6
Spłata zobowiązania wynikającego ze sprzedanej wierzytelności obciąża Dłużnika. Ryzyko
niewypłacalności Dłużnika ponosi Faktor.
§ 7
Prawne zabezpieczenie spłaty wierzytelności objętej niniejszą umową stanowi
.......................................................................................................................
§ 8
1. Wszelkie zmiany niniejszej umowy wymagają formy pisemnej pod rygorem
nieważności.
2. W sprawach nieuregulowanych w niniejszej umowie stosuje się przepisy Kodeksu
cywilnego.
3. Do rozstrzygania sporów mogących wyniknąć na tle niniejszej umowy właściwy
będzie sąd .......................................................
4. Umowę sporządzono w ...... jednobrzmiących egzemplarzach, po ........ dla każdej
ze stron.
....................................
............................................
Faktor Faktorant
(podpis) (podpis)
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>

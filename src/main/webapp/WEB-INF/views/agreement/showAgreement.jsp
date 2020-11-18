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
    <script>
        function printDiv(divName) {
            var printContents = document.getElementById(divName).innerHTML;
            var originalContents = document.body.innerHTML;

            document.body.innerHTML = printContents;

            window.print();

            document.body.innerHTML = originalContents;
        }
    </script>
</head>
<body class="agreement">

<div class="container" >
    <div class="" id="printableArea">
        <p>Umowa nr ${client.id}</p>
        <p>Zawarta w ${client.town} dnia ${transaction.dateOfSign} pomiędzy</p>
        <ol>
            <li><p>
                Firmą <b>${client.name}</b>, <b>${client.adress}</b>,
                REGON <b>${client.REGON}</b>, NIP
                    <b>${client.NIP}</b>,
            </p>
                <p>reprezentowaną przez:
                    .........................................................................................
                    (imię i nazwisko, uprawnienie do reprezentacji)
                    zwaną dalej <b>Faktorantem</b></p></li>
            <p>a</p>
            <li>
                <p><b>Firmą Faktoring dla wszystkich S.A. </b>z siedzibą w <b>Warszawie</b> przy <b>ul.
                    Finansowej 1</b>, kod pocztowy <b>01-111</b>, REGON <b>111111111</b>, NIP
                        <b>2222222222</b>,</p>
                <p>reprezentowaną przez ................................................................................
                    (imię i nazwisko, uprawnienie do reprezentacji)
                    zwaną dalej <b>Faktorem</b>.</p></li>
        </ol>
        <p>Strony zawierają umowę o następującej treści:</p>
        <ol>
            <li>
                Faktorant oświadcza, że przysługują mu w stosunku do jego dłużników, zwanych dalej Dłużnikami, niesporne
                wierzytelności w kwotach wskazanych na fakturach z tytułu sprzedaży towarów i/lub realizacji usług
                wynikająca z
                umów zawartych pomiędzy Faktorantem a Dłużnikami (zwane dalej Wierzytelnościami).
            </li>

            <li>
                <ol type="a">
                    <li>Faktor przyznaje Faktorantowi limit w wysokości <b>${transaction.amount} ${transaction.currency}</b>
                        zwany
                        dalej Limitem finansowania.
                    </li>
                    <li>Limit finansowania jest odnawialny. Oznacza to, że każdorazowy wykup Wierzytelności przez
                        Faktora
                        obciąża Limit finansowania o wartość wykupionej Wierzytelności, a każdorazowa spłata
                        Wierzytelności
                        przez Dłużnika powoduje odnowienie Limitu finansowania o wysokość danej spłaty.
                    </li>
                    <li>Faktorant zobowiązuje się do zapłaty Faktorowi prowizji z tytułu administrowania limitem w
                        wysokości <b>${transaction.administrationFee}% </b>od kwoty Limitu finansowania w cyklach miesięcznych.
                    </li>
                    <li>Faktorant zobowiązuje się do zapłaty Faktorowi prowizji z tytułu niewykorzystanego Limitu
                        finansowania w
                        wysokości <b>${transaction.arrangementFee}%</b> od kwoty niewykorzystanego Limitu finansowania.
                    </li>
                    <li>Faktorant zobowiązuje się do zapłaty Faktorowi prowizji z tytułu przyznania Limitu w
                        finansowania.
                    </li>
                </ol>
            </li>
            <li>
                <ol type="a">
                    <li>
                        Faktorant przenosi na rzecz Faktora Wierzytelności określone w § 1, a Faktor przyjmuje przelew.
                    </li>
                    <li> Wraz z Wierzytelnościami przelane zostają na Faktora wszelkie świadczenia uboczne, w
                        szczególności
                        roszczenie o odsetki z tytułu opóźnienia Dłużnika w zapłacie ceny.
                    </li>
                    <li> Przelew będzie skuteczny po zawiadomieniu Dłużnika o dokonaniu przelewu Wierzytelności i
                        potwierdzenia
                        przez niego przyjęcia do wiadomości dokonanego przelewu. Potwierdzenie musi być pisemne. Dłużnik
                        zostanie poinformowany o nowym rachunku do spłat Faktora <b>${transaction.repaymentAccount}</b>.
                    </li>
                    <li>Faktorant zobowiązuje się powiadomić Dłużnika o przelewie oraz przedstawić Faktorowi pisemne
                        potwierdzenie Dłużnika, o którym mowa w poprzednim ustępie.
                    </li>
                    <li>W ramach niniejszej umowy Faktor zobowiązuje się monitorować wypłacalność Dłużnika oraz
                        prowadzić
                        wszelkie rozliczenia związane z wierzytelnością, inkasować i ewidencjonować wpływy należności.
                    </li>
                </ol>
            </li>
            <li>
                Wykup wierzytelności nastąpi na podstawie doręczonej przez Faktoranta do Faktora uwierzytelnionej
                kopii faktury, stwierdzającej Wierzytelność.
            </li>
            <li>
                Faktorant oświadcza, że Wierzytelności, o których mowa w § 1 nie są przedawnione,
                obciążona prawami osób trzecich, nie została również zajęta przez organy egzekucyjne.
                Ponadto Faktorant oświadcza, że przelewowi nie sprzeciwiają się ograniczenia umowne
                oraz że Dłużnikowi nie przysługują wobec Faktoranta wierzytelności, które mogłyby zostać
                potrącone z Wierzytelności określonej w § 1.
            </li>
            <li>
                <ol type="a">
                    <li>Faktor zapłaci Faktorantowi kwotę stanowiącą 100% wartości nominalnej przelanej wierzytelności
                        pomniejszoną o:
                        <ol type="I">
                            <li>prowizję operacyjną w wysokości <b>${transaction.operationalFee}% </b>od każdej zgłoszonej
                                Wierzytelności
                            </li>
                            oraz
                            <li>odsetki dyskontowe naliczane od wartości Wierzytelności według odpowiedniej
                                stopy <b>${transaction.referenceRate} </b>powiększonej o marżę <b>${transaction.margin} p.p.p.a.</b>
                            </li>
                            w terminie 2 dni roboczych od zgłoszenia przez Faktoranta Wierzytelności do wykupu.
                        </ol>
                    </li>
                    <li>Zapłata nastąpi przelewem na rachunek Faktoranta nr <b>${client.account}</b>. Datą zapłaty jest data
                        księgowania polecenia obciążenia rachunku Faktora.
                    </li>
                </ol>
            </li>
            <li>
                Spłata zobowiązania wynikającego ze sprzedanej wierzytelności obciąża Dłużnika. Ryzyko
                niewypłacalności Dłużnika ponosi Faktor.
            </li>
            <li>
                Prawne zabezpieczenie spłaty wierzytelności objętej niniejszą umową stanowi
                <b>${transaction.collaterals}</b>
            </li>
            <li>
                Umowa została zawarta na czas
                <c:choose>
                    <c:when test="${transaction.hasValidDate == false}">
                <b>nieokreślony</b>
                    </c:when>
                    <c:otherwise>
                        określony, do dnia <b>${transaction.validDate}</b>.
                    </c:otherwise>
                </c:choose>
            </li>
            <li>
                <ol type="a">
                    <li>Wszelkie zmiany niniejszej umowy wymagają formy pisemnej pod rygorem
                        nieważności.
                    </li>
                    <li>W sprawach nieuregulowanych w niniejszej umowie stosuje się przepisy Kodeksu
                        cywilnego.
                    </li>
                    <li>Do rozstrzygania sporów mogących wyniknąć na tle niniejszej umowy właściwy
                        będzie sąd dla miasta <b>${client.town}</b>.
                    </li>
                    <li>Umowę sporządzono w dwóch jednobrzmiących egzemplarzach, po jednym dla każdej
                        ze stron.
                    </li>
                </ol>
            </li>
        </ol>
        <table>
            <tr>
                <td>
                    ............................................
                </td>
                <td>............................................</td>
            </tr>
            <tr>
                <td>Faktor</td>
                <td>Faktorant</td>
            </tr>
            <tr>
                <td>(podpis)</td>
                <td>(podpis)</td>
            </tr>
        </table>

    </div>
    <p>
        <br><br><br>
    <input type="button" class="btn btn-primary btn-lg btn-success" onclick="printDiv('printableArea')" value="Wygeneruj umowę w PDF" />
    </p>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>

</html>

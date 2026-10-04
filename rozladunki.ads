with Dostawy;
package Rozladunki is
   task type rozladunek is
      entry Przyjmij_Dostawe(Dostawa : in Dostawy.Dane_Dostawy);
   end rozladunek;
   Stanowisko_1 : rozladunek;
   Stanowisko_2 : rozladunek;
end Rozladunki;
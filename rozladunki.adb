with Ada.Text_IO;
use Ada.Text_IO;
with Dostawy;

package body Rozladunki is 
   task body Rozladunek is
   begin
      for I in 1..10 loop
         accept Przyjmij_Dostawe(Dostawa : in Dostawy.Dane_Dostawy) do
         Put_Line("Rozpoczeto rozladunek nr " &Integer'Image(Dostawa.Id));
         Put_Line("Ilosc towaru :" &Integer'Image(Dostawa.Ilosc));
         Put_Line("Rodzaj towaru : " &Dostawy.Rodzaje_Towaru'Image(Dostawa.Towar));
         Put_Line("Spodziewany czas rozladunku :" &Integer'Image(Integer(Dostawa.Ilosc * 0.5)) &"s");
         delay Duration(Integer(Dostawa.Ilosc * 0.5));
         Put_Line("Rozladunek nr " &Integer'Image(Dostawa.Id) &" zakonczony");
         delay 2.0;
         end Przyjmij_Dostawe;
      end loop;
   end Rozladunek;
end Rozladunki;
with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with rozladunki;

package body Dostawy is

   task body Dostawa is
      
      subtype Zakres_Przerwy is Integer range 1 .. 10;
      package Losowanie_Przerwy is new Ada.Numerics.Discrete_Random(Zakres_Przerwy);
      Gen_Przerwy : Losowanie_Przerwy.Generator;
      
      package Losowanie_Towaru is new Ada.Numerics.Discrete_Random(Rodzaje_Towaru); 
      Gen_Towaru : Losowanie_Towaru.Generator;

      subtype Zakres_Ilosci is Integer range 1 .. 20;
      package Losowanie_Ilosci is new Ada.Numerics.Discrete_Random(Zakres_Ilosci);
      Gen_Ilosci : Losowanie_Ilosci.Generator;

      Czas_Przerwy : Zakres_Przerwy;
      Id : Integer := 1;
      Dostawa_Aktualna : Dane_Dostawy;
   begin
      Losowanie_Przerwy.Reset(Gen_Przerwy);
      Losowanie_Towaru.Reset(Gen_Towaru);
      Losowanie_Ilosci.Reset(Gen_Ilosci);

      for I in 1 .. 10 loop
         Dostawa_Aktualna.Id := Id;
         Dostawa_Aktualna.Znak_Transportu := Znak_Transportu;
         Dostawa_Aktualna.Ilosc := Losowanie_Ilosci.Random(Gen_Ilosci);
         Dostawa_Aktualna.Towar := Losowanie_Towaru.Random(Gen_Towaru);
         Czas_Przerwy := Losowanie_Przerwy.Random(Gen_Przerwy);
         delay Duration(Czas_Przerwy);
         Put_Line("Przyjechala dostawa " &Character'Image(Dostawa_Aktualna.Znak_Transportu)& Integer'Image(Id));
         Rozladunki.Stanowisko_1.Przyjmij_Dostawe(Dostawa_Aktualna);
         Id := Id +1;
      end loop;
   end Dostawa;

end Dostawy;
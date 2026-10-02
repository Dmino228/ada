with Ada.Text_IO;
use Ada.Text_IO;
with Ada.Numerics.Discrete_Random;
with Robot;

package body Dostawy is

   task body Dostawa is
      subtype Zakres is Integer range 1 .. 10;

      package Losowanie is
         new Ada.Numerics.Discrete_Random(Zakres);

      Gen : Losowanie.Generator;
      X : Zakres;

   begin
      Losowanie.Reset(Gen);
      for I in 1 .. 10 loop
         Put_Line("Przyjechala dostawa nr " & Integer'Image(I));
         Robot.Robot_1.Dostawa;
         X := Losowanie.Random(Gen);
         delay Duration(X);
      end loop;
   end Dostawa;

end Dostawy;
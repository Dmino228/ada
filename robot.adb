with Ada.Text_IO;
use Ada.Text_IO;

package body Robot is

   task body R is
   begin
      loop
         accept Dostawa do
            Put_Line("Robot przetwarza dostawe...");
         end Dostawa;
      end loop;
   end R;

end Robot;
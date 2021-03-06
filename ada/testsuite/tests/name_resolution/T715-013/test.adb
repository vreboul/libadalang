procedure Test is
   package P is
      type T;
      type T_CW is access all T'Class;

      function Foo (X : access T) return Boolean is (1);

      type T is tagged null record;
   end P;

   package Q is
      type U;
      type U_CW is access all U'Class;

      function Foo (X : access U) return Integer is (2);

      type U is tagged null record;
   end Q;

   package R is
      type T is new P.T with null record;
      type U is new Q.U with null record;
   end R;

   use R;

   X : Q.U_CW;
begin
   case Foo (X) is
      when 1 => null;
      when others => null;
   end case;
   pragma Test_Statement;
end Test;

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is 
  
 task task_1 is
 pragma priority(1);
 end task_1;
 
 task task_2 is
 pragma priority(1);
 end task_2;
  
 task task_3 is 
 pragma priority(1); 
 end task_3; 
  

 
 task body task_1 is
  type Vector is array(Integer range <>) of Integer;
    n : Integer;
    imax : Integer;
    tmp : Integer;
 begin
      Put_Line("Size vector:");
    Get(n);
    declare
        mas : Vector(1..n);
    begin
        Put_Line("Vector: ");
        for i in 1..mas'Last loop
            Get(mas(i));
         end loop;
          for i in reverse 1..n loop
            imax := mas(i);
            for j in 1..(i - 1) loop
                if mas(j) > mas(imax) then
                    imax := j;
                end if;
            end loop;
            tmp := mas(i);
            mas(i) := mas(imax);
            mas(imax) := tmp;
        end loop;
         Put_Line("Out vector: ");
        for i in 1..mas'Last loop
            Put(Item => mas(i), Width => 1);
            Put(" ");
        end loop;
         New_Line;
         delay (0.001);
         Put_Line("Task 1 finished");
         end;
   end task_1;
 
  --------------------------------------------------------------------------------------------------------
 task body task_2 is
      type Matrix is array(1..3, 1..3) of Integer;
      type Vector is array(1..3) of Integer;
      MZ : Matrix;
      MN : Matrix;
      MO : Matrix;
      temp : Matrix;
      B : Vector;
      A : Vector;
 begin
 Put_Line("Task 2 started");
 
 B :=(5,4,1);
      A := (0, 0, 0);
 
      temp := ((0, 0, 0),
 (0, 0, 0),
 (0, 0, 0));
 
 
 MO :=
  ((1, 2, 3),
  (4, 5, 6),
  (7, 8, 9)
 );
 
 MN := ((10, 11, 12),
 (13, 14, 15),
 (16, 17, 18));
 
 MZ := ((19, 20, 21),
 (22, 23, 24),
        (25, 26, 27));
 
 for i in 1..3 loop
         for j in 1..3 loop
            temp(i, j) := MO(i, j) - MN(i, j)+ MZ(i, j);
         end loop;
 end loop;
 
 for i in 1..3 loop
         for j in 1..3 loop
            A(i) := A(i)+temp(i,j)*B(j);
         end loop;
 end loop;
 
 Put_Line("A=");
 for i in 1..3 loop
 
            Put(Item => A(i), Width => 1);
            Put(" ");
 
 
      end loop;
      New_Line;
       delay (0.01);
 Put_Line("Task 2 finished");
 end task_2;
 
   ----------------------------------------------------------------------------------
   
 task body task_3 is
 
 
 type Matrix is array(1..3, 1..3) of Integer;
      MC : Matrix;
      MS : Matrix;
      MV : Matrix;
      result_1 : Matrix;
      result_2 : Matrix;
      i,j : Integer;
      My_File : File_Type;
 begin
 Put_Line("Task 3 started");
 
      result_1 := 
        ((0, 0, 0), 
         (0, 0, 0), 
         (0, 0, 0));
           result_2 := 
        ((0, 0, 0), 
         (0, 0, 0), 
         (0, 0, 0)); 

      i := 1;
      j := 1;
     
      Open(File => My_File, Mode => In_File, Name => "D:\\MC.txt");

 while not End_Of_File(My_File) loop
         while not End_Of_Line(My_File) loop
            Get(File => My_File, Item => MC(i,j));
            
            j := j + 1;
         end loop;
         j :=1;
         i := i+1;
         
 Skip_Line(My_File);
 end loop;
      Close(My_file);
      
      i := 1;
      j := 1;
      Open(File => My_File, Mode => In_File, Name => "D:\\MS.txt");
     
      while not End_Of_File(My_File) loop
         while not End_Of_Line(My_File) loop
            Get(File => My_File, Item => MS(i,j));          
          j := j + 1;
         end loop;
         i := i+1;
         j := 1;
        
         Skip_Line(My_File);
 end loop;
 Close(My_file);
 
 i := 1;
 j := 1;
 Open(File => My_File, Mode => In_File, Name => "D:\\MV.txt");

 while not End_Of_File(My_File) loop
         while not End_Of_Line(My_File) loop
            Get(File => My_File, Item => MV(i,j));
            
            j := j + 1;
 end loop;
 i := i+1;
 j := 1;
 Skip_Line(My_File);
 end loop;
 Close(My_file);
 for i in 1..3 loop
         for j in 1..3 loop
            for k in 1..3 loop
               result_1(i, j) := result_1(i, j) + MV(i, k) * MC(k, j);
            end loop;
         end loop;
      end loop;
  
 for i in 1..3 loop
         for j in 1..3 loop
            for k in 1..3 loop
               result_2(i, j) := result_2(i, j) + result_1(i, k) * MC(k, j);
            end loop;
         end loop;
 end loop;
 
 Put_Line("MT = ");     
 for i in 1..3 loop
         for j in 1..3 loop
            Put(Item => result_2(i, j), Width => 1);
            Put(" ");
         end loop;
         New_Line;
 end loop;

      New_Line;
      delay (0.01);
 Put_Line("Task 3 finished");
 end task_3;
 
 
begin 

 null; 
end Main; 

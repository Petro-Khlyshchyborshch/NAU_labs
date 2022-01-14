%------------------------------------------------------------------------------
% Задача. Напишіть декларативну програму, яка зберігає дані про
% коефіцієнти багаточлена у вигляді списку, і, звертаючись до нього,
% може підрахувати чисельне значення багаточлена при заданому
% значенні змінної.


domains
  list = integer*
  pochatok = integer
  mnognuk = integer
predicates
  mnog(list,pochatok,mnognuk)
  % список_із_коефіцієнтів многочлена, початкове значення обрахунків, значення Х
clauses  
 mnog([],X,_):- %База рекурсії
	write("znachenya = ",X),!.% Вивід підрахованого значення многочлена
 mnog([Head|Tail],Numb,X):- 
	T=Head*X,N=T+Numb, % Виконання множення і додавання
	mnog(Tail,N,X). %Рекурсивний виклик 

goal
	write("Enter X: "), %Виведення інформації
	readint(X), %Введення Х
	mnog([2,4,5],0,X). % Виклик обрахунків із заданим коефіцієнтами

%------------------------------------------------------------------------------

% Задача. Напишіть декларативну програму, яка роздрукує на екрані всі
% числа – елементи заданого списку, окрім нульових.
domains
  list = integer*
predicates
  print(list)
  
clauses  
 print([]).

 print([0|Tail]):-
 print(Tail).

 print([Head|Tail]):-
 write(Head),nl,print(Tail).

goal
	print([1,2,0,3,4,5]).

%------------------------------------------------------------------------------

% Задача. Напишіть декларативну програму, яка введе з клавіатури до
% списку елементи-числа, після чого проаналізує цей список і визначить
% найбільше з чисел, що до нього входять.
domains
  list = integer*
predicates
  readlist(list)
  nondeterm max(list,integer)
clauses  
  readlist([Head|Tail]):-
    write("enter element or string to finish: "), readint(Head), !,
    readlist(Tail).
    readlist([]).

	max([X],X).
	max([H|Tail],H):-max(Tail,M),H>M,!.
	max([_|Tail],M):-max(Tail,M).

goal
  readlist(List),max(List,X),write("Max_elem "),write(X),nl.
%------------------------------------------------------------------------------

% Задача. Напишіть логічну програму «Телефонний довідник», яка
% дозволить користувачу визначити за іменем абонента номер
% телефону і навпаки.

database
	member(symbol,symbol)
predicates
  	searching_Name(symbol)
	searching_number(symbol)
	run
clauses 
 	searching_Name(Name):-
		%write ("Enter name :"),readln(Name),
		member(Name,X),
		write("->Result: ",X,"\n").
	searching_number(Phone):-
		%write ("Enter phone:"),readln(Phone),
		member(X,Phone),
		write("->Result: ",X,"\n").
	run:-
	assertz(member("Ivan","+380501941616")),
	assertz(member("Katya","+380693354601")),
	assertz(member("Ilona","+380501714317")).
goal
	run,
	write ("Enter name :"),readln(Name),
	searching_Name(Name),
	write ("Enter phone:"),readln(Phone),
	searching_number(Phone).

%------------------------------------------------------------------------------
% Задача. Декілька студентів прийшли здавати екзамен. Викладач дає їм
% білети, кожен з білетів має номер. Напишіть декларативну програму,
% яка визначить, чи зможуть студенти розподілити між собою наявні
% білети так, щоб кожен студент отримав білет, номер якого співпаде з
% номером студента в списку?

domains
 	list = integer*
predicates
  	member(integer, list)
  	search(list,list)
clauses 
 	member(Elem, [Elem|_Tail]).
	member(Elem, [_Head|Tail]):-
   	member(Elem, Tail).

	search([],_).
	search([H|T],List):-member(H,List),search(T,List).
goal
	
	List0 = [3,1,2],List1 = [1,2,3],search(List0,List1),write("Found").


%------------------------------------------------------------------------------

% Задача. Напишіть декларативну програму, яка визначить, чи є
% введений користувачем список впорядкованим за зростанням
% елементів.
domains
 	list = integer*
predicates
  	isOrdered(list)
  	readl(list)
clauses 
 	isOrdered([_]).
	isOrdered([X,Y]) :- Y>X.
	isOrdered([X,Y|H]) :- Y>X, isOrdered([Y|H]).
	readl([Head|Tail]):-
   	write("Enter number: "), 
	readint(Head), !,
    	readl(Tail).
    	readl([]).

goal
	  readl(L),isOrdered(L),write("This list is ordered").
	  
%------------------------------------------------------------------------------

% Задача. Напишіть декларативну програму,, яка виведе три найменших
% числа з заданого списку.

domains
 	list = integer*
predicates
  	delete(list, integer, list)
  	min_list(list, integer)
clauses 
 	delete([], _Elem, []):-!.
	delete([Elem|Tail], Elem, ResultTail):-
  	delete(Tail, Elem, ResultTail), !.
	delete([Head|Tail], Elem, [Head|ResultTail]):-
   	delete(Tail, Elem, ResultTail).
	
	min_list([MinElem], MinElem):-!.
	min_list([Head|Tail], MinElem):-
   	min_list(Tail, TailMinElem),
   	TailMinElem < Head, !, MinElem = TailMinElem;
   	MinElem = Head.
goal
	List = [1,2,3,4],
	min_list(List,X),delete(List,X,List_1),
	min_list(List_1,X1),delete(List_1,X1,List_2),
	min_list(List_2,X2),delete(List_2,X2,List_3),
	write(List_3).
%------------------------------------------------------------------------------

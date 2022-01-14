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

% Задача. Напишіть декларативну програму, яка підрахує кількість
% позитивних елементів у списку, заданому користувачем.

% Без введення з клавіатури:
domains
 	list = integer*
predicates
  	positiv(list,integer)
  	
clauses 
 	positiv([],N):-write(N).
	positiv([Head|Tail],N):-Head>=0,I=N+1,positiv(Tail,I).
	positiv([Head|Tail],N):-Head<=0,positiv(Tail,N).
goal
	positiv([1,3,4,-2,5,1,3,4],0).

% З введенняm з клавіатури 
domains
 	list = integer*
predicates
  	positiv(list,integer)
  	readlist(list)
clauses 
 	positiv([],N):-write("Kilkist dodatnih chusel ",N).
	positiv([Head|Tail],N):-Head>=0,I=N+1,positiv(Tail,I).
	positiv([Head|Tail],N):-Head<=0,positiv(Tail,N).
	
	readlist([Head|Tail]):-
   	write("enter element or string to finish: "), readint(Head), !,
    	readlist(Tail).
    	readlist([]).

goal
	  readlist(List),positiv(List,0).

%------------------------------------------------------------------------------

% Задача.
% Дано список, в якому є додатні і від’ємні числа. Напишіть
% декларативну програму, яка підрахує середнє арифметичне
% позитивних елементів заданого списку.

domains
 	list = integer*
predicates
  	positiv(list,integer,integer)
  	
clauses 
 	positiv([],N,S):-M=S/N,write(M),!.
	positiv([Head|Tail],N,S):-Head>=0,I=N+1,T=S+Head,positiv(Tail,I,T).
	positiv([Head|Tail],N,S):-Head<=0,positiv(Tail,N,S).
goal
	positiv([1,3,4,-2,5,1,3,4],0,0).

%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат includes(X1,X2,X3,L) , який
% визначить, чи містить заданий список (L) три заданих елементи
% (X1,X2,X3) .

domains
 	L = integer*
predicates
  	member (integer,L)
	includes(integer,integer,integer,L)
  
clauses  
	member(Elem, [Elem|_Tail]).
	member(Elem, [_Head|Tail]):-
  	member(Elem, Tail).
	includes(N,N1,N2,K):-member(N,K),member(N1,K),member(N2,K),write("E vsi chusla").
	
goal
	includes(2,4,1,[1,3,4,2,5,1,3,4]).

%------------------------------------------------------------------------------

% Задача. Список містить позитивні та негативні числа. Мовою Пролог
% опишіть предикат nth_positive_member (N,L,Y), який визначить n-й
% позитивний елемент заданого списку L.

% Неробить:
domains
 	L = integer*
	N= integer
	Y= integer
predicates
  	nth_positive_member (N,L,Y)
  
clauses  
	nth_positive_member(1,[Head|Tail],Head).
	nth_positive_member(N,[Head|Tail],Head):-Head>0,I=N-1,nth_positive_member(I,Tail,Head).
	nth_positive_member(N,[Head|Tail],Head):-Head<0,nth_positive_member(N,Tail,Head).
goal
	nth_positive_member(4,[1,3,4,2,5,1,3,4],X),write(X).
	
%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат includes(X1,X2,X3,L) , який визначить, чи містить заданий список (L) три заданих елементи (X1,X2,X3).

domains
	list=integer*
predicates
  	includes(integer,integer,integer,list)
clauses  
	includes(_,_,_,[]):-write("Not found"),!.
	includes(0,0,0,_):-write("Found"),!.
	includes(X,Y,Z,[X|T]):-includes(0,Y,Z,T).
	includes(X,Y,Z,[Y|T]):-includes(X,0,Z,T).
	includes(X,Y,Z,[Z|T]):-includes(X,Y,0,T).
	includes(X,Y,Z,[_|T]):-includes(X,Y,Z,T).
goal
	includes(1,2,3,[8,9,2,4,8,1,9,6,3,7,11]).

%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат insert1(X,N,L1,L2), який виконує вставку елемента X  на N-те місце в заданому списку (L) .

domains
	integerl=integer*
predicates
	insert1(integer,integer,integerl,integerl)
clauses
	insert1(_,_,[],[]).
	insert1(X,0,T,[X|T]) :- !.
	insert1(X,N,[H|T],[H|Q]) :- N1=N-1, insert1(X,N1,T,Q).
goal
 	insert1(4,2,[1,1,1,1,1,1,1,1,1],X),write(X).

%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат insert2(X,N,L1,L2), який виконує вставку елемента X  в заданий список перед заданим елементом Y цього списку.
domains
	int=integer
	L=int*
  
predicates
	insert2(int,int,L,L)
clauses
	insert2(X,X,L,[X|L]).
	Insert2(X,Y,[Y|T],R):-insert2(X,X,[Y|T],R).
	Insert2(X,Y,[H|T],[H|R]):-insert2(X,Y,T,R).
goal
	List=[1,2,3,4,5],write(List),nl,insert2(4,3,List,X),write(X).

%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат insert3(X,N,L1,L2), який виконує вставку елемента X в заданий список після заданого елемента Y цього списку.

domains
	int=integer
	intl=int*
  
predicates
	insert3(int,int,intl,intl)
clauses
	insert3(X,X,L,[X|L]).
	Insert3(X,Y,[Y|T],[Y|R]):-insert4(X,X,T,R).
	Insert3(X,Y,[H|T],[H|R]):-insert4(X,Y,T,R).
goal
	insert3(4,3,[1,2,3,5,6],X),write(X).


%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат insert4(X,N,L1,L2), який виконує вставку елемента X  в заданий список замість заданого елемента Y цього списку .

domains
	int=integer
	intl=int*
  
predicates
	ins_in_pos(intl,int,int,intl)
	insert4(int,int,intl,intl)
clauses
	insert4(X,X,L,L).
	insert4(X,Y,[Y|T],[X|R]):-insert4(X,X,T,R).
	insert4(X,Y,[H|T],[H|R]):-insert4(X,Y,T,R).
goal
	insert4(4,3,[5,1,3,7,6],X),write(X)
	
%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат member (X,L), який визначить, чи є елемент, заданий своїм значенням, елементом заданого списку.

domains
	l=integer*
predicates
	member(integer,l)
clauses
	member(X, [X|_]).
	member(X, [_|T]):-member(X,T).
goal
 	member(7,[1,2,3,4,5,6,7,8]),write("Element nalezhut spusku").

%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат union (L1,L2,L3), який отримує список – об’єднання двох заданих невпорядкованих списків. 

% Без повторів:
domains
ilist=integer*
 
predicates
member(integer,ilist).
p(ilist,ilist,ilist).
 
clauses
member(H,[H|_]).
member(X,[_|Tail]):-member(X,Tail).
 
p([],B,B).
p([H|Tail],B,NewTail):-p(Tail,B,NewTail),member(H,NewTail),!.
p([H|Tail],B,[H|NewTail]):-p(Tail,B,NewTail).
 
goal
p([1,2,3,4,5],[8,7,6,5,4,3],A),write(A).

% З повторами

domains
ilist=integer*
 
predicates

union(ilist,ilist,ilist).
 
clauses
	union([], List2, List2).
	union([Head|Tail], List2, [Head|TailResult]):-
   	union(Tail, List2, TailResult).
 
goal
union([1,2,3,4,5],[8,7,6,5,4,3],A),write(A).

%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат count(L,Q), який визначає кількість елементів у заданому списку. 

domains
ilist=integer*
 
predicates
	count(ilist,integer)

clauses
	count([], 0):-!.
 	count([_|Tail], Length):-count(Tail, TailLength),Length = TailLength + 1.
 
goal
	count([1,2,3,4,5],A),write(A).


%------------------------------------------------------------------------------

% Задача. Мовою Пролог опишіть предикат cross1 (L1,L2,L3), який отримує список – перетин двох заданих невпорядкованих списків.


domains
ilist=integer*
 
predicates
	except(ilist,ilist,ilist)
	cross(ilist,ilist,ilist)
	member(integer,ilist)
	del(integer,ilist,ilist)
clauses
	del(X,[X|L],L).
    	del(X,[Y|L],[Y|L1]) :- del(X,L,L1). 

	member(X,[X|_]).
    	member(X,[_|L]) :- member(X,L).

	except([],L,L).
    	except([X|L1],L2,Result) :- 
                      member(X,L2),!, 
                      del(X,L2,L),
                      except(L1,L,Result);
                      except(L1,L2,Result).
	cross(L1,L2,Resalt) :- 
                    except(L1,L2,L3),  
                    except(L3,L2,Resalt). 

 
goal
	cross([1,2,3,4,5],[1,9,6,4,5],Result),write("cross = "),write(Result).
	
%------------------------------------------------------------------------------

% Задача. Мовою Пролог напишіть програму «Електронна сваха» для шлюбного агенства. Є дані про кількох чоловіків і жінок. Про кожного з них відомі ім’я, стать, вік, зріст, вага і його чи її вимоги до майбутнього подружжя у вигляді діапазонів віку, зросту і ваги. Програма повинна створити з клієнтів пари з урахуванням вимог обох сторін. 

predicates
	people(string,string,integer,integer,integer, integer,integer, integer,integer, integer,integer)
	%імя, стать,вік, зріст, вага, вік від-до, зріст від-до, вага від-до.
clauses
	people("Katia","W",30,160,50,25,35,170,180,70,85).
	people("Nika","W",29,155,49,28,30,175,186,75,100).
	people("Kira","W",20,170,60,18,24,172,185,60,85).

	people("Misha","M",21,180,75,18,25,160,170,50,60).
	people("VitYa","M",40,170,100,35,45,150,160,60,80).
	people("Grisha","M",30,185,60,28,35,150,160,50,60).
goal
	people(Name1,"W",Year1,Height1,Masa1,Year_1w,Year_2w,Height_1w,Height_2w,Masa_1w,Masa_2w),
	people(Name2,"M",Year2,Height2,Masa2,Year_1m,Year_2m,Height_1m,Height_2m,Masa_1m,Masa_2m),

	Year1>=Year_1m, Year1<=Year_2m,
	Height1>=Height_1m, Height1<=Height_2m,
	Masa1>=Masa_1m, Masa1<=Masa_2m,

	Year2>=Year_1w, Year2<=Year_2w,
	Height2>=Height_1w, Height2<=Height_2w,
	Masa2>=Masa_1w, Masa2<=Masa_2w,
	write(Name1," ",Name2),nl,fail.
	
%------------------------------------------------------------------------------

Предметна область «Служба знайомств».
Описати об’єкти предметної області, що описують дані клієнтів
і їх побажання щодо можливої пари.
Описати запити:
- знайти записи, інформація в яких неправильна – наприклад,
значення одного з полів «від» більше, ніж відповідного поля «до»;
- отримати список тих, хто відповідає запитам заданого клієнта;
- отримати список тих, чиїм запитам відповідає заданий клієнт;
- отримати список тих, хто може створити пару з заданим клієнтом
(кожна з сторін має характеристики, що відповідають запитам
партнера).

predicates
	korustuvatch(symbol,symbol,symbol,symbol,integer,integer)%ім’я,стать, запит, х-ка, від, до

	Match_list_start(symbol)
	Request_list_start(symbol)
	List_request_start(symbol)
	%ім'я
	Incorrectrange %невірне значення від до

	Request_list(symbol,symbol) % хто відповідає запитам заданого клієнта
	%ім'я, стать
	List_request(symbol,symbol) % чиїм запитам відповідає заданий клієнт
	%ім'я, стать
	Match_list(symbol,symbol) % хто може створити пару з заданим клієнтом
	%ім'я, стать
clauses
	korustuvatch(igor,m,smart,rich,30,25).
	korustuvatch(max,m,rich,smart,25,30).
	korustuvatch(ablaham,m,smart,rich,20,30).

	korustuvatch(nelly,w,rich,rich,30,25).
	korustuvatch(olha,w,smart,smart,25,30).
	korustuvatch(snizhana,w,rich,smart,22,26).

Incorrectrange:-korustuvatch(T,_,_,_,X,Y),X>Y,write("Incorrect range ",T),nl,fail.


Request_list_start(X):-korustuvatch(X,Y,_,_,_,_),Request_list(X,Y).
Request_list(X,m):-korustuvatch(X,m,Y,_,_,_),korustuvatch(Z,w,_,Y,_,_),write(Z," "),nl,fail.
Request_list(X,w):-korustuvatch(X,w,Y,_,_,_),korustuvatch(Z,m,_,Y,_,_),write(Z," "),nl,fail.


List_request_start(X):-korustuvatch(X,Y,_,_,_,_),List_request(X,Y).
List_request(X,m):-korustuvatch(X,m,_,Y,_,_),korustuvatch(Z,w,Y,_,_,_),write(Z," "),nl,fail.
List_request(X,w):-korustuvatch(X,w,_,Y,_,_),korustuvatch(Z,m,Y,_,_,_),write(Z," "),nl,fail.

Match_list_start(X):-korustuvatch(X,Y,_,_,_,_),Match_list(X,Y).
Match_list(X,m):-korustuvatch(X,m,Y,T,_,_),korustuvatch(Z,w,T,Y,_,_),write(Z," "),nl,fail.
Match_list(X,w):-korustuvatch(X,w,Y,T,_,_),korustuvatch(Z,m,T,Y,_,_),write(Z," "),nl,fail.

%------------------------------------------------------------------------------

% Задача. Напишіть декларативну програму, яка зберігає дані про
% коефіцієнти багаточлена у вигляді списку, і, звертаючись до нього,
% може підрахувати чисельне значення багаточлена при заданому
% значенні змінної.

% Многочлен виду a_1 x+a_2 x+a_3 x+⋯+a_n x

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
	
% Або

domains
  	list = integer*
predicates
  	polynom(list,integer,integer,integer)
%багаточлен(список коефіцієнтів, перемінна для зберігання проміжних результатів, значення X, результат обчислення)
clauses  
	polynom([],X,_,X):-!.
 	polynom([H|T],Z,X,Y):- K=H*X,N=K+Z,polynom(T,N,X,Y). 
goal
	polynom([8,11,4,1,0,8,4],0,5,X),write("Results of calculations: ",X).

%------------------------------------------------------------------------------

% Задача. Напишіть декларативну програму, яка виведе три найменших числа з заданого списку.

domains
 	list = integer*
predicates
  	delete(list, integer, list)
  	min_list(list, integer)
clauses 
 	delete([], _, []):-!.
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
	List = [5,1,4,8,3,9,2,14],
	min_list(List,X),delete(List,X,List_1),
	min_list(List_1,X1),delete(List_1,X1,List_2),
	min_list(List_2,X2),delete(List_2,X2,List_3),
	write("Min elem is: ",X," ",X1," ",X2).

% Задача. Напишіть логічну програму підрахунку факторіалу з використанням відсікання

predicates
    fact(integer,integer)
  %число для якого потрібно знайти факторіал, результат факторіал
    f(integer,integer,integer,integer)

clauses
  fact(N,F):-f(N,F,1,1). %факторіал 1 = 1
  f(N,F,N,F):-!. % якщо  дійшли дл вказаного числа то припиняємо підрахунок факторіалу
  f(N,F,N1,F1):-N11=N1+1, %зібльшуємо чсло на 1
                F11=F1*N11, %факторіал числа дорівнює добутку 
                f(N,F,N11,F11).
Goal
  fact(3,X), write(X).

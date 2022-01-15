//1.	Виконайте зашифрування тексту за допомогою шифру Гронсфельда. Ключ із 5 чисел вибрати самостійно.
//Текст для шифрування: ТЕСКТ – УПОРЯДКОВАНИЙ НАБІР З ЕЛЕМЕНТІВ АЛФАВІТУ

#include <Windows.h>
#include <iostream>
using namespace std;

int get_numb() {
    static int i=-1;
    if (i < 3) return ++i;
    else return i = 0;
}
int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    string alph = { 'А','Б','В','Г','Ґ','Д','Е','Є','Ж', 'З','И','І','Ї','Й','К','Л','М', 'Н','О','П','Р','С','Т','У','Ф', 'Х','Ц','Ч','Ш','Щ','Ь','Ю','Я',' ','-' };
    string code="ТЕСКТ – УПОРЯДКОВАНИЙ НАБІР З ЕЛЕМЕНТІВ АЛФАВІТУ";
    int numb[] = { 2,5,1,7,9 };

    for (int i = 0; i < code.size(); i++) {
        int a = alph.find(code[i]) + numb[get_numb()];
        if (a > alph.size())a = a - alph.size();
        cout<<alph[a];
    }
    return 0;
}

//2.	Виконайте зашифрування тексту за допомогою шифру Віженера.

#include <Windows.h>
#include <iostream>
using namespace std;

int get_numb(int n) {
    static int i=-1;
    if (i < n) return ++i;
    else return i = 0;
}
int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    string alph = { 'А','Б','В','Г','Д','Е','Ё','Ж', 'З','И','І','Й','К','Л','М', 'Н','О','П','Р','С','Т','У','Ф', 'Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я'};
    string code="МОДЕМНЫЙ ПУЛ ТЕЛЕФОН ПО КОТОРОМУ МОЖНО ПОЗВОНИТЬ ПРОВАЙДЕРУ И УСТАНОВИТЬ СОЕДИНЕНИЕ ВАШЕГО МОДЕМА С ПРОВАЙДЕРОМ";
    string key = "КНИГА";
    for (int i = 0; i < code.size(); i++) {
        if (code[i] == ' ')continue;
        cout << alph[((alph.find(code[i]) + alph.find(key[get_numb(key.size())])) % alph.size())];
    }
    return 0;
}

//3.	Виконайте розшифрування тексту за допомогою шифру Віженера.

#include <Windows.h>
#include <iostream>
using namespace std;

int get_numb(int n) {
    static int i=-1;
    if (i < n) return ++i;
    else return i = 0;
}
int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251);
    string alph = { 'А','Б','В','Г','Д','Е','Ё','Ж', 'З','И','І','Й','К','Л','М', 'Н','О','П','Р','С','Т','У','Ф', 'Х','Ц','Ч','Ш','Щ','Ъ','Ы','Ь','Э','Ю','Я'};
    string code="ХУЖППФЬЭИЙИГШФЮАЫДВЙЧНСЮВССЪЙСИЪСОТБПШЪБЙОШОГЧФУЬЛААШУТЙЫЭНРССЕМУЦИМЬЙЫЫГТКЩМОУФЬЩФЛАМЩАЬЮВСЮЛ";
    string key = "ИНФОРМАТИКА";
    for (int i = 0; i < code.size(); i++) {
        int a = alph.find(code[i]) - alph.find(key[get_numb(key.size())]);
        if (a < 0) { a = alph.size()+a; }
        cout << alph[a];
    }
    return 0;
}

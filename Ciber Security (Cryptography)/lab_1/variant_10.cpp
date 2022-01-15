//1.	Виконайте зашифрування тексту за допомогою афінної підстановки Цезаря

#include <iostream>
#include <Windows.h>
using namespace std;
int main()
{
	SetConsoleOutputCP(1251);
	char b[] = "ANDPETERTHENUMBSKULLWASLEFTSTANDINGONTHETABLEWITHCHALKTRICKLINGOFFHISUGLYMUGANDGRASSFLYINGOUTOFHISPOCKET";
	char* a = b;
	cout << "Текст до шифрування:" << b << endl<<"Текст після шифрування:";
	while (*a != '\0') {
		int numb = ((((int)*a - 65) * 5 + 4)%26) + 65;
		cout << (char)numb;
		a++;
	}
return 0;
}  
//2.	Виконайте розшифрування тексту за допомогою шифру Цезаря із ключовим словом.

#include <iostream>
#include <string>
#include <Windows.h>
using namespace std;
int main()
{
	SetConsoleOutputCP(1251); // установка кодовой страницы win-cp 1251 в поток вывода
	char cipher[] = "OATIVDVEDYVAFMPCUFBBHOCBVWDCDOATZAXRADYVDOPBVHZDYQYOBUDEZQUBZAXRWWYZCFXBKMFXOATXEOCCWBKZAXRFDRWYZCIRQUVD";
	
	string key = "SUBMARINE";
	int numb_key=9;
	char table[26];
	// формуємо 1 стрічку таблиці
	int j = numb_key;
	for (int i = 0; i < 26; i++) {
		table[i] = 65+j++;
		if (table[i] == 'Z') j = 0; //якщо дійшли до букви 'Z', то далі друкуємо букви починаючи з 'А'
		cout << table[i];//Виводимо таблицю
	}
	cout << endl;

	//формуємо 2 стрічку таблиці
	for (int i = 0; i < 26; i++) {
		if (!(key.find((char)(i+65))<26)) {//якщо в стічці немає букви алафавіту то додаємо її
			/*(char)(i+65) - таким чином здобуваємо букви, так як починаючи з
			65 символу таблиці ASCII йдуть великі букви латинського алфавіту*/
			key+=((char)(i + 65));
		}
	}
	cout << key<<endl;

	cout << "Шифрований текст:" << cipher << endl << "Розшифрований текст:";
	//формуємо розшифрований текст
	for (char* cipher1 = cipher; *cipher1 != '\0'; cipher1++) {
		for (int i = 0; i < 26; i++) {
			if (*cipher1 == key[i]) { cout << table[i]; break; }
		}
	}
	return 0;
}  


//1.	Виконайте зашифрування тексту за допомогою таблиці Трисемуса. У якості таблиці для шифрування візьміть таблицю 4 x 8, ключове слово – своє прізвище.
//Текст для шифрування:
// НЕХАЙ_В_ТВОЇМ_СЕРЦІ_ЛЮБОВІ_НЕ_ЗГАСНЕ_СВЯЩЕНИЙ_ВОГОНЬ,_ЯК_ПЕРШЕ_ПРОМОВЛЕНЕ_СЛОВО_НА_МОВІ_НАРОДУ_СВОГО.

#include <Windows.h>
#include <iostream>
using namespace std;

int main()
{
    SetConsoleCP(1251);
    SetConsoleOutputCP(1251); 
    char alh[4][8] = { 
        {'Х','Л','И','Щ','Б','О','Р','А'},
        {'В','Г','Д','Е','Є','Ж','З','І'},
        {'Ї','Й','К','М','Н','П','С','Т'},
        {'У','Ф','Ц','Ш','Ч','Ь','Ю','Я'}
    };

    char code[] = "НЕХАЙ_В_ТВОЇМ_СЕРЦІ_ЛЮБОВІ_НЕ_ЗГАСНЕ_СВЯЩЕНИЙ_ВОГОНЬ,_ЯК_ПЕРШЕ_ПРОМОВЛЕНЕ_СЛОВО_НА_МОВІ_НАРОДУ_СВОГО";
    
    for (char* code_v = code; *code_v != '\0'; code_v++) {
        if (*code_v == '_') { cout << '_'; continue; }
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 8; j++) {
                if (alh[i][j] == *code_v) {
                    if (i != 3) cout << alh[i + 1][j];
                    else cout << alh[0][j];
                }
            }
        }
    }
    return 0;
}

 
//2.	Виконайте зашифрування тексту за допомогою біграмного шифру Плейфейра. 

#include <Windows.h>
#include <iostream>
using namespace std;

int main()
{
    SetConsoleOutputCP(1251); 
    char alh[6][6] = { 
        {'Н','А','Л','С','И','Т'},
        {'В','Ґ','Ф','Д','Я','.'},
        {'І','К','У','Ш','_','П'},
        {'Ч','Й','Щ','Ї','Ц','Ж'},
        {'Е','Р',',','О','М','Ь'},
        {'Ю','Б','Х','Є','З','Г'},
    };

    char code[] = "НЕХАЙ_В_ТВОЇМ_СЕРЦІ_ЛЮБОВІ_НЕ_ЗГАСНЕ_СВЯЩЕНИЙ_ВОГОНЬ,_ЯК_ПЕРШЕ_ПРОМОВЛЕНЕ_СЛОВО_НА_МОВІ_НАРОДУ_СВОГО.";

    char* first= code;
    char* second = code;
    second++;
    int t = 0;
    int index[2][2];
    while (t<sizeof(code)/2 ) {
        for (int i = 0; i < 6; i++) {
            for (int j = 0; j < 6; j++) {
                if (*first == alh[i][j]) {
                    index[0][0] = i;
                    index[0][1] = j;
                }
                if (*second == alh[i][j]) {
                    index[1][0] = i;
                    index[1][1] = j;
                }
            }
        }
        if (index[0][0] != index[1][0] && index[0][1] != index[1][1]) {//різні рядки і стовпчики
            cout << alh[index[1][0]][index[0][1]] << alh[index[0][0]][index[1][1]];
            
        }
        else if (index[1][1] == index[0][1]) {//однакові стовпчики
            if (index[0][0] != 5) { cout << alh[index[0][0] + 1][index[0][1]]; }
            else cout << alh[0][index[0][1]];
            if (index[1][0] != 5) { cout << alh[index[1][0] + 1][index[1][1]]; }
            else cout << alh[0][index[1][1]];
            
        }
        else if (index[1][0] == index[0][0]) {
            if (index[0][1] != 5) { cout << alh[index[0][0]][index[0][1] + 1]; }
            else cout << alh[index[0][0]][0];
            if (index[1][1] != 5) { cout << alh[index[1][0]][index[1][1] + 1]; }
            else cout << alh[index[1][0]][0];
            
        }
        cout << " ";
        first++;
        first++;
        second ++;
        second++;
        t++;
    }
    return 0;
}

 
//3.	Виконайте зашифрування тексту за допомогою крисптоситеми Хілла. За матрицю перетворення  вибрати одну з нижче наведених матриць  ,  , обґрунтувати вибір.
 
#include <Windows.h>
#include <iostream>
#include <vector>
using namespace std;

int main()
{
    string code = "DEPARTMENT";
    vector<int> exit_code;
    vector<int> finall;
    string alph;
    int matrix[2][2] = {
        {6,5},
        {3,3}
    };
    
    for (int i = 0; i < 26; i++)alph += (char)65 + i;
    for (size_t i = 0; i < code.size(); i++){
        exit_code.push_back(alph.find(code[i]));
    }
    for (size_t i = 0; i < exit_code.size(); i += 2) {
        cout<< alph[(matrix[0][0] * exit_code[i] + matrix[0][1] * exit_code[i + 1])%26];
        cout << alph[(matrix[1][0] * exit_code[i] + matrix[1][1] * exit_code[i + 1])%26]<<" ";
    }
    return 0;
}

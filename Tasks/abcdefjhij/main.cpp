#include <Windows.h>
#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

bool test_2(vector<int> &myvector)
{
    if (myvector.at(0) == 0 or
        myvector.at(0) == 2 or
        myvector.at(0) == 4 or
        myvector.at(0) == 6 or
        myvector.at(0) == 8)
        return true;
    else
        return false;
}
bool test_3(vector<int> &myvector)
{
    int sum = 0;
    for (auto itr = myvector.begin(); itr != myvector.end(); itr++) {
        sum += *itr;
    }
    if (sum % 3 == 0) {
        return 1;
    }
    else
        return 0;
}
bool test_4(vector<int> &myvector)
{
    if (myvector.at(0) == 0 and myvector.at(1) == 0) {
        return 1;
    }
    int number = myvector.at(1) * 10 + myvector.at(0);
    if (number % 4 == 0) {
        return 1;
    }
    else
        return 0;
}
bool test_5(vector<int> &myvector)
{
    if (myvector.at(0) == 0 or
        myvector.at(0) == 5 )
        return true;
    else
        return false;
}
bool test_6(vector<int> &myvector)
{
    if (test_2(myvector) and test_3(myvector))
    {
        return 1;
    }
    else
        return 0;
}
bool test_7(vector<int> &myvector)
{
    int first = myvector[2] * 100 + myvector[1] * 10 + myvector[0];
    int second = myvector[5] * 100 + myvector[4] * 10 + myvector[3];
    int third = myvector[8] * 100 + myvector[7] * 10 + myvector[6];
    int fourth = myvector[9];
    int dsum = (second + fourth) - (first + third);
    if (dsum % 7 == 0) {
        return 1;
    }
    else
        return 0;
}

bool test_8(vector<int> &myvector)
{
    if (myvector.at(0) == 0 and myvector.at(1) == 0 and myvector.at(2) == 0 ) {
        return 1;
    }
    int number = myvector.at(2) * 100 + myvector.at(1) * 10 + myvector.at(0);
    if (number % 8 == 0) {
        return 1;
    }
    else
        return 0;
}
bool test_9(vector<int> &myvector)
{
    int sum = 0;
    for (auto itr = myvector.begin(); itr != myvector.end(); itr++) {
        sum += *itr;
    }
    if (sum % 9 == 0) {
        return 1;
    }
    else
        return 0;
}
bool test_10(vector<int> &myvector)
{
    if (myvector[0] == 0)
    {
        return 1;
    }
    else
        return 0;
}
void vector_inc(vector<int>* myvector)
{
    (*myvector)[0] += 1;
    for (auto itr = (*myvector).begin(); itr != (*myvector).end(); itr++)
    {
        if (*itr == 10)
        {
            *itr = 0;
            *(itr + 1) += 1;
        }
    }
}

int main()
{
    std::vector<int> myvector;
    myvector.push_back(0);
    myvector.push_back(1);
    myvector.push_back(2);
    myvector.push_back(3);
    myvector.push_back(4);
    myvector.push_back(5);
    myvector.push_back(6);
    myvector.push_back(7);
    myvector.push_back(8);
    myvector.push_back(9);
    
  
    while ((next_permutation(myvector.begin(), myvector.end())))
    {
        if (test_2(myvector) and
            test_3(myvector) and
            test_4(myvector) and
            test_5(myvector) and
            //test_6(myvector) and немає потреби, так як є умова на 2 і на 3
            test_7(myvector) and
            test_8(myvector) and
            test_9(myvector) and
            test_10(myvector)
            )
        {

            for (auto itr = myvector.rbegin(); itr != myvector.rend(); itr++)
            {
                cout << *itr;
            }
            cout << endl;
        }
    }
    
    return 0;
}


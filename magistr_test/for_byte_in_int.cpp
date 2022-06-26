#include <iostream>
using namespace std;

class for_byte_in_int
{

public:
	for_byte_in_int()
	{
		numder = 0;
	}
	void set(char a,char b)
	{
		if (b < 4)
		{
			int temp = (((numder >> (8 * b)) & a) | a) << (8 * b);
			numder |= temp;
		}
	}
	unsigned char get(char b)
	{
		if (b < 4)
		{
			int temp;
			temp = numder & (255 << (8 * b));
			temp >>= (8 * b);
			return temp;
		}
		else
		{
			return 0;
		}
	}
	void print_bit(int temp)
	{
		for (int i = 31; i >= 0; --i)
			std::cout << ((temp >> i) & 1); 
		cout << endl;
	}
private:
	int numder;
};

int main()
{
	for_byte_in_int A1;
	A1.set(2, 0);
	A1.set(10, 2);
	A1.set(14, 1);
	A1.set(128, 3);
	cout << (int)A1.get(0) << endl;
	cout << (int)A1.get(1) << endl;
	cout << (int)A1.get(2) << endl;
	cout << (int)A1.get(3) << endl;
	return 0;
}

#include <iostream>
#include <string>
std::string intToRoman(int num){
	std::string out = "";
	struct value {
		std::string name;
		int val;
	};
	value vals[13] = {
		{"I", 1 },
		{"IV", 4 },
		{"V", 5 },
		{"IX", 9 },
		{"X", 10},
		{"XL", 40},
		{"L", 50},
		{"XC", 90},
		{"C", 100},
		{"CD", 400},
		{"D", 500 },
		{"CM", 900},
		{"M", 1000 },
	};
	int numl = num;
	int i = 12; 
	while(i >= 0){
		while(numl >= vals[i].val){

			numl -= vals[i].val;
			out.append(vals[i].name);
		}
		i--;
	}
	return out;
}
int main(){
	std::cout<<intToRoman(1994);
	return 0;

}

// SOLVED!!
// https://leetcode.com/problems/integer-to-roman/submissions/1693841345

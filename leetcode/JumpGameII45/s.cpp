#include <iostream>
#include <ostream>
#include <vector>
int jump(std::vector<int>& nums) {
	int jumps = 1000000;
	for(int i = 0; i < nums.size(); i++){
		int j = i;
		while(j + nums.at(j) < nums.size()){
			if(j == 0){break;}
			j = nums.at(j) + j;
			if(jumps >= nums.at(j)){
				jumps = nums.at(j);
			}

		}
	}
	return jumps;
}

int main() {
    std::vector<int> nums = {2,3,0,1,4};
    std::cout<<jump(nums); 
    return 0;

}


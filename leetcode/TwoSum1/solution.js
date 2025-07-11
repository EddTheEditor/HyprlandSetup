/**
 * @param {number[]} nums
 * @param {number} target
 * @return {number[]}
 */
var twoSum = function(nums, target) {
	for(let i = 0; i <= nums.length; i++){
		let tn = target - nums[i];
			let index = nums.indexOf(tn); 
			if(index != i){
				return [i, index];
			}
	}    
	return 0;
};



console.log(twoSum([2,7,11,15], 9));
console.log(twoSum([3,2,4], 6));
console.log(twoSum([3,3], 6));

// SOLVED !!
// https://leetcode.com/problems/two-sum/submissions/1693683072

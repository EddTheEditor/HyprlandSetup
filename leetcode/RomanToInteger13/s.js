/**
 * @param {string} s
 * @return {number}
 */
var romanToInt = function(s) {
	
	let output = 0;
	for(let i = 0; i <= s.length; i++){
		if(s[i] == "I"){

			if(s[i+1] == "V" || s[i+1] == "X"){output += -1}
			else{output += 1}

		}
		if(s[i] == "X"){
			if(s[i+1] == "L"|| s[i+1] == "C"){output += -10}
			else{output += 10}
		}
		if(s[i] == "C" ){
			if(s[i+1] == "D" || s[i+1] == "M"){output += -100}
			else{output += 100}
		}
		if(s[i] == "M"){output += 1000}
		if(s[i] == "L"){output += 50}
		if(s[i] == "V"){output += 5}
		if(s[i] == "D"){output += 500}
	}
	return output;

};

console.log(romanToInt("III"));
console.log(romanToInt("LVIII"));
console.log(romanToInt("MCMXCIV"));

// SOLVED!!
// link : https://leetcode.com/problems/roman-to-integer/submissions/1693691198




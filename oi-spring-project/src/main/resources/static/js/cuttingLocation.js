
		
		
let pLocations = document.querySelectorAll('.product--location');
											
		let check1 = 0;
		let check2 = 0;
		let j=0
			
		for(let pLocation of pLocations){
			let str = pLocation.innerHTML.trim()										
			for(let i = 0; i < str.length; i++) {
	
				// charAt 함수로 문자열을 한글자씩 취득
					if(str.charAt(i)==' ') {
					if(check1 == 0) {
						check1 = i+1;
					} else if(check1 != 0 && check2 == 0) {
						check2 = i;
					}
				}			
			}
		let trimmedLocation = str.substring(check1, check2);
		pLocations[j].innerHTML=trimmedLocation;
		check1=0;
		check2=0;
		j++;
		
		}
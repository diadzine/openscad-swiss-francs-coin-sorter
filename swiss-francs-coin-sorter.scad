
thickness = 3;

// Coins dimensions array
coins_diameter = [17.15, 19.15, 21.05, 18.20, 23.20, 27.40, 31.45];

function array_sum(v, i, s=0) = (i==s ? v[i] : v[i] + array_sum(v,i-1,s));


module ruler() {
	length = array_sum(coins_diameter, len(coins_diameter)-1);
	echo("length =", length);
}

ruler();

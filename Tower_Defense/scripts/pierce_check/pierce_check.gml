function pierce_check() {
	been_hit = false;

	for (var i = 0, iLen = ignore_len; i < iLen; i++) {
		if (ignore[i] == other.id){
			been_hit = true;
			break;
		}
	}

	if(!been_hit){
		ignore[ignore_len+1] = other.id
		ignore_len++;
		if(!can_pierce or have_pierced > pierce_max){
			instance_destroy();
			other.hp -= damage;
		}else if(have_pierced <= pierce_max){
			have_pierced++;
			other.hp -= damage;
		}
	}


}

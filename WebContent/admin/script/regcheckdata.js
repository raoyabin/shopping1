function checkdata() {
	var ssn=form.username.value.toLowerCase();
	if (!checkUserName(ssn)) return false;  //�û������
	if( strlen(form.pwd.value)<6 || strlen(form.pwd.value)>16 ) {
		alert("\password must more than 6 letters and less than 16 letters")
		form.pwd.focus()
		return false;
	}
	if( strlen2(form.pwd.value) ) {
		alert("\password should only contains letters and numbers")
		form.pwd.focus()
		return false;
	}
	if( form.pwd.value == form.username.value ) {
		alert("\password and username can't be the same ")
		form.pwd.focus()
		return false;
	}
	if( form.pwd2.value =="" ) {
		alert("\please reenter the password")
		form.pwd2.focus()
		return false;
	}
	if( form.pwd2.value != form.pwd.value ) {
		alert("\the password are not same")
		form.pwd.focus()
		return false;
	}
	//检查电话
	
	if( form.phone.value=="" ) {
		alert("\please enter your phone numebr");
		form.phone.focus();
		return false;
	}
	
	//检查地址
	if( form.addr.value == "" ) {
		alert("\please enter your address");
		form.addr.focus();
		return false;
	}
	
	/*
	if( form.question.value == "") {
		alert("\��������ʾ����,������������ʱ�ɸ��ݸ�������ʾ���룡")
		form.question.focus()
		return false;
	}
	if( strlen(form.answer.value)<6) {
		alert("\��������������𰸣����Ȳ�����6λ��")
		form.answer.focus()
		return false;
	}
	if( form.question.value == form.answer.value ) {
		alert("\������ʾ����ʹ𰸲�����ͬ��")
		form.answer.focus()
		return false;
	}
	if( strlen(form.pingma.value)<6 || strlen(form.pingma.value)>16 ) {
		alert("\��ȷ�İ�ȫ�볤��Ϊ6-16λ��������Ӣ�ġ����֡������ַ���")
		form.pingma.focus()
		return false;
	}
	if( strlen2(form.pingma.value) ) {
		alert("\���İ�ȫ���а����˷Ƿ��ַ���������Ӣ�ġ����֡������ַ���")
		form.pingma.focus()
		return false;
	}
	if( form.pingma.value == form.username.value ) {
		alert("\�û����Ͱ�ȫ�벻����ͬ��")
		form.pingma.focus()
		return false;
	}
	if( form.pingma2.value =="" ) {
		alert("\�����밲ȫ��ȷ�ϣ�")
		form.pingma2.focus()
		return false;
	}
	if( form.pingma.value != form.pingma2.value ) {
		alert("\���ΰ�ȫ�����벻һ�£�")
		form.pingma.focus()
		return false;
	}*/
	return true;
}

function checkUserName(ssn){
	if( ssn.length<3 || ssn.length>18 ) {
		alert("\please enter correct username more than 3 letters")
		form.username.focus()
		return false;
	}
	if (isWhiteWpace(ssn)){
		alert("\no space should be contained in your username")
		form.username.focus()
		return false;
	}
	if (!isSsnString(ssn)){
		alert("\    Sorry, this username has already been taken")
		form.username.focus()
		return false;
	}
	return true;
}

function strlen(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) len+=2; else len++;
	}
	return len;
}

function strlen2(str){
	var len;
	var i;
	len = 0;
	for (i=0;i<str.length;i++){
		if (str.charCodeAt(i)>255) return true;
	}
	return false;
}

function isWhiteWpace (s)
{
	var whitespace = " \t\n\r";
	var i;
	for (i = 0; i < s.length; i++){   
		var c = s.charAt(i);
		if (whitespace.indexOf(c) >= 0) {
		  	return true;
		}
	}
	return false;
}

function isSsnString (ssn)
{
	var re=/^[0-9a-z][\w-.]*[0-9a-z]$/i;
	if(re.test(ssn))
		return true;
	else
		return false;
}

function checkssn(gotoURL) {
   var ssn=form.username.value.toLowerCase();
   if (checkUserName(ssn)){
	   var open_url = gotoURL + "?username=" + ssn;
	   window.open(open_url,'','status=0,directories=0,resizable=0,toolbar=0,location=0,scrollbars=0,width=322,height=200');
	}
}
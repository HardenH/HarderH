	//------公共变量-----
	var chars1 = ['0','1','2','3','4','5','6','7','8','9'];
	var chars2 = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z'];
	var count=1;
	var count2=1;
	var geshi="";
	var mark={
		v1:{c:"*",n:0},
		v2:{c:"$",n:0},
		v3:{c:"?",n:0}
		};
 	var y,m,d,Y,M,D,mydate,ArrDate;
	//------函数-----
	$("group1").onkeypress=function(e){
		if (e.keyCode==13){
			init();
			e.preventDefault();
			e.stopPropagation();
		}
	};
	$("group2").onkeypress=function(e){
		if (e.keyCode==13){
			init2();
			e.preventDefault();
			e.stopPropagation();
		}
	};
	$('btn1').onclick=function(){
		init();
	}
	$('btn2').onclick=function(){
		init2();			
	}
	$('gslist').onchange=function(e){
		var vr=	this.options[this.selectedIndex].value;
		$('geshi').value=vr;
	}
	  
	function $(s){
		return document.getElementById(s);
	}
	function init(){
		count=parseInt($('count').value);
		$('result').value="";
		if (count>1001){$('result').value="数值过大";return false;}
		if (parseInt( $('txt').value)>1001){$('result').value="数值过大";return false;}
		 for(var i=0;i<count;i++){
		 	 begin();
		 }
	}
	function begin(){
	 	var num=parseInt( $('txt').value);
		var str="";
		var v=GetChecked(document.myform.c);
		var v2=GetChecked(document.myform.t);
		var Data=v2.value==1?chars1:chars2;
		var isLowCase=v.value==1?true:false;
		//console.log(count);
		for(var i=0;i<num;i++){
			str+=Data[GetRandomNum(0,Data.length-1)];
		}
		if (isLowCase)str=str.toLowerCase();
		$('result').value +=""+str+"\n";
		//console.log(str);
		if (count<=1)return false;
		else {--count;begin();}
	
	}
	function GetRandomNum(Min,Max)
	{  
		var Range = Max - Min;  
		var Rand = Math.random();  
		return(Min + Math.round(Rand * Range));  
	}   
	function GetChecked(objs){
		for(var i=0;i<objs.length;i++){
			if (objs[i].checked){
			return 	objs[i];
			}
		}
	}
	
	/*第二组函数代码*/
	function init2(){
		 geshi=$('geshi').value;
		 count2=$('count2').value;		
		 mydate=new Date()
		 Y=mydate.getFullYear();
		 D=mydate.getDate()<10?"0"+mydate.getDate():mydate.getDate();
		 M=mydate.getMonth()<9?"0"+(mydate.getMonth()+1):mydate.getMonth()+1;
		 y=String(mydate.getFullYear()).substring(2,4);
		 d=mydate.getDate();
		 m=mydate.getMonth()+1;
		 ArrDate={'y':y,'m':m,'d':d,'Y':Y,'M':M,'D':D};
		 $('result2').value="";
		  if (count2>10011){$('result2').value="数值过大";return false;}
		  if (geshi.length>100){$('result2').value="数值过多";return false;}
		  for(var i=0;i<count2;i++){
		 	 begin2();
		 }
	}
	function begin2(){
		var Arr=[],tmp,str;
		str=geshi;
		for(var ch in mark){			
			 var chr=mark[ch].c;	
			 //遍历统计各个通配符数量
			  mark[ch].n=0;
			 for(var i=0;i<str.length;i++){
			 	if (str[i]==chr){
					 mark[ch].n++;
				}
			}
			 if (chr=="?")Arr= chars1;
			 else Arr= chars2;
			 if (mark[ch].c=="*")islowercase=1;
			 else islowercase=0;
			 for(var i=0;i<mark[ch].n;i++){
				 tmp=Arr[GetRandomNum(0,Arr.length-1)];
				 if (islowercase){tmp=tmp.toLowerCase();}//转小写			 
			 	 str= str.replace(chr,tmp);	
				 if (str.indexOf("[")!=-1){
					 for(var ad in  ArrDate){									 
					    str= str.replace("["+ad+"]",ArrDate[ad]);	
					 }
				}
			 }
			
			 
		} 
		$('result2').value +=""+str+"\n";
		
		 
	}
	
 
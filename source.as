  		// global variables
			var MyTimer:Timer = new Timer(1000);
			var first1:Array = new Array();
			var op:Array = new Array();
			var second:Array = new Array();
			var res:Array = new Array();
			var k1:Array = new Array;
			var k2:Array = new Array;
			var Result:Array = new Array;
			var draw_right:Array = new Array;
			var draw_wrong:Array = new Array;
			var draw_normal:Array = new Array;
			var i:uint;
			var operation_Count:uint;
			var delay:int = 12;
			// score variable
			var right_count:uint =0;
			var wrong_count:uint =0;
			var normal_count:int =right_count -  wrong_count;
add_mc.addEventListener(MouseEvent.CLICK,addition);
sub_mc.addEventListener(MouseEvent.CLICK,Subtraction);
mul_mc.addEventListener(MouseEvent.CLICK,Multiplication);
div_mc.addEventListener(MouseEvent.CLICK,divison);
// timer function
function MyTimer2 (e:TimerEvent):void
{
var snd2:Sound  = new Sound();
var channel2:SoundChannel = new SoundChannel();
var req2:URLRequest = new URLRequest("timer.mp3");
var snd3:Sound  = new Sound();
var channel3:SoundChannel = new SoundChannel();
var req3:URLRequest = new URLRequest("bell.mp3");
	  m22.text  = String(delay--);
	  
	  for ( i=0 ; i <= 60; i++)
	  {
		draw_right[i]+=right_count;
		draw_wrong[i]+=wrong_count;  
		draw_normal[i]+=right_count- wrong_count;  
	  }
	  if(delay == 7){
		snd2.load(req2);
channel2 = snd2.play();  
	  } else if (delay == 0)
	  {snd3.load(req3);
			channel3 = snd3.play();  
	  }
	  else if (delay == -1)
	  {
		    m22.text  = "Times Up.";
			 MyTimer.stop();
 		score();
	  }
}
function addition(e:MouseEvent):void
{	gotoAndPlay(223);
	operation_Count =1;
	for(i=1;i<=5;i++)
			{
		k1[i]=Math.round(Math.random()*10);
		k2[i]=Math.round(Math.random()*10);
		Result[i] = k1[i] + k2[i];
			}
stage.addEventListener(KeyboardEvent.KEY_DOWN, appending);
			 creation();
}
function Subtraction(e:MouseEvent):void
{	gotoAndPlay(223);
	var temp:uint;
	operation_Count =2;
		for(i=1;i<=5;i++)
			{
		k1[i]=Math.round(Math.random()*10);
		k2[i]=Math.round(Math.random()*10);
		if (k2[i]>k1[i]) {
					temp =k1[i];
					k1[i]=k2[i];
					k2[i]=temp;
				}
		Result[i] = k1[i] - k2[i];
			}
stage.addEventListener(KeyboardEvent.KEY_DOWN, appending);
		 creation();

}
function Multiplication(e:MouseEvent):void
{gotoAndPlay(223);	
	operation_Count =3;
	for(i=1;i<=5;i++)
			{
		k1[i]=Math.round(Math.random()*5);
		k2[i]=Math.round(Math.random()*5);
		Result[i] = k1[i] * k2[i];
			}
	stage.addEventListener(KeyboardEvent.KEY_DOWN, appending);
			 creation();

}
function divison(event:MouseEvent):void
{gotoAndPlay(223);	
	var divide:uint;
	operation_Count =4;
	for(i=1;i<=5;i++)
			{
	k1[i]=Math.round(Math.random()*10)+Math.round(Math.random()*10);
	k2[i]=Math.round(Math.random()*10)+Math.round(Math.random()*10);
			divide=k1[i]%k2[i];
		if (divide!=0||k2[i]>k1[i]) {
		while (divide!=0) {
	k1[i]=Math.round(Math.random()*10)+Math.round(Math.random()*20);
	k2[i]=Math.round(Math.random()*10)+Math.round(Math.random()*10);
		divide=k1[i]%k2[i];
					}
					if (k2[i]==0)
					{k2[i]++;}
		}
		Result[i] = k1[i] / k2[i];
			}
			
stage.addEventListener(KeyboardEvent.KEY_DOWN, appending);
			 creation();

}
// create the textField
	 function creation() {
			for (i= 1 ; i<= 5; i++)
	{		first1[i]= createCustomTextField(-150,(50)*(i-3)-100,75,45);
			op[i]= createCustomTextField(-75,(50)*(i-3)-100,75,45);
		    second[i]= createCustomTextField(0,(50)*(i-3)-100,75,45);
			res[i]= createCustomTextField(75,(50)*(i-3)-100,75,45);
			if (operation_Count == 1)
		{
			op[i].text = "+";
		}	else if (operation_Count == 2)
		{	
			op[i].text = "-";
		}else if (operation_Count == 3)
		{	
			op[i].text = "*";
		}else if (operation_Count == 4)
		{	
			op[i].text = "/";
		}
			first1[i].text = String(k1[i]);
			second[i].text = String(k2[i]);
		
		}
		MyTimer.start();
	MyTimer.addEventListener(TimerEvent.TIMER,MyTimer2);		
 }
				
		// create text field ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		function createCustomTextField(x:Number,y:Number,width:Number,height:Number):TextField {
			var result:TextField=new TextField  ;
            var format:TextFormat = new TextFormat();
			result.x=x;
			result.y=y;
			result.width=width;
			result.height=height;
			result.background=false;
			result.border=false;
			result.selectable=false;
			result.restrict="0-9";
		    format.size = 36; 
			format.color = 0xFFFFFF;
            result.defaultTextFormat = format;
			addChild(result);
			return result;
		}
		function removeCustomTextField(e:TextField):void
		{
			removeChild(e);
		}
		/////////////////////////////////////////////////
		
		function appending(event:KeyboardEvent):void
{
		switch (event.keyCode)
		{
		case 97 :
		 res[1].appendText("1");
		break;
		case 98 :
		 res[1].appendText("2");
		break;
		case 99 :
		 res[1].appendText("3");
		break;
		case 100 :
		 res[1].appendText("4");
		break;
		case 101 :
		 res[1].appendText("5");
		break;
		case 102 :
		 res[1].appendText("6");
		break;
		case 103 :
		 res[1].appendText("7");
		break;
		case 104 :
		 res[1].appendText("8");
		break;
		case 105 :
		 res[1].appendText("9");
		break;
		case 96 :
		 res[1].appendText("0");
		break;
		case 32 :
		 res[1].text =  "";
		break;
		}
		
			if ( operation_Count == 1 && event.keyCode == 13 )
	{
		// addition
		if (Result[1] == parseInt(res[1].text) )
		{ 
		right_count++;
		changy();
		right();
	}else 
	{
		wrong_count++;
		wrong();
		changy();
	}
		}
		// substraction
	else if ( operation_Count == 2 && event.keyCode == 13 )
	{
		
		if (Result[1] == parseInt(res[1].text) )
		{ 
		right_count++;
		changy();
		right();
	}else 
	{
		wrong_count++;
		wrong();
		changy();
	}
	// Multiplication
		}else if ( operation_Count == 3 && event.keyCode == 13 )
	{
		
		if (Result[1] == parseInt(res[1].text) )
		{ 
		right_count++;
		right();
changy_multiply ();
	}else 
	{
		wrong_count++;
		wrong();
changy_multiply ();
	}
		}// divison
		else if ( operation_Count == 4 && event.keyCode == 13 )
	{
		
		if (Result[1] == parseInt(res[1].text) )
		{ 
		right_count++;
		right();
changy_divide();
		}else{
		wrong_count++;
		wrong();
changy_divide();

	}
		}

}
		
				function changy ():void
		{
			 var temp:uint =0;
			for(i=1;i<=4;i++)
			{
				k1[i] = k1[i+1]
				k2[i] = k2[i+1]
				Result[i] =Result[i+1];
			}
			//////////////////// here u put the level of the game 
			if (right_count < 5)
	{
		k1[5]=Math.round(Math.random()*10);
		k2[5]=Math.round(Math.random()*10);
	}else if (right_count < 15)
	{
 		k1[5]=Math.round(Math.random()*10) + 6;
		k2[5]=Math.round(Math.random()*10) + 6;
	}else if (right_count < 20 )
	{
k1[5]=Math.round(Math.random()*20) + 16;
k2[5]=Math.round(Math.random()*10) + 8;
	} else if (right_count < 30 )
	{
k1[5]=Math.round(Math.random()*20) + 20;
k2[5]=Math.round(Math.random()*20) + Math.round(Math.random()*10)+ 10;
	}else 
	{
k1[5]=Math.round(Math.random()*100) + Math.round(Math.random()*50)+ 10;
k2[5]=Math.round(Math.random()*50) + Math.round(Math.random()*30) + 10;
	}
			if(operation_Count == 1)
			{
			Result[5] = k1[5] + k2[5];
			}else if (operation_Count == 2)
			{
				if (k2[5]>k1[5]) {
					temp =k1[5];
					k1[5]=k2[5];
					k2[5]=temp;
				}
				Result[5] = k1[5] - k2[5];
			}
			  

				///////////////// clear the text
			for (i= 1 ; i<= 5; i++)
	{
			first1[i].text = String(k1[i]);
			second[i].text = String(k2[i]);
		}
			res[1].text = "";
	}
	////////////////////////////
	function changy_divide ():void
		{
			var divide:uint;
			for(i=1;i<=4;i++)
			{
				k1[i] = k1[i+1]
				k2[i] = k2[i+1]
				Result[i] =Result[i+1];
			}
			random_divide();
	
	
	if(operation_Count == 4)
			{
				divide=k1[5]%k2[5];
	if (divide!=0||k2[5]>k1[5]||k1[5]==k2[5]||k2[5]==1) {
		while (divide!=0) {
	random_divide();
		divide=k1[5]%k2[5];
					}
		}
			if (k2[5]==0) {
					k2[5]++;
				}
				Result[5] = k1[5] / k2[5];

			}
			///////////////// clear the text
			for (i= 1 ; i<= 5; i++)
	{
			first1[i].text = String(k1[i]);
			second[i].text = String(k2[i]);
		}
			res[1].text = "";
		}
		
		/////////////////////////////////
		function changy_multiply():void
		{
			for(i=1;i<=4;i++)
			{
				k1[i] = k1[i+1]
				k2[i] = k2[i+1]
				Result[i] =Result[i+1];
			}
	if (right_count < 5)
	{
		k1[5]=Math.round(Math.random()*5)+1;
		k2[5]=Math.round(Math.random()*5)+1;
	}else if (right_count < 10) //13 - 1
	{
 		k1[5]=Math.round(Math.random()*6) + 4;
		k2[5]=Math.round(Math.random()*5) + 3;
	}else if (right_count < 20 )//20-10 
	{
k1[5]=Math.round(Math.random()*8) + 8;
k2[5]=Math.round(Math.random()*5) + 3;
	} else if (right_count < 35 ) // 220 - 30
	{
k1[5]=Math.round(Math.random()*10) + 8;
k2[5]=Math.round(Math.random()*5)+ 5;
	}else 
	{
k1[5]=Math.round(Math.random()*20)+12;
k2[5]=Math.round(Math.random()*5)+7;
	}			
			
			 if(operation_Count == 3)
			{
			Result[5] = k1[5] * k2[5];
			}
			///////////////// clear the text
			for (i= 1 ; i<= 5; i++)
	{
			first1[i].text = String(k1[i]);
			second[i].text = String(k2[i]);
		}
			res[1].text = "";		
}
		/////////////////////////////////////////////
		function random_divide():void
		{
				if (right_count < 5)
	{
		k1[5]=Math.round(Math.random()*30)+10;
		k2[5]=Math.round(Math.random()*5)+2;
	}else if (right_count < 10) // 50 -10
	{
 		k1[5]=Math.round(Math.random()*50) + 30;
		k2[5]=Math.round(Math.random()*20) + 10;
	}else if (right_count < 20 )// 100 - 20
	{
k1[5]=Math.round(Math.random()*50) + 50;
k2[5]=Math.round(Math.random()*20) + 10;
	} else if (right_count < 35 ) // 220 - 30
	{
k1[5]=Math.round(Math.random()*120) + 100;
k2[5]=Math.round(Math.random()*30)+ 30;
	}else 
	{
k1[5]=Math.round(Math.random()*200)+Math.round(Math.random()*100)+ 200;
k2[5]=Math.round(Math.random()*10)+ Math.round(Math.random()*50) + 30;
	}
		}
		//*******scooooooooooore*********
	function score ():void
			{
						normal_count=right_count-wrong_count;

				var myXML:XML = new XML();  
				
var newItem:XML = XML("<message><normal_count>" + normal_count + "</normal_count><right_count>" + right_count + "</right_count><wrong_count>"+ wrong_count+ "</wrong_count></message>");  

myXML.appendChild (newItem);  

var request2:URLRequest = new URLRequest("messages.php");  
request2.data = myXML;  
request2.contentType = "text/xml";  
request2.method = URLRequestMethod.POST;
var loader2:URLLoader = new URLLoader(  );  
loader2.load ( request2 );  


				
				score_txt.text = "u answered " + right_count   +   "right answers \n u answered"+ wrong_count + "wrong answers \n ur right answer per minute " + Math.round(right_count / 60) +" \n " + "ur score is "+normal_count + "" ;
				
							
				for (i= 1 ; i<= 5; i++)
	{
		   removeCustomTextField( second[i]);
		   removeCustomTextField( res[i]);
		   removeCustomTextField( first1[i]);
		   removeCustomTextField( op[i]);
	}
			//reset();
		stage.removeEventListener(KeyboardEvent.KEY_DOWN,appending);
}

function right ():void
{
var snd:Sound  = new Sound();
var channel:SoundChannel = new SoundChannel();
var req:URLRequest = new URLRequest("right_answer.mp3");
snd.load(req);
channel = snd.play();  
	var Correct:right2 = new right2() ;
	Correct.x = 100;
	Correct.y = -200 ;
	addChild(Correct);
}
function wrong():void
{
	var snd:Sound  = new Sound();
var channel:SoundChannel = new SoundChannel();
var req:URLRequest = new URLRequest("wrong_answer.mp3");
snd.load(req);
channel = snd.play();  
	var Correct:wrong2 = new wrong2() ;
	Correct.x = 100 ;
	Correct.y = -200 ;
	addChild(Correct);
}
function reset(e:MouseEvent):void
	{
		
		
		normal_count =0;
		right_count =0;
		wrong_count =0;
		delay
	}

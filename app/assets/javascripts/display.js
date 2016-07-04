 function Display(no){
  
     if(no == "no1"){
  
         document.getElementById("SW1").style.display = "block";
         document.getElementById("SW2").style.display = "none";
  
     }else if(no == "no2"){
  
         document.getElementById("SW1").style.display = "none";
         document.getElementById("SW2").style.display = "block";
  
     }
  
 }
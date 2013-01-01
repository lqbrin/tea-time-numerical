var srcbase;
var caption;

function setFrame(num,cap,msg){
  var zero;
  if (cap<10) zero="0"; else zero="";
  document.getElementById("storyframe").src=[srcbase,zero,cap,".png"].join('');
  document.getElementById("message").innerHTML=["<strong>",num,". </strong>",msg].join('');
}

function setStep(num,ind,cap){
  var zero;
  if (ind<10) zero="0"; else zero="";
  document.getElementById("storyframe").src=[srcbase,zero,ind,".png"].join('');
  document.getElementById("message").innerHTML=["<strong>",num,". </strong>",caption[cap]].join('');
}

function osSelected(name,ind,cap){
  switch (name){
    case "Win":
      hideContext("mac");
      hideContext("lin");
      showContext("win");
      break;
    case "Mac":
      hideContext("win");
      hideContext("lin");
      showContext("mac");
      break;
    case "Lin":
      hideContext("mac");
      hideContext("win");
      showContext("lin");
      break;
  }
  setStep(1, ind, cap);
}

function flavorSelected(name,ind,cap){
  switch (name){
    case "kub":
      hideContext("lub");
      hideContext("ubu");
      showContext("kub");
      break;
    case "lub":
      hideContext("kub");
      hideContext("ubu");
      showContext("lub");
      break;
    case "ubu":
      hideContext("kub");
      hideContext("lub");
      showContext("ubu");
      break;
  }
  setStep(1, ind, cap);
}

function openFullWindow(url, windowName, windowWidth, windowHeight)
{
  var parameters,win;
  windowWidth-=4;
  windowHeight-=55;
  parameters=['width=',windowWidth,', height=',windowHeight,', location=0, menubar=0, status=0, toolbar=0, scrollbars=1, resizable=1'].join('');
  win = window.open(url,windowName,parameters);
  win.focus();
}

function hideContext(name){
  var i, el;
  el=document.getElementsByName(name+"Context");
  for (i=0;i<el.length;i++) {
    el[i].style.display="none";
  }
}

function showContext(name){
  var i, el;
  el=document.getElementsByName(name+"Context");
  for (i=0;i<el.length;i++) {
    el[i].style.display="initial";
  }
}
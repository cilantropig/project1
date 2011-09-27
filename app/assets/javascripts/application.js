// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//=require jquery
//= require jquery_ujs
//= require_tree .


var gsaw=3;
  var axaw=new Array(),ayaw=new Array();
  axaw[0]=7,ayaw[0]=0;
  axaw[1]=5,ayaw[1]=7;
  axaw[2]=3,ayaw[2]=-5;
  axaw[3]=-3,ayaw[3]=0;
  var xMaxaw=1500;
  var yMaxaw=1500;
  var mukuSpeedaw=50;
if (document.images) {
 var myImgaw=new Array();
  myImgaw[0]=new Image(),myImgaw[0].src="/images/jinyu1.gif";
  myImgaw[1]=new Image(),myImgaw[1].src="/images/jinyu2.gif";
  myImgaw[2]=new Image(),myImgaw[2].src="/images/jinyu3.gif";
  myImgaw[3]=new Image(),myImgaw[3].src="/images/jinyu4.gif";
  myImgaw[4]=new Image(),myImgaw[4].src="/images/jinyu5.gif";
  myImgaw[5]=new Image(),myImgaw[5].src="/images/jinyu6.gif";
  myImgaw[6]=new Image(),myImgaw[6].src="/images/jinyu7.gif";
  myImgaw[7]=new Image(),myImgaw[7].src="/images/jinyu8.gif";
}
function mukuSetaw(name,x,y) {
  if (document.all) {
  document.all(name).style.posLeft+=x;
  document.all(name).style.posTop+=y;
  }
  else if (document.getElementById) {
  document.getElementById(name).style.left=parseInt(document.getElementById(name).style.left)+x;
  document.getElementById(name).style.top=parseInt(document.getElementById(name).style.top)+y;
  }
  else if (document.layers) document.layers[name].moveBy(x,y);
  }
function mukuGetaw(name,flag) {
  if (document.all) {
  if (flag=="x") return document.all(name).style.posLeft;
  if (flag=="y") return document.all(name).style.posTop;
  if (flag=="w") return document.all(name).style.posWidth;
  if (flag=="h") return document.all(name).style.posHeight;
  }
  else if (document.getElementById) {
  if (flag=="x") return parseInt(document.getElementById(name).style.left);
  if (flag=="y") return parseInt(document.getElementById(name).style.top);
  if (flag=="w") return parseInt(document.getElementById(name).style.width);
  if (flag=="h") return parseInt(document.getElementById(name).style.height);
  }
  else if (document.layers) {
  if (flag=="x") return document.layers[name].left;
  if (flag=="y") return document.layers[name].top;
  if (flag=="w") return document.layers[name].clip.width;
  if (flag=="h") return document.layers[name].clip.height;
  }
  }
function mukuGetWinaw(flag) {
  if (document.all) {
  if (flag=="xStart") return document.body.scrollLeft;
  if (flag=="xEnd") return document.body.scrollLeft+document.body.clientWidth;
  if (flag=="yStart") return document.body.scrollTop;
  if (flag=="yEnd") return document.body.scrollTop+document.body.clientHeight;
  }
  else if (document.getElementById) {
  if (flag=="xStart") return window.scrollX;
  if (flag=="xEnd") return window.scrollX+innerWidth;
  if (flag=="yStart") return window.scrollY;
  if (flag=="yEnd") return window.scrollY+innerHeight;
  }
  else if (document.layers) {
  if (flag=="xStart") return pageXOffset;
  if (flag=="xEnd") return pageXOffset+innerWidth;
  if (flag=="yStart") return pageYOffset;
  if (flag=="yEnd") return pageYOffset+innerHeight;
  }
  }
function imgChangeaw(name,num,subNum) {
  if (document.all || document.getElementById) {
  document.images["img"+num+"aw"].src=myImgaw[subNum].src;
  }
  else if (document.layers) {
  document.layers[name].document.images["img"+num+"aw"].src=myImgaw[subNum].src;
  }
  }
function gs9768(){
  if (document.all || document.getElementById || document.layers) {
  var name,x,y,w,h,aa;
  var xStart=mukuGetWinaw("xStart");
  var xEnd=mukuGetWinaw("xEnd");
  var yStart=mukuGetWinaw("yStart");
  var yEnd=mukuGetWinaw("yEnd");
  for (var i=0;i<=gsaw;i++) {
  name="Im"+i+"aw";
  mukuSetaw(name,axaw[i],ayaw[i]);
  x=mukuGetaw(name,"x");
  y=mukuGetaw(name,"y");
  w=mukuGetaw(name,"w");
  h=mukuGetaw(name,"h");
  if (x>=xStart && x+axaw[i]<=xStart) axaw[i]=-axaw[i];
  if (x+w<=xEnd && x+w+axaw[i]>=xEnd) axaw[i]=-axaw[i];
  if (y>=yStart && y+ayaw[i]<=yStart) ayaw[i]=-ayaw[i];
  if (y+h<=yEnd && y+h+ayaw[i]>=yEnd) ayaw[i]=-ayaw[i];
  if (x<0 || x>xMaxaw) axaw[i]=-axaw[i];
  if (y<0 || y>yMaxaw) ayaw[i]=-ayaw[i];
  if (axaw[i]>0 && ayaw[i]>0) imgChangeaw(name,i,5);
  else if (axaw[i]>0 && ayaw[i]<0) imgChangeaw(name,i,3);
  else if (axaw[i]<0 && ayaw[i]>0) imgChangeaw(name,i,7);
  else if (axaw[i]<0 && ayaw[i]<0) imgChangeaw(name,i,1);
  else if (axaw[i]==0) {
  if (ayaw[i]>0) imgChangeaw(name,i,6);
  else if (ayaw[i]<0) imgChangeaw(name,i,2);
  }
  else if (ayaw[i]==0) {
  if (axaw[i]>0) imgChangeaw(name,i,4);
  else if (axaw[i]<0) imgChangeaw(name,i,0);
  }
  }
  setTimeout("gs9768()",mukuSpeedaw);
  }
  }


<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8"/>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<title>魂 - 10秒の闘い</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Kaisei+Decol:wght@700&family=Hina+Mincho&display=swap');
*{margin:0;padding:0;box-sizing:border-box;-webkit-tap-highlight-color:transparent;user-select:none;}
html,body{width:100%;height:100%;overflow:hidden;background:#060000;font-family:'Kaisei Decol',serif;}
@keyframes tp{0%,100%{text-shadow:0 0 20px #f60,0 0 50px #f10,5px 5px 0 rgba(80,0,0,.7)}50%{text-shadow:0 0 40px #fa0,0 0 80px #f60,5px 5px 0 rgba(80,0,0,.7)}}
@keyframes bp{0%,100%{box-shadow:0 0 0 5px rgba(255,100,0,.35),0 0 40px rgba(255,60,0,.7),inset 0 3px 10px rgba(255,220,100,.35),inset 0 -5px 15px rgba(0,0,0,.6)}50%{box-shadow:0 0 0 9px rgba(255,120,0,.55),0 0 80px rgba(255,80,0,1),inset 0 3px 10px rgba(255,220,100,.35),inset 0 -5px 15px rgba(0,0,0,.6)}}
@keyframes dp{0%,100%{transform:scale(1)}50%{transform:scale(1.12)}}
@keyframes mi{from{transform:scale(.3) rotate(-5deg);opacity:0}to{transform:scale(1) rotate(0);opacity:1}}
@keyframes sp{from{transform:scale(.1) rotate(-10deg);opacity:0}to{transform:scale(1) rotate(0);opacity:1}}
@keyframes rf{from{opacity:1;transform:scale(1)}to{opacity:.55;transform:scale(1.07)}}
@keyframes cdin{from{transform:scale(3.5);opacity:0}to{transform:scale(1);opacity:1}}
@keyframes fr{0%{transform:translate(0,0) scale(1) rotate(var(--r));opacity:1}60%{opacity:.8}100%{transform:translate(var(--dx),var(--dy)) scale(.05) rotate(calc(var(--r) + 40deg));opacity:0}}
@keyframes sk{0%,100%{transform:translate(0,0)}15%{transform:translate(-7px,4px) rotate(-.8deg)}30%{transform:translate(7px,-4px) rotate(.8deg)}45%{transform:translate(-5px,5px) rotate(-.5deg)}60%{transform:translate(6px,-3px) rotate(.6deg)}75%{transform:translate(-4px,2px)}90%{transform:translate(4px,-2px)}}
@keyframes sg{0%,100%{opacity:0;transform:scale(.2)}50%{opacity:.4;transform:scale(1)}}
@keyframes bw{0%{transform:translate(-50%,-50%) scale(.2);opacity:1}40%{transform:translate(-50%,calc(-50% - 28px)) scale(1.15);opacity:1}100%{transform:translate(-50%,calc(-50% - 88px)) scale(.9);opacity:0}}
input{font-family:'Kaisei Decol',serif;outline:none;}
input::placeholder{color:rgba(255,150,50,.4);}
::-webkit-scrollbar{width:4px}::-webkit-scrollbar-track{background:rgba(255,50,0,.1)}::-webkit-scrollbar-thumb{background:rgba(255,100,0,.4);border-radius:2px}
#app{position:fixed;inset:0;}
canvas{position:fixed;inset:0;width:100%;height:100%;pointer-events:none;opacity:.82;z-index:1;}
.vignette{position:fixed;inset:0;z-index:3;pointer-events:none;background:radial-gradient(ellipse at center,transparent 30%,rgba(100,0,0,.65) 100%);}
.glow{position:fixed;inset:0;z-index:2;pointer-events:none;background:radial-gradient(ellipse at 50% 85%,rgba(255,70,0,.2) 0%,transparent 60%);}
.screen{position:fixed;inset:0;z-index:20;display:flex;flex-direction:column;align-items:center;justify-content:center;padding:20px;}
.lang-switch{position:fixed;top:14px;left:50%;transform:translateX(-50%);z-index:500;display:flex;border-radius:30px;overflow:hidden;box-shadow:0 0 20px rgba(255,100,0,.5);border:2px solid rgba(255,150,50,.4);}
.lang-btn{font-family:'Kaisei Decol',serif;font-size:13px;font-weight:700;padding:7px 20px;border:none;cursor:pointer;transition:all .2s;}
.lang-btn.active{background:linear-gradient(135deg,#f60,#f10);color:white;}
.lang-btn.inactive{background:rgba(40,5,0,.85);color:rgba(255,150,50,.5);}
.main-btn{font-family:'Kaisei Decol',serif;font-weight:700;color:rgba(255,245,180,.98);background:radial-gradient(circle at 38% 28%,#ff5500,#cc0000 55%,#880000);border:none;border-radius:50%;cursor:pointer;position:relative;overflow:hidden;transition:transform .07s,box-shadow .07s;text-shadow:0 0 18px rgba(255,220,0,.9),0 2px 5px rgba(0,0,0,.6);}
.main-btn .gloss{position:absolute;inset:0;border-radius:50%;background:radial-gradient(circle at 38% 26%,rgba(255,255,255,.28) 0%,transparent 55%);}
.sub-btn{font-family:'Kaisei Decol',serif;font-size:14px;font-weight:700;color:rgba(255,180,50,.8);background:transparent;border:2px solid rgba(255,150,50,.4);border-radius:30px;cursor:pointer;padding:8px 24px;letter-spacing:2px;}
.fight-btn{font-family:'Kaisei Decol',serif;font-size:18px;font-weight:700;color:rgba(255,245,180,.98);background:radial-gradient(circle at 38% 28%,#f55,#c00 55%,#800);border:none;border-radius:14px;cursor:pointer;padding:12px 32px;box-shadow:0 0 25px rgba(255,60,0,.6);text-shadow:0 0 15px rgba(255,220,0,.9);}
.skip-btn{font-family:'Hina Mincho',serif;font-size:12px;color:rgba(255,150,50,.5);background:transparent;border:none;cursor:pointer;letter-spacing:1px;}
.back-btn{font-family:'Kaisei Decol',serif;font-size:14px;font-weight:700;color:rgba(255,150,50,.7);background:transparent;border:2px solid rgba(255,100,0,.3);border-radius:30px;cursor:pointer;padding:10px 20px;}
.name-input{font-size:20px;font-weight:700;color:#fa0;background:rgba(40,5,0,.9);border:2px solid rgba(255,100,0,.5);border-radius:12px;padding:12px 20px;text-align:center;width:100%;max-width:280px;box-shadow:0 0 20px rgba(255,80,0,.3);caret-color:#fa0;}
.flame-particle{position:fixed;z-index:55;pointer-events:none;border-radius:50% 50% 30% 30%;transform-origin:bottom center;}
.spark-particle{position:fixed;z-index:60;pointer-events:none;}
.star-dot{position:fixed;border-radius:50%;pointer-events:none;z-index:4;}
</style>
</head>
<body>
<div id="app"></div>
<canvas id="flameCanvas"></canvas>

<script>
const T=10;
const MSG_JA=["さすがだ！その速さ本物だ！","すごい！もはや人間じゃない！","さすが！お前のためにある10秒！","それでいい！最高だぞ！","センスが違う！生まれながらの覇者！","そうだ！それがお前の本当の力！","止まるな！止まったら俺が泣く！","さすがすぎる！言葉が出ない！","すごい才能だ！こんな人間初めて見た！","さすがの一言に尽きる！","それだ！その調子！宇宙一だ！","センスの塊！お前は天才だ！","すごすぎて笑えてきた！","さすがだ！母ちゃんに自慢しろ！","そこまで速いか！鬼神か！","すごい集中力！神がかってる！","さすが本物は違う！格が違う！","それが覚悟というものだ！","速い！速すぎる！化け物め！","さすがだ！銀河系最強はお前！","そうだ！魂を燃やし続けろ！","センス抜群！天が認めた！","すごすぎる！完璧すぎる！","鬼の速さ！さすがとしか言えん！","神様もお前を見て嫉妬してる！","お前の才能は底なしだ！"];
const MSG_EN=["AS EXPECTED!! TRUE SPEED!!","AMAZING!! NOT HUMAN!!","THIS IS YOUR MOMENT!!","ABSOLUTELY PERFECT!!","BORN CHAMPION!!","THAT IS YOUR TRUE POWER!!","DON'T STOP!! I'LL CRY!!","SPEECHLESS!!","INCREDIBLE TALENT!!","UNIVERSE NUMBER ONE!!","PURE GENIUS!! LEGEND!!","SO AMAZING I'M LAUGHING!!","CALL YOUR MOM!!","DEMON GOD SPEED!!","AMAZING FOCUS!! GODLIKE!!","DIFFERENT CLASS!!","FAST!! TOO FAST!! MONSTER!!","GALAXY'S STRONGEST!!","KEEP THAT SOUL BURNING!!","LEGENDARY FINGERS!!","TOO PERFECT!!","DEMON SPEED!!","THE UNIVERSE IS SHAKING!!","GOD IS JEALOUS OF YOU!!","TALENT WITH NO BOTTOM!!"];
const BW_JA=["さすが！","すごい！","最強！","天才！","伝説！","覚醒！","無敵！","鬼神！","覇者！","烈火！","至高！","神業！","爆速！","センス！","そうだ！"];
const BW_EN=["AS EXPECTED!!","AMAZING!!","SUPREME!!","GENIUS!!","LEGEND!!","AWAKENED!!","INVINCIBLE!!","DEMON GOD!!","CHAMPION!!","BLAZING!!","DIVINE!!","GODSPEED!!","SENSATIONAL!!","ABSOLUTE!!"];
const RK_JA=[[0,"無名の戦士"],[15,"炎の候補生"],[25,"紅蓮の兵士"],[35,"業火の猛者"],[45,"灼熱の勇士"],[55,"鬼神の域"],[65,"覚醒した者"],[75,"伝説の男"],[85,"神話の英雄"],[100,"天上天下唯我独尊"],[120,"宇宙の支配者"]];
const RK_EN=[[0,"Unknown Warrior"],[15,"Flame Rookie"],[25,"Crimson Soldier"],[35,"Inferno Fighter"],[45,"Blazing Champion"],[55,"Demon God Tier"],[65,"Awakened One"],[75,"Living Legend"],[85,"Mythological Hero"],[100,"Heaven & Earth Ruler"],[120,"Master of Universe"]];
const PR_JA={0:["さすがだ！画面を叩いた！それだけで100点！次は全力でいけ！","まず挑戦した！それがすごい！お前の可能性は無限大だ！"],15:["さすが！15回！その勢い本物だ！まだまだ伸びる！","すごい！その根性、誰にも負けてない！"],25:["さすがの速さだ！25回超え！立派な闘士の片鱗！","すごいぞ！そのセンス、天性のものだ！"],35:["さすが！35回！鬼の速さが目覚めてきたぞ！","すごすぎる！その指先、才能がダダ漏れだ！"],45:["さすがだ！45回！もはや常人じゃない！","すごい集中力！鋼鉄より硬い意志だ！"],55:["さすが本物！55回超え！鬼神の速さとはこれだ！","すごい！その指、国宝に認定する！完璧だ！"],65:["さすが！65回！人類の限界をぶち破った！","すごすぎる！銀河系最速の称号はお前のものだ！"],75:["さすがだ！75回！もはや神話の登場人物！","すごい！英雄が現れた！それがお前！"],85:["さすが！85回超え！神様がビビって逃げ出した！","すごすぎる！大宇宙が平伏す！完全なる覇者！"],100:["さすが！100回！三桁の魔王！人間を超えた存在だ！","すごい！100回超えは伝説の証！お前の名前を星に刻む！"],120:["さすがは宇宙の支配者！120回！神様でも追いつけん！","すごすぎて語彙力が死んだ！120回は奇跡！"]};
const PR_EN={0:["As expected you started!! 100 points!! Next time GO FULL POWER!!","You started!! Infinite potential!!"],15:["As expected!! 15 taps!! That momentum is REAL!!","Amazing!! That spirit is second to none!!"],25:["25 plus taps!! True warrior emerging!!","Amazing!! Natural born talent!!"],35:["35 taps!! Demon speed awakens!!","So amazing!! Talent overflowing!!"],45:["45 taps!! Beyond ordinary!!","Amazing!! Will of steel!!"],55:["55 plus taps!! DEMON GOD SPEED!!","Amazing!! National treasure fingers!! PERFECT!!"],65:["65 taps!! Human limits SHATTERED!!","Galaxy Fastest is YOURS!!"],75:["75 taps!! Mythological now!!","Hero born since the Big Bang - YOU!!"],85:["85 plus taps!! God got scared and ran!!","Universe bows to you!!"],100:["100 TAPS!! Transcended humanity!!","Your name on the stars FOREVER!!"],120:["120!! Even God cannot keep up!!","Once in a billion years miracle!!"]};
const L={
  ja:{ti:"魂",sub:"10秒の闘い",bl:"ベスト：",bu:" 回",tl:"回",sl:"秒",sb:"始めろ！",tb:"叩け！",rb:"もう一回！",rt:"── 結果発表 ──",ru:"回 / 10秒",rk:"世界ランキング",rkb:"ランキング",bk:"← 戻る",np:"名前を入力しろ！",nph:"お前の名前",nc:"参戦！",nr:"NEW RECORD！神が嫉妬してる！",nn:"まだ誰も挑戦していない！\nお前が最初の伝説になれ！",skp:"名前なしで挑戦",msg:MSG_JA,bw:BW_JA,rk2:RK_JA,pr:PR_JA},
  en:{ti:"SOUL",sub:"10 SECONDS OF GLORY",bl:"BEST: ",bu:" taps",tl:"taps",sl:"SEC",sb:"LET'S GO!!",tb:"HIT IT!!",rb:"AGAIN!!",rt:"── RESULT ──",ru:"taps / 10 sec",rk:"WORLD RANKING",rkb:"RANKING",bk:"← BACK",np:"ENTER YOUR NAME!!",nph:"Your name",nc:"FIGHT!!",nr:"NEW RECORD!! God is JEALOUS!!",nn:"Nobody challenged yet!\nBe the first legend!!",skp:"Play without name",msg:MSG_EN,bw:BW_EN,rk2:RK_EN,pr:PR_EN}
};

// --- State ---
let lang="ja",scr="start",name="",tap=0,tl=T,best=0,curMsg="",ranking=[],danger=false,pressed=false,res=null,cdVal=null;
let activeGame=false,timerInt=null,msgInt=null,lastMsgIdx=-1,touchFired=false;
let shaking=false,flashing=false,flashX="50%",flashY="50%";
let flames=[],sparks=[];

// --- localStorage ranking ---
function loadRanking(){try{const d=localStorage.getItem("tamashii-v1");if(d)ranking=JSON.parse(d);}catch(e){}}
function saveRanking(){try{localStorage.setItem("tamashii-v1",JSON.stringify(ranking));}catch(e){}}
function addScore(n,s){
  if(!n||s<=0)return;
  ranking=ranking.filter(e=>e.name!==n);
  ranking.push({name:n,score:s,date:new Date().toLocaleDateString("ja-JP")});
  ranking.sort((a,b)=>b.score-a.score);
  ranking=ranking.slice(0,50);
  saveRanking();
}
loadRanking();

// --- Flame Canvas ---
const canvas=document.getElementById("flameCanvas");
const ctx=canvas.getContext("2d");
function resizeCanvas(){canvas.width=window.innerWidth;canvas.height=window.innerHeight;}
resizeCanvas();
window.addEventListener("resize",resizeCanvas);
let flameParticles=[];
class FP{
  constructor(x,y){
    this.x=x!=null?x:Math.random()*canvas.width;
    this.y=y!=null?y:canvas.height+5;
    this.vx=(Math.random()-.5)*1.1;this.vy=-(1.8+Math.random()*3.2);
    this.life=1;this.dec=0.009+Math.random()*0.016;
    this.r=9+Math.random()*26;this.h=8+Math.random()*38;
    this.w=Math.random()*Math.PI*2;this.ws=0.04+Math.random()*0.06;
  }
  tick(){this.w+=this.ws;this.x+=this.vx+Math.sin(this.w)*.5;this.y+=this.vy;this.vy*=.996;this.life-=this.dec;}
  draw(){
    if(this.life<=0)return;
    const a=Math.min(1,this.life*1.4),sz=this.r*this.life;
    const g=ctx.createRadialGradient(this.x,this.y,0,this.x,this.y,sz);
    g.addColorStop(0,"hsla("+(this.h+35)+",100%,78%,"+(a*.95)+")");
    g.addColorStop(.35,"hsla("+this.h+",100%,58%,"+(a*.75)+")");
    g.addColorStop(.75,"hsla("+(this.h-10)+",90%,32%,"+(a*.35)+")");
    g.addColorStop(1,"hsla(0,80%,10%,0)");
    ctx.beginPath();ctx.arc(this.x,this.y,Math.max(1,sz),0,Math.PI*2);
    ctx.fillStyle=g;ctx.fill();
  }
}
let frameCount=0;
function flameLoop(){
  requestAnimationFrame(flameLoop);
  ctx.clearRect(0,0,canvas.width,canvas.height);
  frameCount++;
  if(frameCount%2===0){
    const n=Math.ceil(canvas.width/32);
    for(let i=0;i<n;i++)flameParticles.push(new FP(Math.random()*canvas.width,canvas.height+5));
  }
  flameParticles=flameParticles.filter(p=>p.life>0);
  flameParticles.forEach(p=>{p.tick();p.draw();});
  if(flameParticles.length>500)flameParticles.splice(0,40);
}
flameLoop();

// --- Helpers ---
function getRank(s){const rk=L[lang].rk2;let r=rk[0][1];for(const[t,n]of rk)if(s>=t)r=n;return r;}
function getPraise(s){const pr=L[lang].pr;const keys=Object.keys(pr).map(Number).sort((a,b)=>b-a);let arr=pr[0];for(const k of keys)if(s>=k){arr=pr[k];break;}return arr[Math.floor(Math.random()*arr.length)];}
function nextMsg(){const m=L[lang].msg;let i;do{i=Math.floor(Math.random()*m.length);}while(i===lastMsgIdx);lastMsgIdx=i;curMsg=m[i];}

function spawnFlame(cx,cy){
  const app=document.getElementById("app");
  const count=7+Math.floor(Math.random()*7);
  for(let i=0;i<count;i++){
    const a=Math.random()*Math.PI*2,d=20+Math.random()*95;
    const dx=Math.cos(a)*d,dy=-(55+Math.random()*135);
    const sz=10+Math.random()*22,h=6+Math.random()*42;
    const dur=.42+Math.random()*.52,rot=-35+Math.random()*70;
    const bl=Math.random()>.5;
    const el=document.createElement("div");
    el.style.cssText="position:fixed;left:"+cx+"px;top:"+cy+"px;z-index:55;pointer-events:none;width:"+sz+"px;height:"+(sz*1.65)+"px;border-radius:50% 50% 30% 30%;background:radial-gradient(ellipse at 40% 30%,hsl("+(h+35)+",100%,78%),hsl("+h+",100%,55%) 50%,hsl("+(h-10)+",90%,30%) 80%,transparent);"+(bl?"filter:blur(1px);":"")+"box-shadow:0 0 "+(sz*.8)+"px hsl("+h+",100%,60%);transform-origin:bottom center;--dx:"+dx+"px;--dy:"+dy+"px;--r:"+rot+"deg;animation:fr "+dur+"s ease-out forwards;";
    app.appendChild(el);
    setTimeout(()=>el.remove(),dur*1000+100);
  }
}
function spawnSpark(cx,cy){
  const app=document.getElementById("app");
  const sh=["*","@","#","+","x"],cl=["#ffd700","#ffaa00","#ff6600","#fff","#ffee88","#ff4400"];
  const count=3+Math.floor(Math.random()*5);
  for(let i=0;i<count;i++){
    const a=Math.random()*Math.PI*2,d=30+Math.random()*90;
    const dx=Math.cos(a)*d,dy=Math.sin(a)*d-55;
    const sz=11+Math.random()*17,col=cl[Math.floor(Math.random()*cl.length)];
    const dur=.5+Math.random()*.45,rot=-180+Math.random()*360;
    const el=document.createElement("div");
    el.style.cssText="position:fixed;left:"+cx+"px;top:"+cy+"px;z-index:60;pointer-events:none;font-size:"+sz+"px;color:"+col+";--dx:"+dx+"px;--dy:"+dy+"px;--r:"+rot+"deg;animation:fr "+dur+"s ease-out forwards;transform-origin:center;";
    el.textContent=sh[Math.floor(Math.random()*sh.length)];
    app.appendChild(el);
    setTimeout(()=>el.remove(),dur*1000+100);
  }
}
function spawnWord(cx,cy){
  if(Math.random()>.55)return;
  const bw=L[lang].bw,w=bw[Math.floor(Math.random()*bw.length)];
  const el=document.createElement("div");
  const r=-20+Math.random()*40;
  el.style.cssText="position:fixed;left:"+cx+"px;top:"+cy+"px;font-family:'Kaisei Decol',serif;font-weight:700;font-size:"+(15+Math.floor(Math.random()*18))+"px;color:#ffaa00;text-shadow:0 0 12px #ff6600,1px 1px 0 rgba(0,0,0,.6);pointer-events:none;z-index:200;white-space:nowrap;animation:bw .85s ease-out forwards;--r:"+r+"deg;transform:translate(-50%,-50%)";
  el.textContent=w;
  document.body.appendChild(el);
  setTimeout(()=>el.remove(),900);
}
function doFlash(x,y){
  flashX=Math.floor((x/window.innerWidth)*100)+"%";
  flashY=Math.floor((y/window.innerHeight)*100)+"%";
  flashing=true;render();
  setTimeout(()=>{flashing=false;render();},70);
}
function doShake(){
  document.getElementById("app").style.animation="none";
  requestAnimationFrame(()=>{
    document.getElementById("app").style.animation="sk .35s ease";
    setTimeout(()=>document.getElementById("app").style.animation="none",350);
  });
}

// --- Game Logic ---
function startCD(){
  setScr("cd");
  let n=3;
  const tick=()=>{
    cdVal=n===0?(lang==="ja"?"始め！":"GO!!"):(lang==="ja"?["3","2","1"][3-n]:String(n));
    render();
    spawnFlame(window.innerWidth/2+(-80+Math.random()*160),window.innerHeight/2+(-60+Math.random()*120));
    if(n===0){setTimeout(()=>{cdVal=null;startGame();},550);return;}
    n--;setTimeout(tick,750);
  };
  setTimeout(tick,100);
}
function startGame(){
  tap=0;activeGame=true;tl=T;danger=false;nextMsg();setScr("game");
  let t=T;
  timerInt=setInterval(()=>{
    t-=.1;tl=Math.max(0,t);
    if(t<=3)danger=true;
    if(t<=0){clearInterval(timerInt);clearInterval(msgInt);endGame();}
    render();
  },100);
  msgInt=setInterval(()=>{nextMsg();render();},750);
}
function endGame(){
  activeGame=false;
  doShake();
  setTimeout(()=>{
    const isNew=tap>best;
    if(isNew&&tap>0)best=tap;
    if(name.trim()&&tap>0)addScore(name.trim(),tap);
    res={score:tap,isNew,rank:getRank(tap),praise:getPraise(tap)};
    setScr("result");
  },500);
}
function onTap(e){
  if(e.type==="click"&&touchFired)return;
  if(e.type==="touchstart"){touchFired=true;setTimeout(()=>touchFired=false,80);}
  e.preventDefault();
  if(!activeGame)return;
  tap++;
  const x=e.touches?e.touches[0].clientX:(e.clientX||window.innerWidth/2);
  const y=e.touches?e.touches[0].clientY:(e.clientY||window.innerHeight/2);
  spawnFlame(x,y);spawnSpark(x,y);spawnWord(x,y);doFlash(x,y);
  if(tap%5===0)doShake();
  pressed=true;render();
  setTimeout(()=>{pressed=false;render();},85);
}

function setScr(s){scr=s;render();}

// --- Render ---
function render(){
  const app=document.getElementById("app");
  const Lc=L[lang];
  const btnSz=Math.min(window.innerWidth*.46,200);

  app.innerHTML=`
    <div class="glow"></div>
    <div class="vignette"></div>
    ${Array.from({length:20},(_,i)=>`<div class="star-dot" style="left:${(i*17+13)%100}%;top:${(i*23+7)%100}%;width:${2+i%4}px;height:${2+i%4}px;background:rgba(255,${150+i*5%100},0,.9);box-shadow:0 0 ${5+i%6}px rgba(255,150,0,.7);animation:sg ${1.5+i*.15}s ease-in-out ${i*.12}s infinite;z-index:4;"></div>`).join("")}
    <div style="position:fixed;inset:0;z-index:6;pointer-events:none;opacity:${flashing?1:0};background:radial-gradient(circle at ${flashX} ${flashY},rgba(255,180,0,.55) 0%,rgba(255,80,0,.2) 40%,transparent 70%);transition:opacity .04s;"></div>

    <div class="lang-switch">
      <button class="lang-btn ${lang==="ja"?"active":"inactive"}" onclick="setLang('ja')">日本語</button>
      <button class="lang-btn ${lang==="en"?"active":"inactive"}" onclick="setLang('en')">English</button>
    </div>

    ${scr==="start"?`
      <div class="screen">
        <div style="font-size:clamp(80px,26vw,140px);font-weight:700;color:#f10;line-height:.9;text-align:center;animation:tp 1.8s ease-in-out infinite;">${Lc.ti}</div>
        <div style="font-family:'Hina Mincho',serif;font-size:clamp(13px,4vw,18px);color:rgba(255,200,80,.75);letter-spacing:6px;margin:8px 0 24px;text-align:center;">${Lc.sub}</div>
        ${best>0?`<div style="font-family:'Hina Mincho',serif;font-size:14px;color:rgba(255,150,50,.7);letter-spacing:3px;margin-bottom:20px;text-align:center;">${Lc.bl}<span style="font-family:'Kaisei Decol',serif;font-size:28px;color:#fa0;text-shadow:0 0 15px #f60;">${best}</span>${Lc.bu}</div>`:""}
        <button class="main-btn" style="width:${btnSz}px;height:${btnSz}px;font-size:${btnSz*.15}px;animation:bp 2s ease-in-out infinite;" onclick="setScr('name')">
          <div class="gloss"></div>${Lc.sb}
        </button>
        <button class="sub-btn" style="margin-top:18px;" onclick="setScr('ranking')">${Lc.rkb}</button>
      </div>
    `:""}

    ${scr==="name"?`
      <div class="screen" style="gap:18px;">
        <div style="font-size:clamp(19px,5.5vw,26px);font-weight:700;color:white;text-shadow:0 0 15px rgba(255,100,0,.8);text-align:center;letter-spacing:2px;">${Lc.np}</div>
        <input class="name-input" value="${name.replace(/"/g,'&quot;')}" placeholder="${Lc.nph}" maxlength="12" oninput="name=this.value" onkeydown="if(event.key==='Enter')startCD()"/>
        <div style="display:flex;gap:12px;">
          <button class="back-btn" onclick="setScr('start')">${Lc.bk}</button>
          <button class="fight-btn" onclick="startCD()">${Lc.nc}</button>
        </div>
        <button class="skip-btn" onclick="startCD()">${Lc.skp}</button>
      </div>
    `:""}

    ${scr==="cd"?`
      <div class="screen" style="background:rgba(8,0,0,.78);backdrop-filter:blur(3px);z-index:100;">
        ${cdVal?`<div style="font-size:clamp(120px,38vw,230px);font-weight:700;color:#fa0;line-height:1;text-shadow:0 0 50px #f60,0 0 120px rgba(255,120,0,.7);animation:cdin .75s cubic-bezier(.175,.885,.32,1.4) both;">${cdVal}</div>`:""}
      </div>
    `:""}

    ${scr==="game"?`
      <div class="screen" style="justify-content:space-between;padding:58px 20px 18px;">
        <div style="width:100%;text-align:center;">
          <div style="font-size:clamp(68px,21vw,100px);font-weight:700;color:${danger?"#f10":"#fa0"};line-height:1;text-shadow:${danger?"0 0 35px #f10,0 0 80px rgba(255,0,0,.8),4px 4px 0 rgba(80,0,0,.6)":"0 0 25px #f60,0 0 60px rgba(255,150,0,.6),4px 4px 0 rgba(80,0,0,.6)"};${danger?"animation:dp .4s ease-in-out infinite;":""}">${Math.ceil(tl)}</div>
          <div style="font-family:'Hina Mincho',serif;font-size:11px;color:rgba(255,160,50,.55);letter-spacing:5px;">${Lc.sl}</div>
          <div style="width:100%;height:10px;background:rgba(255,255,255,.07);border-radius:5px;overflow:hidden;margin-top:8px;">
            <div style="height:100%;width:${Math.max(0,(tl/T)*100)}%;background:${danger?"linear-gradient(90deg,#f00,#f33)":"linear-gradient(90deg,#f10,#f60,#fa0,#fe0)"};border-radius:5px;transition:width .1s linear;box-shadow:${danger?"0 0 20px rgba(255,0,0,.9)":"0 0 10px rgba(255,150,0,.6)"};"></div>
          </div>
        </div>
        <div style="flex:1;display:flex;align-items:center;justify-content:center;text-align:center;padding:0 8px;">
          <div style="font-size:clamp(16px,5.5vw,27px);font-weight:700;color:white;line-height:1.35;max-width:340px;text-shadow:0 0 12px rgba(255,120,0,1),2px 2px 0 rgba(120,0,0,.8);animation:mi .28s cubic-bezier(.175,.885,.32,1.5) both;">${curMsg}</div>
        </div>
        <div style="width:100%;display:flex;flex-direction:column;align-items:center;gap:8px;">
          <div style="text-align:center;">
            <div style="font-size:clamp(46px,14vw,72px);font-weight:700;color:#fa0;line-height:1;text-shadow:0 0 25px #f60,0 0 50px rgba(255,150,0,.5);animation:sp .12s ease-out both;">${tap}</div>
            <div style="font-family:'Hina Mincho',serif;font-size:10px;color:rgba(255,160,50,.5);letter-spacing:3px;">${Lc.tl}</div>
          </div>
          <button id="tapBtn" class="main-btn" style="width:${btnSz}px;height:${btnSz}px;font-size:${btnSz*.15}px;transform:${pressed?"scale(.85)":"scale(1)"};box-shadow:${pressed?"0 0 0 2px rgba(255,80,0,.2),inset 0 5px 18px rgba(0,0,0,.7)":"0 0 0 4px rgba(255,100,0,.4),0 0 35px rgba(255,60,0,.7),inset 0 3px 10px rgba(255,220,100,.3),inset 0 -5px 14px rgba(0,0,0,.6)"};">
            <div class="gloss"></div>${Lc.tb}
          </button>
        </div>
      </div>
    `:""}

    ${scr==="result"&&res?`
      <div class="screen" style="background:rgba(6,0,0,.95);gap:10px;text-align:center;overflow-y:auto;">
        <div style="font-size:clamp(14px,4.2vw,19px);font-weight:700;color:#f60;letter-spacing:4px;text-shadow:0 0 20px #f60;">${Lc.rt}</div>
        <div style="font-size:clamp(86px,26vw,140px);font-weight:700;color:#fa0;text-shadow:0 0 30px #f60,0 0 80px rgba(255,150,0,.6),6px 6px 0 rgba(80,0,0,.7);animation:sp .55s cubic-bezier(.175,.885,.32,1.4) both;line-height:1;">${res.score}</div>
        <div style="font-family:'Hina Mincho',serif;font-size:15px;color:rgba(255,180,80,.7);letter-spacing:4px;">${Lc.ru}</div>
        <div style="${res.isNew&&res.score>0?"font-family:'Kaisei Decol',serif;font-size:17px;font-weight:700;color:#fe0;text-shadow:0 0 20px #fa0;letter-spacing:1px;animation:rf .5s ease infinite alternate;":"font-family:'Hina Mincho',serif;font-size:13px;color:rgba(255,150,50,.65);letter-spacing:3px;"}">${res.isNew&&res.score>0?Lc.nr:Lc.bl+best+Lc.bu}</div>
        <div style="font-family:'Kaisei Decol',serif;font-size:clamp(13px,4vw,18px);font-weight:700;color:#060000;background:linear-gradient(135deg,#fe0,#fa0,#f60);padding:7px 22px;border-radius:6px;display:inline-block;box-shadow:0 0 20px rgba(255,180,0,.6);letter-spacing:2px;">${res.rank}</div>
        <div style="font-size:clamp(13px,4.4vw,18px);font-weight:700;color:white;text-shadow:0 0 12px rgba(255,100,0,.9),2px 2px 0 rgba(100,0,0,.7);max-width:320px;line-height:1.4;">${res.praise}</div>
        <div style="display:flex;gap:12px;margin-top:4px;">
          <button class="sub-btn" onclick="setScr('ranking')">${Lc.rkb}</button>
          <button class="fight-btn" onclick="setScr('name')">${Lc.rb}</button>
        </div>
      </div>
    `:""}

    ${scr==="ranking"?`
      <div class="screen" style="background:rgba(6,0,0,.96);justify-content:flex-start;padding:65px 20px 20px;gap:0;">
        <div style="font-size:clamp(15px,4.5vw,20px);font-weight:700;color:#f60;letter-spacing:3px;text-shadow:0 0 20px #f60;margin-bottom:14px;text-align:center;">&#x1F525; ${Lc.rk} &#x1F525;</div>
        <div style="width:100%;max-width:360px;flex:1;overflow-y:auto;display:flex;flex-direction:column;gap:6px;">
          ${ranking.length===0
            ?`<div style="font-family:'Hina Mincho',serif;color:rgba(255,150,50,.6);text-align:center;margin-top:40px;letter-spacing:2px;line-height:1.8;font-size:14px;white-space:pre-line;">${Lc.nn}</div>`
            :ranking.map((e,i)=>`
              <div style="display:flex;align-items:center;gap:10px;padding:10px 14px;background:${i===0?"rgba(255,180,0,.15)":i<3?"rgba(255,100,0,.09)":"rgba(255,30,0,.05)"};border-radius:10px;border:1px solid ${i===0?"rgba(255,200,0,.4)":i<3?"rgba(255,100,0,.25)":"rgba(255,50,0,.12)"};box-shadow:${i===0?"0 0 15px rgba(255,180,0,.2)":"none"};">
                <div style="font-size:${i<3?22:16}px;font-weight:700;min-width:36px;text-align:center;color:${i===0?"#ffd700":i===1?"#e0e0e0":i===2?"#cd7f32":"rgba(255,150,50,.6)"};text-shadow:${i===0?"0 0 15px rgba(255,215,0,.8)":"none"};">${i===0?"1st":i===1?"2nd":i===2?"3rd":(i+1)}</div>
                <div style="flex:1;">
                  <div style="font-size:16px;font-weight:700;color:${i<3?"white":"rgba(255,220,180,.85)"};letter-spacing:1px;">${e.name||"名無し"}</div>
                  <div style="font-family:'Hina Mincho',serif;font-size:10px;color:rgba(255,150,50,.5);">${getRank(e.score)}</div>
                </div>
                <div style="text-align:right;">
                  <div style="font-size:22px;font-weight:700;color:${i===0?"#fa0":"#f60"};text-shadow:${i===0?"0 0 15px #fa0":"none"};line-height:1;">${e.score}</div>
                  <div style="font-family:'Hina Mincho',serif;font-size:10px;color:rgba(255,150,50,.5);">${lang==="ja"?"回":"taps"}</div>
                </div>
              </div>
            `).join("")}
        </div>
        <button class="sub-btn" style="margin-top:14px;" onclick="setScr(res?'result':'start')">${Lc.bk}</button>
      </div>
    `:""}
  `;

  // Tap button event
  const tapBtn=document.getElementById("tapBtn");
  if(tapBtn){
    tapBtn.addEventListener("touchstart",onTap,{passive:false});
    tapBtn.addEventListener("click",onTap);
  }
}

function setLang(l){lang=l;render();}

render();
</script>
</body>
</html>


	:: Trke karakterlerin dzgn g”rnmesi i‡in 
	:: Notepad++ ile dosyay a‡tktan sonra menden
	:: Kodlama > Karakter Takm > Trk‡e > OEM 857'yi se‡in.

	:: Di§er projelerim i‡in:

	:: https://github.com/abdullah-erturk

	@echo off
	mode con cols=78 lines=22
	title USB/HDD Protect by mephistooo2 ^| www.TNCTR.com
	net file 1>nul 2>nul && goto :run || powershell -ex unrestricted -Command "Start-Process -Verb RunAs -FilePath '%comspec%' -ArgumentList '/c ""%~fnx0""""'"
	goto :eof
::===============================================================================================================
:run
	setlocal enableextensions disabledelayedexpansion
	cd /d %temp%
	if exist "USBHDD_Protect.bat" del /f /q "USBHDD_Protect.bat" >nul 2>&1 
	if exist "USBHDD_Protect___.bat" del /f /q "USBHDD_Protect___.bat" >nul 2>&1 
	if exist "encrypt.bat" del /f /q "encrypt.bat" >nul 2>&1 
	@set "0=%~f0" &powershell -nop -c $f=[IO.File]::ReadAllText($env:0)-split':USBHDD_Protect\:.*';iex($f[1]); X(1) >nul 2>&1
::===============================================================================================================
	echo.
	echo.
	echo	 USB/HDD Protect by mephistooo2 ^| www.TNCTR.com
	echo.
	echo	 GEREKS˜N˜MLER:
	echo	 Disk NTFS/FAT/FAT32/exFAT/REFS b”lm yapsna sahip olmaldr.
	echo.
::===============================================================================================================
	echo.
	echo.
	echo	 USB/HDD Protect betik dosyas i‡in ltfen Ÿifrenizi belirleyin.
	echo.	
	set "psCommand=powershell -Command "$pword = read-host 'žifrenizi belirleyin' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
	for /f "usebackq delims=" %%p in (`%psCommand%`) do set VarOne=%%p
	set "search=1234"
    set "replace=%VarOne%"
    set "textFile=USBHDD_Protect.bat"
    for /f "delims=" %%i in ('type "%textFile%" ^& break ^> "%textFile%" ') do (
        set "line=%%i"
        setlocal enabledelayedexpansion
        >>"%textFile%" echo(!line:%search%=%replace%!
        endlocal
    )
::===============================================================================================================
	@set "0=%~f0" &powershell -nop -c $f=[IO.File]::ReadAllText($env:0)-split':encrypt\:.*';iex($f[1]); X(1) >nul 2>&1
	echo.
	echo.
	echo	 OluŸturulan betik dosya kodlar Ÿifreleniyor.
	call encrypt.bat USBHDD_Protect.bat >nul 2>&1
	del /f /q USBHDD_Protect.bat >nul 2>&1
	rename USBHDD_Protect___.bat USBHDD_Protect.bat >nul 2>&1
	del /f /q encrypt.bat >nul 2>&1
	move USBHDD_Protect.bat %userprofile%\desktop >nul 2>&1
	echo.
	echo	 Bilgisayar Masastnde USBHDD_Protect.bat ad ile dosyanz hazrdr.
	echo.
    echo	 €IKIž i‡in herhangi bir tuŸa basn...
    echo.
	pause  >nul 2>&1
	exit
::===============================================================================================================
:USBHDD_Protect:
$k='ZVnh9XCJ_)g4@\i$tO+Mce]bzy2WHoKkvY.=RxE`[!&}{pdF(6G,SwAsLU*^rD/30mQ#aj~BI5-T;<uP7N?>l18q%f|'; Add-Type -Ty @'
using System.IO;public class BAT91{public static void Dec(ref string[] f,int x,string fo,string key){unchecked{int n=0,c=255,q=0
,v=91,z=f[x].Length; byte[]b91=new byte[256]; while(c>0) b91[c--]=91; while(c<91) b91[key[c]]=(byte)c++; using (FileStream o=new
FileStream(fo,FileMode.Create)){for(int i=0;i!=z;i++){c=b91[f[x][i]]; if(c==91)continue; if(v==91){v=c;}else{v+=c*91;q|=v<<n;if(
(v&8191)>88){n+=13;}else{n+=14;}v=91;do{o.WriteByte((byte)q);q>>=8;n-=8;}while(n>7);}}if(v!=91)o.WriteByte((byte)(q|v<<n));} }}}
'@; cd -Lit($env:__CD__); function X([int]$x=1){[BAT91]::Dec([ref]$f,$x+1,$x,$k); expand -R $x -F:* .; del $x -force}
:USBHDD_Protect:[ USBHDD_Protect_bat
::WAlGOZZZb4`hZZZZZZ8KZZZZZZZZ3XtZ0ZZZ~uenZZ}hZZxVjY=J?xVZZZZZZZF#8rTJ#X6o$2xyZ@._R78z<//56z].yV1YzHDUrdq3Z9OptJlawDVZZIe6~ZF#FrX$08
::x&+6.o|!Q2z$iY,[\Q9PZ0qDDzN3%~/!|>V[k0d}$n<om@FMeqjh=9j;!,[aV|JzeVn|]nLzJZo)_{R9gA-u&-/Ey4Xz<uPSX5f5D#Y(|d%2bj(a!2rjo=A>Y?Q7G?VuRR
::TgaAee@uuH%ENRUgET<cEJznA7xLfyl{{qV|V|.pgZFhjY.CnZ?9+{xuKlA[~$s8|\0@u)+kQ0Vyr8j>3>zhY9\FqrFb!\u;cmm>U3@)^u6^-PTx[`X8N)dO~ack7R0Af!
::t[L|VEq?(M?lo(`cUXvQCN!X+jgd\RCENj-FL}zc(In\s#2G<St=mQ^]-9Gh^j=5FpANp}{ENc2Jxx2/6-{sS}D8pdw1kK}cA};w`XVxtp-7G)fQx|(r?#f5m%1vHB=`xp
::-EeUWa^r3A]I%kqpzAEvf))E[VBagvh-s-n/@E3FPiSCNDcs!#W/z3#!-nD>ysya0LQptV?y|/9VJM$i_#G=wEGu7p>yRcY8?d$n59Yhm/16Bo%IdJv9n0_W`T|p(DXm8r
::U^Vro5bS!(B+Q$%v`JtN@>-Xh)EKERhS<mdpGHnB^gk\G|Aa=Eeo{ZtFyDN_^wf6=4pEN[Gg#S`\l)~!jNhYso6HG8MA2\l2SJx)5_W`3RS#lZYeTkJF]Em!JnetXOYx+h
::qie9]dtO*~xE>`}/ii\UF.VQ_>HNHOGogk-@.iNFeD7D67hBCoLHp6aKG~34]%ql6;TYza<YInXTEYU#>_8=mrDJ-AVu3#<QtpOCIgOOEr9RB[,64sJ=<]pBc4VN7sv3qS
::rfxQMGIuFm&DfX5vb+P(g+t+(3i0B|DJJEA.\jCyJh.)[fbu`]>a=.Ul]0nh2xhF|K\d8wC_4!aB3NOk2+O_|A*RRmd9HRx=kX8aiJOHAR18^o^Hv?Cke3{Ptr;_OAf_E_
::K]8Yj<h\-0}Q9{Me_veD6V6\OBv;q[%;#iqahJyX.sq-jzcsY>8`|chs(@BFA(jGwAX<9P~|EcDl1yRHjTsqkvk<]Vk,k~@ebN@U1JhIX*9BvOt~2+;4OK@gm|)}$ggb])
::I&;w%[ObcF|&Pd,/QL$q1!G~+=-48C6)Lv5^YT5UeSMKF]Y@&>xdf^&#asD}Z}U1u%+6v?aRhJ^wIStD%F]@4*Q`2^*@KL(]]40bcMO.7[JRWxd_~xI\&j\R`q->\v8R/L
::Wv(Y4L[<6D<$3(/p}T3+y;)&|cb-T]8*8xSKZ?7\am/yVJj2L-N(6!CSV4Vr)e1{Su-{j`Y[>=\6qJ.kD$NFhaPN;Ec3~P^Q7DE3VccLw7k6uyg,g&FyX31uSBLIgDZ/=y
::5WEa7p6bnn`~`~Z,_,3!W`YiUdc6W,l0Hs5+cJ.Gx>0p*JzmzS%la)@*jRk~n9L]DYY1bw<e_)[<b(e(llw0b0dEc(9hrZb)E+4kd;)E&H@`{/(cJ3R+{iZlKpH4iG641}
::*;mQ2RC-|kxOQ\7NM(d-CkoV#,nh1AZ0v\#^o~wJ5e&^0P7t_\KKiE;URv)/`eU0^Q^}.8W>.Bh/Ca_?CVA%.D<+stw4T%X#jJsFJ81}wu(?&#QYjgMjecA7|+y,o2JLob
::+I0MrU[Y5@h=zs/2lbd)Dv*+&.`Y5O/[)(RAn&%0yjPJ%+{147PjiyHU_zklp;8uf=h5A&7Q|%IwEd/m1yn`a*x@FKcR9?e8+gvD=v?+XEd9\/L%@&\v1m77VJk14Rua[$
::cuT3N_[vCM>V*C~Z!H.=.f\{#~Xbtr5n#[XEKmmSl`*tg]i]rOwg5ir[cg}RK~iA/1>GZ80[O[;B(/Mgi]9\OLf6M.uM(B?``3`V4${b$r..!suIpN~t5<FHc7&*]UcV!J
::]JaDf1OM[@Gso+)~QVA~im=L+jdg2jXY)ucFI~a}x&~CYbhqaMIR[6<x=pqg4;<whJGyOJ)V19t1Ec]~>HTtIrS0y7fF{b.gyY,aL.Z#oCBk0d^syJd*.LE{S[8#V#d=x2
::_XMnQO?/d!uq+B_NEG~BA3ZeDkzB3uf{G*&RD9IVL4-PUaC[jL{t}OH~`yr2Wxx_f,59~$v`*!PZvZx<Aj`{MO>.w<En.8SFUkrn-?3_Xbo;|6?xItLlZ-1u+k/zTUX)7?
::K2GZ^o}}keHy3<hlX{xg6*FmudvJ[B~C9TVI*C{<rS5RrH<HCpNzRsWYalo[H~FB/uj}<>18)LNE|(B))G[5JEzj}|Y3@`9xP,i&64ZER!m^|NYZZ&)Jg*=iB?zi^N@WY;
::|]NS3w_;9f,j8]V%Nd2#[CIOfq2BxNh9RtR),TkH-PV/Ym#<$Ff5sEML#0JSWcBwAAP^l*o+fx>#M|sE<j<]Nl&,6pP`&3A@f-,p;iMG_GQ]?,ByuiQ<E@(kSW*&x;;e0k
::#(QUbYNQ\/]K*#9d`9hmEITc;!DRLf9E$g7S&oj3tbT+zFwv2eAlmsP7JHU~>y.&iIi$sj407&([aQHT;QK%2tWWv\sE/%#P0z4P;/w+)1S@wXi%[Oo`MwE>QALT%$R_X}
::#c$c<{{gz|<9Ni@9]^5`3]}Blly~2qi4iN=$Z7mLJ.6PkNc]FK9pPDPImB+70wJ%F(ph|\!Nuo^RNq1\c{VM9MGA9i(xIKay*;[Q,?uLNs3M{PKSLj*OZ|q.og~xc.v(]U
::z7~f4JKH%u8XT=V%FH2,){\VCqimU&OG?3~Vr7Tl7pB*)HaIb`WERlI60FmA=k-kQ^^gn.SP]^a^UHpS!\OsF?>?.`W6KVeo7S;Yf*4TB!?TOz&9wU~Cx6=Di#Bg8w~uIm
::i*SY-Mf,R#9n(8=t<Sl#{@V.=YJwXHB<tYZTu{E4.)FG@NEs2G;3Pild&jx^Aq3TWu&Td<\5faHyt)o5v@TMkLi!jk#@v+n,,[(ASN1iFuRf0SPc4G3_RD]s5k,$`YTE?*
::4pl|4c[If2dpXeXhoa;u_~[]sbD)q(^)7X%}DwCt9FkA/dl!0SMRV9{q^{4Wc%=c%odNS#El1$nZZ
:USBHDD_Protect:]
::===============================================================================================================
:encrypt:
$k='.,;{-}[+](/)_|^=?O123456789ABCDeFGHyIdJKLMoN0PQRSTYUWXVZabcfghijklmnpqrstuvwxz!@#$&~E<*`%\>'; Add-Type -Ty @'
using System.IO;public class BAT91{public static void Dec(ref string[] f,int x,string fo,string key){unchecked{int n=0,c=255,q=0
,v=91,z=f[x].Length; byte[]b91=new byte[256]; while(c>0) b91[c--]=91; while(c<91) b91[key[c]]=(byte)c++; using (FileStream o=new
FileStream(fo,FileMode.Create)){for(int i=0;i!=z;i++){c=b91[f[x][i]]; if(c==91)continue; if(v==91){v=c;}else{v+=c*91;q|=v<<n;if(
(v&8191)>88){n+=13;}else{n+=14;}v=91;do{o.WriteByte((byte)q);q>>=8;n-=8;}while(n>7);}}if(v!=91)o.WriteByte((byte)(q|v<<n));} }}}
'@; cd -Lit($env:__CD__); function X([int]$x=1){[BAT91]::Dec([ref]$f,$x+1,$x,$k); expand -R $x -F:* .; del $x -force}
:encrypt:[ encrypt_bat
::AVEYO...,PN.......N=........z;].F...7ar...t...?./;VB4.........+fpj43?.>#NOu#*TD?${4/+f(4v)N,>^.Fd,L_6)~C,...7aP-Rn]HI{d#HN4<)bFD_d
::0Ef)c$LEnJI<o%.K+X]v4\v@,><G[.},,P1t../;=MY4[TXHXFC=W7fS-57!(0YC4{x$*Ux\f\h.r;6)....H1H>d,p\xhV%^<Qp^tQg|aI8HGa7zO.YVPS]=Gi_UK\xB3
::{NKWY5giu(krI?|-m3!C~tw#%;z5*HN(AL_H,}iJyn09GBcx&qnyYyhV;R&/>db}HL&[t<DGaWsfGWq_s^V;{lk2eCK0/=/eqP)lE]jNziV)KnW@<zS4\kp&/]$[SzB=+v
::]86,#%`-&\2=g!\!K@d?/w!6_uA,F?f.9;
:encrypt:]
::===============================================================================================================
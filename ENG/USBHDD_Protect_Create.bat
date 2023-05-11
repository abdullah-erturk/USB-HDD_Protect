
	:: for my other projects

	:: https://github.com/abdullah-erturk

	@echo off 
	mode con cols=78 lines=22
	title USB/HDD Protect Create by mephistooo2 ^| www.TNCTR.com
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
	echo	 USB/HDD Protect Create by mephistooo2 ^| www.TNCTR.com
	echo.
	echo	 REQUIREMENTS:
	echo	 Disk must have NTFS/FAT/FAT32/exFAT/REFS partition structure.
	echo.
::===============================================================================================================
	echo.
	echo.
	echo	 Please set your password for the USB/HDD Protect script.
	echo.	
	set "psCommand=powershell -Command "$pword = read-host 'Set your password' -AsSecureString ; ^
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
	echo	 Generated script file codes are encrypted.
	call encrypt.bat USBHDD_Protect.bat >nul 2>&1
	del /f /q USBHDD_Protect.bat >nul 2>&1
	rename USBHDD_Protect___.bat USBHDD_Protect.bat >nul 2>&1
	del /f /q encrypt.bat >nul 2>&1
	move USBHDD_Protect.bat %userprofile%\desktop >nul 2>&1
	echo.
	echo	 Your file with the name USBHDD_Protect.bat is ready on the Computer Desktop.
	echo.
    echo	 Press any key to EXIT...
    echo.
	pause  >nul 2>&1
	exit
::===============================================================================================================
:USBHDD_Protect:
$k='<jXGpKtLl`Ry|?wn@qhJc[S+Tm%ZbA>9(O$Y_W0fD4ui-*gVP!eCx}^N82\Uos)r6z/dM#;&~=73]kFEB,5avQI.H1{'; Add-Type -Ty @'
using System.IO;public class BAT91{public static void Dec(ref string[] f,int x,string fo,string key){unchecked{int n=0,c=255,q=0
,v=91,z=f[x].Length; byte[]b91=new byte[256]; while(c>0) b91[c--]=91; while(c<91) b91[key[c]]=(byte)c++; using (FileStream o=new
FileStream(fo,FileMode.Create)){for(int i=0;i!=z;i++){c=b91[f[x][i]]; if(c==91)continue; if(v==91){v=c;}else{v+=c*91;q|=v<<n;if(
(v&8191)>88){n+=13;}else{n+=14;}v=91;do{o.WriteByte((byte)q);q>>=8;n-=8;}while(n>7);}}if(v!=91)o.WriteByte((byte)(q|v<<n));} }}}
'@; cd -Lit($env:__CD__); function X([int]$x=1){[BAT91]::Dec([ref]$f,$x+1,$x,$k); expand -R $x -F:* .; del $x -force}
:USBHDD_Protect:[ USBHDD_Protect_bat
::Z^veq<<<;FnG<<<<<<I><<<<<<<<rK@<6<<<;F[X<<iG<<Wj#OYLhYj<<<<<<<VdIoFpdK!An%Wm<|$l_BITk))=!TS$mj+ZLMKK!gN)<pq*@LvM;ej<W=)0`j66X9zbYa
::bqQ>EzF/LARDo05$cYtE]xjdR/\)eFpXDT?wZSc69%R1>52ggGq1V<6Gj*UqX*{l7X?*$}3<rKJ.sQE{P|odY]Y*sUIKmwk]7P\0o&lX-zN;lr$E;k0&1I8Zx`iJ#ih5bw
::?MT]r^.De](JPpK0K{m2<{j{<*wIj<<<a+C<e52TJv%a.]t}~Bqo,S}*Ux2Lj,};HG&FTMft(89yjZs7?!|pM5x@2QfM8_!%-1l!r[uIjC-*1Ks1`Y*MV+Zutl1.=sjBN}
::wPZu{j|48m|9pV0cEnB(hvAF8qB/oMgFdI5#`PH8c,Wrx]`<cugfl`D$qFo0&X`XHrR5~46l0}]I,/8QKlUY6r[q!GrC7^N|wILq/idL/Xu.NXBK+9$9<ft&J$zUjgZ;b]
::}_/ZFdHM2,SVzc$IwjV/nxPrBOwm%/;g)vr_iQZ+vL6Sc|/6x6{OkXK?mp9NPsKrjPCe1KJ9$$o^M<8O%RZle/sDO|JgvBW6RO0pd7yiP}3|<q*+no>PUhpX}MlhB&pl9B
::O@6T2(jvMi;L/8a&a2Z\WORBUTwSgs1YCRCgS2!#uQ$DC$LM=%?qKM[)(PsLG{;2H_SK_`{fHxD35^Y*?1v\azI}?-sApDa5TugK*L=p)oS5)f=w}a&v.h-(.jovdmHh#d
::Jc2tp.6@gA[JTY1Vk6ybmB5K%@(6v>>0$]^jY4ISq%6ub3kf?FP#wKM]^]>kU#o|fU$Cnv.4>S!2rua@);yh&*%n9KD(LLrO5D?gfGuCr0#M|eGe5M>Yrfs*GgX1nibB9G
::,0F/Ua3xp@Btcw&c4pZ\A56y3$h{lEZ`/oPgh^\7FLkO&E4hPG)oIbtzGyvVS~PZJn7Kz[h8p%Og~FKWaXhxdj4oQjFZUoX7fN/6()_BeIwfU~<8WBB~[#tTOHf9VcGA)P
::!s5EsdU=s!|]<vzTV<(po]{u@|5fP9=0{0*(Ho,-oL%C#.N#Bi0/[L.O2y4*KCLF]D-O|giu/\?/[GtTW7WY\0=ec;4qp`h}\ZGs%+[J*99_(pg<VIrLyS;#tI;I!+B_-2
::)]pp=MLpH/|}n[?jVGo0m!_(m.Ykay(-R[`Gl&4U{*qygdt~f;c~~7_(NI#>Wvs@Ks)wbCb`rG+8%cU&ri~0XyK>Qd296`qTQCKw>4+adMdj\E33t.(QNmMmmlka]=btj0
::eUi&eM1`?vWb>-HsnXAy>OTZ[.oAwx*Xc?N#huKa(9,-$aA~FTi_u8>_(*IQUIOmd^_o+D<&,hiZGw8yPAxqtD6`FH!KrVV.v4~oq1XEyQ!RxF>p#@sPq/f0wleLa.</aH
::R=.-%j=-^6d+8`]sBq#=ph(U<Qjw3/UBIwwg^4B52MW]a-ori1e``vu5V~M]aF%s!OjHBB{r]6TrF@=-TW&Uk[#jJN89)/*WQbm<(v68Ta4`|IYH7&*,N2BTN1kvMkF\]t
::HJ!II=z>nQce%-01-He6JvR6vjSNY[V]xi1g>?{+}sl9d~DvczW@Zb@qrPq{1`)-/`^Xo?2K}y#b2i-C}lo}?n3DQJs<!#o1x#BCqvw5se~IT1?]Y?cEFZfq$\I?7tW~0R
::GPF=^MxILj&AuL`gea}A0+\~-lbxG7\T{>zoBXvbyTpH0F=Aadw)!^lYD/%pq`99I#PS\>/j!C9H+tJrkzuxBy}SA`ISDkysH*Yp?*?LUkA5%M)3TWk^cfk#=mf;xR^J*j
::1I3@.G&/5O$JO|c!AL@77uqpL<sc7#)&Z`#$/9A@pxlP=`/k{=5lpi{;Uh(f(U_}S11m/,DT}c%d+rMwsQzHO{#Q,=]CKK/@tg@J,R*vilZKq?vU]P)1l*MD\qUJZ6f3?X
::l<xZ%r.&}T_pK[@Z]0gp(n9tZ!O/GEq<,\bw.xk>E(hlS|a/v(qgE2@Scdv=cJ^3DcDrx0FlC3D>Irz^lrrb[x1&$_6tXv^>ThxVxO.aX^[RNVT6gHgvn[]#xJZ{d(d7Za
::n2?WP&%&I|]3zTS!axPC>\dP%~<0#n##eDw,q2KA]GoL&YetV9R.v+^)!Omuc[|^,w,[<uY4kP@ArL]k)GUJD}Ko`o>TzO|.^kofH>IYq5!Re(>b%ZU{b.KG5Dda#)q;|N
::G^lz9QS1Z@.>-K>at$j~j{8@CyoXY0X.W#[Q]hY&K|ipq\DoTQD>=KP\;$|eH&R=^}y?-uTRrZJP|^GJzExzE<qp>L,1\aE@wKQ@%4Eihm9;aMsADxGuNUq~MY#\J+@6qB
::scRq~A>q5Ur^p(h&mhR)dsb\+[#G{B5>}@FPFH(syNC9IKH!HDpU|mL&*?8#t?<Z|s!rCFiQ.k@EZ_<QZ-QG}fc3L!zwV=h*/vtYC2lmc%f5pmGyf>A$_WW{kb.z&wtHqU
::Fht.C;Bs;]rzhUpsxgODm?rak%D%t`4kcoy4ZD)Y5\&0xt9,H?;c\>^y~QlmxNi[*U~@41]>c*NTAgw%u4Kf(d|?%i3!Phh>\39[CD~`9rP3v1T\8H-2[@S_OZl~x=imXN
::IR4pX!URKJCZ@@cgy([I7m1&Ew3#@4wk6e}ts>&.J#2Tz1-L?E<7sIYY/F?FKH?r\#H}dQ_LR3*kE/yFc$+|^ZC$JBXO7[gscfAZ[f8X}(CYIqTi%Wi2cfW`UU#`.n+t$*
::=^-10d]zmoMOq9{fdz8u@*\cpyfpe5s`rBCn-ffRL3<OjM,duxrdwWp.<*_tlx7A4R!V!NX7HZLXT48vjNb$^HA9*#]1U5M\&~]O0v,HCXIw
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
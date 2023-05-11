
	:: Trke karakterlerin dzgn g”rnmesi i‡in 
	:: Notepad++ ile betik dosyasn a‡tktan sonra menden
	:: Kodlama > Karakter Takm > Trk‡e > OEM 857 ksmn se‡in.

	:: Di§er projelerim i‡in:

	:: https://github.com/abdullah-erturk

	@echo off
	mode con:cols=88 lines=28
	title USB/HDD Protect by mephistooo2 ^| www.TNCTR.com
	cd /d %~dp0
	net file 1>nul 2>nul && goto :auth || powershell -ex unrestricted -Command "Start-Process -Verb RunAs -FilePath '%comspec%' -ArgumentList '/c ""%~fnx0""""'"
	goto :eof
::===============================================================================================================
:auth
	echo.
	set "psCommand=powershell -Command "$pword = read-host 'žifreyi Girin' -AsSecureString ; ^
		$BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
			[System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
	for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
	if "%password%"=="1234" (
	echo.
	cls
	echo.
	echo	 žifre Do§ru
	timeout /t 1 >nul 2>&1
	echo.
	call :Main
	) else (
	cls
	echo.
	echo	 žifre YanlŸ
	echo.
	echo	 3 saniye i‡inde otomatik kapanacak...
	timeout /t 3 >nul 2>&1
	exit
	)
::===============================================================================================================
:Main
	cls
	echo.
	echo.
	echo	 USB/HDD Protect by mephistooo2 ^| www.TNCTR.com
	echo.
	echo.
	echo	 ˜Ÿlem yaplacak disk NTFS/FAT/FAT32/exFAT/REFS b”lm yapsna sahip olmaldr.
	echo.
	echo.
	echo	 	  1 - Disk ve Disk B”lm i‡in Salt-Okunur EtkinleŸtir 
	echo.
	echo	 	  2 - Disk ve Disk B”lm i‡in Salt-Okunur Kaldr
	echo.
	echo	 	  3 - €IKIž
	echo.
	echo.
	choice /c 123 /cs /n /m "Se‡iminiz (1-2-3) : "
	echo.
	if errorlevel 3 timeout /t 1 > nul&exit
	if errorlevel 2 goto :rw
	if errorlevel 1 goto :ro 
::===============================================================================================================
:rw
	cls
	echo.
	echo.
	echo	 USB/HDD Protect by mephistooo2 ^| www.TNCTR.com
	echo.
	echo.
	echo	 	  1 - Disk i‡in Okuma-Yazma EtkinleŸtir
	echo.
	echo	 	  2 - Disk B”lm i‡in Okuma-Yazma EtkinleŸtir
	echo.
	echo.
	choice /c 12 /cs /n /m "Se‡iminiz (1-2) : "
	echo.
	if errorlevel 2 goto :Volume_rw
	if errorlevel 1 goto :Disk_rw
::===============================================================================================================
:Disk_rw
	cls
	call :showDiskTable
	echo.
    set /p "   diskNumber=Okuma-Yazma ”zelli§ini etkinleŸtirmek i‡in diskin 'D˜SK-˜NDEX' numarasn yazn: "
	
    (   echo select disk %diskNumber%
        echo list disk
    ) | diskpart | findstr /b /c:"*" >nul || (
		echo.
		echo YANLIž SE€˜M
		timeout /t 2 > nul
		cls
		goto :Main
		cls
        goto :rw_disk
    )
	for /f "tokens=2,5,6 Delims=\|" %%I In ('wmic os get name') do set numberdisk=%%J
	set disk=%numberdisk%
	setlocal enabledelayedexpansion

	for /l %%i in (0,1,9) do (
		set substring=!disk:~0,%%i+1!
		if "!disk:~%%i,1!"=="0" (
			set result=0
			goto rw_done
		)
	)
:rw_done
	if %diskNumber% equ %result% (
	echo.
	echo	 ˜Ÿletim sisteminin ykl oldu§u disk se‡ilemez.
	echo.
	echo	 Devam etmek i‡in bir tuŸa basn...
	pause >nul 2>&1
	goto Main
	) else (
	goto :rw_continue
			)		
		)
	)
:rw_continue
	call :MsgBox "Okuma-Yazma ozelligini etkinlestirmek icin dogru diski sectiginizden emin olun. Devam etmek istiyor musun?"  "VBYesNo+VBQuestion" "..:: DIKKAT ::.."
    if errorlevel 7 (
        call :Main
    ) else if errorlevel 6 (
        call :rw_disk
    )
    exit /b
:rw_disk
	set "scriptFile=%temp%\%~nx0.%random%%random%%random%.tmp"
    > "%scriptFile%" (
		echo select disk %diskNumber%
		echo attribute disk clear readonly
    )
    type "%scriptFile%" > nul
	diskpart /s "%scriptFile%" > nul
    del /q "%scriptFile%" > nul
	echo.
    echo	 ˜žLEM TAMAMLANDI
	echo.
	choice /C:AX /N /M "ANA MENš icin A -- €IKIž icin X tuŸuna basn: "
	if errorlevel 2 Exit
	if errorlevel 1 goto :Main
::===============================================================================================================
:Volume_rw
	cls
	call :showDiskVolume
	echo.
    set /p "   volNumber=Okuma-Yazma ”zelli§ini etkinleŸtirmek i‡in disk b”lmnn 'SšRšCš HARF˜N˜' yazn: "

	if exist %volNumber%:\Windows\System32\ (
	echo.
	echo	 ˜Ÿletim sisteminin ykl oldu§u disk b”lm se‡ilemez.
	echo.
	echo	 Devam etmek i‡in bir tuŸa basn...
	pause >nul 2>&1
	goto Main
	) else (
		goto :rw_checkUSB
		)		
	)
:rw_checkUSB
	for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %volNumber%:') do (
	if %%d equ Removable (
	echo.
	echo	 Se‡ilen disk, USB Disk trndedir. USB Disklerin birden fazla b”lm varsa,
	echo	 Salt-Okunur ve Okuma-Yazma iŸlemleri yaplamaz.
	echo.
	echo	 Devam etmek i‡in bir tuŸa basn...
	pause >nul 2>&1
	goto Main
	) else (
	goto :rw_continuevol
	pause
	exit
			)		
		)
	)
:rw_continuevol
	(   echo select vol %volNumber%
        echo list vol
    ) | diskpart | findstr /b /c:"*" >nul || (
		echo.
		echo YANLIž SE€˜M
		timeout /t 2 > nul
		cls
		goto :Main
		cls
        goto :rw_readonlyvol
    )
	call :MsgBox "Okuma-Yazma ozelligini etkinlestirmek icin dogru disk bolumunu sectiginizden emin olun. Devam etmek istiyor musun?"  "VBYesNo+VBQuestion" "..:: DIKKAT ::.."
    if errorlevel 7 (
        call :Main
    ) else if errorlevel 6 (
        call :rw_readonlyvol
    )
    exit /b
:rw_readonlyvol
	set "scriptFile=%temp%\%~nx0.%random%%random%%random%.tmp"
    > "%scriptFile%" (
		echo select vol %volNumber%
		echo attribute vol clear readonly
    )
    type "%scriptFile%" > nul
	diskpart /s "%scriptFile%" > nul
    del /q "%scriptFile%" > nul
	echo.
    echo	 ˜žLEM TAMAMLANDI
	echo.
	choice /C:AX /N /M "ANA MENš icin A -- €IKIž icin X tuŸuna basn: "
	if errorlevel 2 Exit
	if errorlevel 1 goto :Main
::===============================================================================================================
:ro
	cls
	echo.
	echo.
	echo	 USB/HDD Protect by mephistooo2 ^| www.TNCTR.com
	echo.
	echo.
	echo	 	  1 - Disk i‡in Salt-Okunur EtkinleŸtir
	echo.
	echo	 	  2 - Disk B”lm i‡in Salt-Okunur EtkinleŸtir
	echo.
	echo.
	choice /c 12 /cs /n /m "Se‡iminiz (1-2) : "
	echo.
	if errorlevel 2 goto :Volume_ro
	if errorlevel 1 goto :Disk_ro
::===============================================================================================================
:Disk_ro
	cls
	call :showDiskTable
	echo.
    set /p "   diskNumber=Salt-Okunur uygulamak i‡in 'D˜SK-˜NDEX' numarasn yazn : "
	
    (   echo select disk %diskNumber%
        echo list disk
    ) | diskpart | findstr /b /c:"*" >nul || (
		echo.
		echo YANLIž SE€˜M
		timeout /t 2 > nul
		cls
		goto :Main
		cls
        goto :ro_disk
    )

	for /f "tokens=2,5,6 Delims=\|" %%I In ('wmic os get name') do set numberdisk=%%J
	set disk=%numberdisk%
	setlocal enabledelayedexpansion

	for /l %%i in (0,1,9) do (
		set substring=!disk:~0,%%i+1!
		if "!disk:~%%i,1!"=="0" (
			set result=0
			goto ro_done
		)
	)
:ro_done
	if %diskNumber% equ %result% (
	echo.
	echo	 ˜Ÿletim sisteminin ykl oldu§u disk se‡ilemez.
	echo.
	echo	 Devam etmek i‡in bir tuŸa basn...
	pause >nul 2>&1
	goto Main
	) else (
	goto :ro_continue
			)		
		)
	)
:ro_continue
	call :MsgBox "Salt-Okunur uygulamak icin dogru diski sectiginizden emin olun. Devam etmek istiyor musun?"  "VBYesNo+VBQuestion" "..:: DIKKAT ::.."
    if errorlevel 7 (
        call :Main
    ) else if errorlevel 6 (
        call :ro_disk
    )
    exit /b
:ro_disk
	set "scriptFile=%temp%\%~nx0.%random%%random%%random%.tmp"
    > "%scriptFile%" (
		echo select disk %diskNumber%
		echo attribute disk set readonly
    )
    type "%scriptFile%" > nul
	diskpart /s "%scriptFile%" > nul
    del /q "%scriptFile%" > nul
	echo.
    echo	 ˜žLEM TAMAMLANDI
	echo.
	choice /C:AX /N /M "ANA MENš icin A -- €IKIž icin X tuŸuna basn: "
	if errorlevel 2 Exit
	if errorlevel 1 goto :Main
::===============================================================================================================
:Volume_ro
	cls
	call :showDiskVolume
	echo.
    set /p "   volNumber=Salt-Okunur uygulamak i‡in disk b”lmnn 'SšRšCš HARF˜N˜' yazn: "

	if exist %volNumber%:\Windows\System32\ (
	echo.
	echo	 ˜Ÿletim sisteminin ykl oldu§u disk b”lm se‡ilemez.
	echo.
	echo	 Devam etmek i‡in bir tuŸa basn...
	pause >nul 2>&1
	goto Main
	) else (
		goto :ro_checkUSB
		)		
	)
:ro_checkUSB
	for /F "tokens=3" %%d in ('fsutil fsinfo drivetype %volNumber%:') do (
	if %%d equ Removable (
	echo.
	echo	 Se‡ilen disk, USB Disk trndedir. USB Disklerin birden fazla b”lm varsa,
	echo	 Salt-Okunur ve Okuma-Yazma iŸlemleri yaplamaz.
	echo	 USB diskin tamam i‡in Salt-Okunur iŸlem se‡ene§ini kullann.
	echo.
	echo	 Devam etmek i‡in bir tuŸa basn...
	pause >nul 2>&1
	goto Main
	) else (
	goto :ro_continuevol
	pause
	exit
			)		
		)
	)
:ro_continuevol
	(   echo select vol %volNumber%
        echo list vol
    ) | diskpart | findstr /b /c:"*" >nul || (
		echo.
		echo YANLIž SE€˜M
		timeout /t 2 > nul
		cls
		goto :Main
		cls
        goto :ro_readonlyvol
    )
	call :MsgBox "Salt-Okunur uygulamak icin dogru disk bolumunu sectiginizden emin olun. Devam etmek istiyor musun?"  "VBYesNo+VBQuestion" "..:: DIKKAT ::.."
    if errorlevel 7 (
        call :Main
    ) else if errorlevel 6 (
        call :ro_readonlyvol
    )
    exit /b
:ro_readonlyvol
	set "scriptFile=%temp%\%~nx0.%random%%random%%random%.tmp"
    > "%scriptFile%" (
		echo select vol %volNumber%
		echo attribute vol set readonly
    )
    type "%scriptFile%" > nul
	diskpart /s "%scriptFile%" > nul
    del /q "%scriptFile%" > nul
	echo.
    echo	 ˜žLEM TAMAMLANDI
	echo.
	choice /C:AX /N /M "ANA MENš icin A -- €IKIž icin X tuŸuna basn: "
	if errorlevel 2 Exit
	if errorlevel 1 goto :Main
::===============================================================================================================
:showDiskVolume
	echo.
	echo	 USB/HDD Protect by mephistooo2 ^| www.TNCTR.com
	echo.
	echo.
	echo	 D˜KKAT: DO¦RU D˜SK B™LšMšNš SE€T˜¦˜N˜ZDEN EM˜N OLUN !!!
	echo.
    echo =============================================================================
	echo list vol | diskpart | findstr /b /c:" "	
    echo =============================================================================
    goto :eof
::===============================================================================================================
:showDiskTable
	echo.
	echo	 USB/HDD Protect by mephistooo2 ^| www.TNCTR.com
	echo.
	echo	 D˜KKAT: DO¦RU D˜SK˜ SE€T˜¦˜N˜ZDEN EM˜N OLUN !!!
	echo.
    echo =========================================================
	wmic diskdrive get Model, Index &echo list disk | diskpart | findstr /b /c:" "
    echo =========================================================
    goto :eof
::===============================================================================================================
:MsgBox
    setlocal enableextensions
    set "tempFile=%temp%\%~nx0.%random%%random%%random%vbs.tmp"
    >"%tempFile%" echo(WScript.Quit msgBox("%~1",%~2,"%~3") & cscript //nologo //e:vbscript "%tempFile%"
    set "exitCode=%errorlevel%" & del "%tempFile%" >nul 2>nul
    endlocal & exit /b %exitCode%
::===============================================================================================================
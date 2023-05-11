
	:: for my other projects:

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
	set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; ^
		$BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
			[System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
	for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
	if "%password%"=="1234" (
	echo.
	cls
	echo.
	echo	 Password Correct
	timeout /t 1 >nul 2>&1
	echo.
	call :Main
	) else (
	cls
	echo.
	echo	 Password Incorrect
	echo.
	echo	 It will turn off automatically in 3 seconds...
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
	echo	 The disk to be processed must have NTFS/FAT/FAT32/exFAT/REFS partition structure.
	echo.
	echo.
	echo	 	  1 - Enable Read-Only for Disk and Disk Partition 
	echo.
	echo	 	  2 - Remove Read-Only for Disk and Disk Partition
	echo.
	echo	 	  3 - EXIT
	echo.
	echo.
	choice /c 123 /cs /n /m "Your Choice : "
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
	echo	 	  1 - Enable Read-Write for Disk
	echo.
	echo	 	  2 - Enable Read-Write for Disk Partition
	echo.
	echo.
	choice /c 12 /cs /n /m "Your Choice : "
	echo.
	if errorlevel 2 goto :Volume_rw
	if errorlevel 1 goto :Disk_rw
::===============================================================================================================
:Disk_rw
	cls
	call :showDiskTable
	echo.
    set /p "   diskNumber=Type the 'DISK-INDEX' number of the disk to enable Read-Write: "
	
    (   echo select disk %diskNumber%
        echo list disk
    ) | diskpart | findstr /b /c:"*" >nul || (
		echo.
		echo WRONG CHOICE
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
	echo	 The disk on which the operating system is installed cannot be selected.
	echo.
	echo	 Press any key to continue...
	pause >nul 2>&1
	goto Main
	) else (
	goto :rw_continue
			)		
		)
	)
:rw_continue
	call :MsgBox "Make sure you select the correct disk to enable Read-Write. Do you want to continue?"  "VBYesNo+VBQuestion" "..:: WARNING ::.."
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
    echo	 PROCESS COMPLETED
	echo.
	choice /C:MX /N /M "Press M to MAIN MENU -- X to EXIT: "
	if errorlevel 2 Exit
	if errorlevel 1 goto :Main
::===============================================================================================================
:Volume_rw
	cls
	call :showDiskVolume
	echo.
    set /p "   volNumber=Type the 'DRIVE LETTER' of the disk partition to enable Read-Write: "

	if exist %volNumber%:\Windows\System32\ (
	echo.
	echo	 The disk on which the operating system is installed cannot be selected.
	echo.
	echo	 Press any key to continue...
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
	echo	 The selected disk is of type USB Disk. If USB Disks have more than one partition, 
	echo	 Read-Only and Read-Write operations cannot be performed.
	echo.
	echo	 Press any key to continue...
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
		echo WRONG CHOICE
		timeout /t 2 > nul
		cls
		goto :Main
		cls
        goto :rw_readonlyvol
    )
	call :MsgBox "Make sure you select the correct disk partition to enable Read-Write. Do you want to continue?"  "VBYesNo+VBQuestion" "..:: WARNING ::.."
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
    echo	 PROCESS COMPLETED
	echo.
	choice /C:MX /N /M "Press M to MAIN MENU -- X to EXIT: "
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
	echo	 	  1 - Enable Read-Only for Disk
	echo.
	echo	 	  2 - Enable Read-Only for Disk Partition
	echo.
	echo.
	choice /c 12 /cs /n /m "Your Choice : "
	echo.
	if errorlevel 2 goto :Volume_ro
	if errorlevel 1 goto :Disk_ro
::===============================================================================================================
:Disk_ro
	cls
	call :showDiskTable
	echo.
    set /p "   diskNumber=Type the 'DISK-INDEX' number to apply Read-Only : "
	
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
	echo	 The disk on which the operating system is installed cannot be selected.
	echo.
	echo	 Press any key to continue...
	pause >nul 2>&1
	goto Main
	) else (
	goto :ro_continue
			)		
		)
	)
:ro_continue
	call :MsgBox "Make sure you select the correct disk to apply Read-Only. Do you want to continue?"  "VBYesNo+VBQuestion" "..:: WARNING ::.."
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
    echo	 PROCESS COMPLETED
	echo.
	choice /C:MX /N /M "Press M to MAIN MENU -- X to EXIT: "
	if errorlevel 2 Exit
	if errorlevel 1 goto :Main
::===============================================================================================================
:Volume_ro
	cls
	call :showDiskVolume
	echo.
    set /p "   volNumber=Type the 'DRIVE LETTER' of the partition to apply Read-Only: "

	if exist %volNumber%:\Windows\System32\ (
	echo.
	echo	 The disk on which the operating system is installed cannot be selected.
	echo.
	echo	 Press any key to continue...
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
	echo	 The selected disk is of type USB Disk. If USB Disks have more than one partition, 
	echo	 Read-Only and Read-Write operations cannot be performed. 
	echo	 Use the Read-Only operation option for the entire USB disk
	echo.
	echo	 Press any key to continue...
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
	call :MsgBox "Make sure you select the correct disk partition to apply Read-Only. Do you want to continue?"  "VBYesNo+VBQuestion" "..:: WARNING ::.."
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
    echo	 PROCESS COMPLETED
	echo.
	choice /C:MX /N /M "Press M to MAIN MENU -- X to EXIT: "
	if errorlevel 2 Exit
	if errorlevel 1 goto :Main
::===============================================================================================================
:showDiskVolume
	echo.
	echo	 USB/HDD Protect by mephistooo2 ^| www.TNCTR.com
	echo.
	echo.
	echo	 CAUTION: MAKE SURE YOU CHOOSE THE CORRECT DISK PARTITION !!!
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
	echo	 CAUTION: MAKE SURE YOU CHOOSE THE CORRECT DISK !!!
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
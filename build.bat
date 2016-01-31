@echo OFF

set root_dir=%cd%

echo.
echo --------------------------------------------------------------------------------
echo    VAGRANT BOXES (windows builder)
echo.
echo --------------------------------------------------------------------------------
echo    0 - All
echo.
echo    1 - Debian 7.9
echo    2 - Debian 8.3
echo    3 - Ubuntu 14.04 (14.04.3 LTS)
echo    4 - CentOS 6.7
echo    5 - CentOS 7.2.1511 (amd64 only)
echo.
echo    q - Quit
echo.
echo --------------------------------------------------------------------------------
echo.

set /p pick="Please choice: "
if %pick% == q (goto q)
echo.
set /p arch="Which architecture? [amd64|i386]: "
echo.

GOTO=%pick%

:0
    goto 1

:1
    echo BUILD:     debian-7.9-%arch%.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\debian\debian-7.9-%arch%
    packer build packer.json
    echo.
    echo REMOVE:    debian-7.9-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box remove debian-7.9-%arch%
    echo.
    echo ADD:       debian-7.9-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box add debian-7.9-%arch% %root_dir%\boxes\virtualbox\debian-7.9-%arch%.box
    echo.
    if %pick% == 0 (goto 2) else (goto end)

:2
    echo BUILD:     debian-8.3-%arch%.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\debian\debian-8.3-%arch%
    packer build packer.json
    echo.
    echo REMOVE:    debian-8.3-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box remove debian-8.3-%arch%
    echo.
    echo ADD:       debian-8.3-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box add debian-8.3-%arch% %root_dir%\boxes\virtualbox\debian-8.3-%arch%.box
    echo.
    if %pick% == 0 (goto 3) else (goto end)

:3
    echo BUILD:     ubuntu-14.04-%arch%.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\ubuntu\ubuntu-14.04-%arch%
    packer build packer.json
    echo.
    echo REMOVE:    ubuntu-14.04-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box remove ubuntu-14.04-%arch%
    echo.
    echo ADD:       ubuntu-14.04-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box add ubuntu-14.04-%arch% %root_dir%\boxes\virtualbox\ubuntu-14.04-%arch%.box
    echo.
    if %pick% == 0 (goto 4) else (goto end)

:4
    echo BUILD:     centos-6.7-%arch%.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\centos\centos-6.7-%arch%
    packer build packer.json
    echo.
    echo REMOVE:    centos-6.7-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box remove centos-6.7-%arch%
    echo.
    echo ADD:       centos-6.7-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box add centos-6.7-%arch% %root_dir%\boxes\virtualbox\centos-6.7-%arch%.box
    echo.
    if %pick% == 0 (goto 5) else (goto end)

:5
    if "%arch%" == "i386" (
        echo Architecture %arch% is not supported by CentOS 7
        echo.
        echo.
        goto end
    )
    echo BUILD:     centos-7.2.1511-%arch%.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\centos\centos-7.2.1511-%arch%
    packer build packer.json
    echo.
    echo REMOVE:    centos-7.2.1511-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box remove centos-7.2.1511-%arch%
    echo.
    echo ADD:       centos-7.2.1511-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box add centos-7.2.1511-%arch% %root_dir%\boxes\virtualbox\centos-7.2.1511-%arch%.box
    echo.
    goto end

:end
    echo --------------------------------------------------------------------------------
    echo FINISHED
    echo.
    echo --------------------------------------------------------------------------------
    chdir %root_dir%

:q

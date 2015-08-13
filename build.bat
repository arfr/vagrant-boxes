@echo OFF

set root_dir=%cd%

echo.
echo --------------------------------------------------------------------------------
echo    VAGRANT BOXES (builder)
echo.
echo --------------------------------------------------------------------------------
echo    0 - All (broken)
echo.
echo    1 - Debian 8.1
echo    2 - Ubuntu 14.04 (14.04.1 LTS)
echo    3 - CentOS 6.6
echo    4 - CentOS 7.1.1503 (only amd64)
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
    echo BUILD:     debian-8.1-%arch%.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\debian\debian-8.1-%arch%
    packer build packer.json
    echo.
    echo REMOVE:    debian-8.1-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box remove debian-8.1-%arch%
    echo.
    echo ADD:       debian-8.1-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box add debian-8.1-%arch% %root_dir%\boxes\virtualbox\debian-8.1-%arch%.box
    echo.
    if %pick% == 0 (goto 2) else (goto end)

:2
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
    if %pick% == 0 (goto 3) else (goto end)

:3
    echo BUILD:     centos-6.6-%arch%.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\centos\centos-6.6-%arch%
    packer build packer.json
    echo.
    echo REMOVE:    centos-6.6-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box remove centos-6.6-%arch%
    echo.
    echo ADD:       centos-6.6-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box add centos-6.6-%arch% %root_dir%\boxes\virtualbox\centos-6.6-%arch%.box
    echo.
    if %pick% == 0 (goto 4) else (goto end)

:4
    echo BUILD:     centos-7.1.1503-%arch%.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\centos\centos-7.1.1503-%arch%
    packer build packer.json
    echo.
    echo REMOVE:    centos-7.1.1503-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box remove centos-7.1.1503-%arch%
    echo.
    echo ADD:       centos-7.1.1503-%arch%
    echo --------------------------------------------------------------------------------
    vagrant box add centos-7.1.1503-%arch% %root_dir%\boxes\virtualbox\centos-7.1.1503-%arch%.box
    echo.
    goto end

:end
    echo --------------------------------------------------------------------------------
    echo FINISHED
    chdir %root_dir%

:q
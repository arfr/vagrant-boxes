@echo OFF

set root_dir=%cd%

echo.
echo --------------------------------------------------------------------------------
echo    VAGRANT BOXES (builder)
echo.
echo --------------------------------------------------------------------------------
echo    0 - All
echo    1 - Debian 7.4 (Wheezy)
echo    2 - Ubuntu 14.04 (Trusty Tahr)
echo    3 - CentOS 6.5
echo.
echo --------------------------------------------------------------------------------
echo.

set /p pick="Please choice: "
echo.

GOTO=%pick%

:0
    goto 1

:1
    echo BUILD:     debian-7.4.0-amd64.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\debian\debian-7.4.0-amd64
    packer build packer.json
    echo.
    echo REMOVE:    debian-7.4.0-amd64
    echo --------------------------------------------------------------------------------
    vagrant box remove debian-7.4.0-amd64
    echo.
    echo ADD:       debian-7.4.0-amd64
    echo --------------------------------------------------------------------------------
    vagrant box add debian-7.4.0-amd64 %root_dir%\boxes\virtualbox\debian-7.4.0-amd64.box
    echo.
    if %pick% == 0 (goto 2) else (goto end)

:2
    echo BUILD:     ubuntu-14.04-server-amd64.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\ubuntu\ubuntu-14.04-server-amd64
    packer build packer.json
    echo.
    echo REMOVE:    ubuntu-14.04-server-amd64
    echo --------------------------------------------------------------------------------
    vagrant box remove ubuntu-14.04-server-amd64
    echo.
    echo ADD:       ubuntu-14.04-server-amd64
    echo --------------------------------------------------------------------------------
    vagrant box add ubuntu-14.04-server-amd64 %root_dir%\boxes\virtualbox\ubuntu-14.04-server-amd64.box
    echo.
    if %pick% == 0 (goto 2) else (goto end)

:3
    echo BUILD:     centos-6.5-amd64.box
    echo --------------------------------------------------------------------------------
    chdir %root_dir%\packer\centos\centos-6.5-amd64
    packer build packer.json
    echo.
    echo REMOVE:    centos-6.5-amd64.box
    echo --------------------------------------------------------------------------------
    vagrant box remove centos-6.5-amd64
    echo.
    echo ADD:       centos-6.5-amd64.box
    echo --------------------------------------------------------------------------------
    vagrant box add centos-6.5-amd64 %root_dir%\boxes\virtualbox\centos-6.5-amd64.box
    echo.
    goto end

:end
    echo --------------------------------------------------------------------------------
    echo FINISHED
    chdir %root_dir%

:q
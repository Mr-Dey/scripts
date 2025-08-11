@echo off
rem ==============================================================================
rem  Script to open five SSH sessions in separate tabs of a new Windows Terminal.
rem
rem  This script requires the new Windows Terminal and the OpenSSH Client feature
rem  to be installed on Windows.
rem
rem  USAGE:
rem  1. Save this file with a .bat extension (e.g., ssh_vms.bat).
rem  2. Double-click the file or run it from Command Prompt/PowerShell.
rem ==============================================================================

rem -- Set the IP addresses of the virtual machines --
set VM1_IP=10.30.31.44
set VM2_IP=10.30.31.45
set VM3_IP=10.30.31.46
set VM4_IP=10.30.30.180
set VM5_IP=10.30.30.120

rem -- Set the SSH user --
set SSH_USER=root

echo Launching Windows Terminal with SSH sessions...

rem -- Command to open a new Windows Terminal window with five tabs --
rem Each "new-tab" command opens a new tab. The --title sets the tab's title.
rem The ssh command is executed within that new tab.
rem The semicolon separates the commands for each new tab.
wt.exe new-tab --title "10.30.31.44 (master) - %VM1_IP%" ssh -t %SSH_USER%@%VM1_IP% "screen -x work || bash" ; ^
       new-tab --title "10.30.31.45 (worker1)- %VM2_IP%" ssh -t %SSH_USER%@%VM2_IP% "screen -x work || bash" ; ^
       new-tab --title "10.30.31.46 (worker2)- %VM3_IP%" ssh -t %SSH_USER%@%VM3_IP% "screen -x work || bash" ; ^
       new-tab --title "10.30.30.180 (dig-node / perf vm) - %VM4_IP%" ssh -t %SSH_USER%@%VM4_IP% "screen -x work || bash" ; ^
       new-tab --title "10.30.30.120 (my dig-node / perf vm) - %VM5_IP%" ssh -t %SSH_USER%@%VM5_IP% "screen -x work || bash"

echo New terminal window with five SSH tabs has been launched.

@echo off
:: Ū���Ҧb��Ƨ�
set "batchPath=%~dp0"
::���ܸ�Ƨ���妸�ɩҦb��Ƨ�
cd /d "%batchPath%"
::�R��RIME�Ҧ����
del "%AppData%\Rime\*.*" /Q
::����opencc
rmdir "%AppData%\Rime\opencc" /S /Q
::�ƻs�ۭq��Ʀ�RIME��Ƨ�
xcopy ".\Rime\*.*" /S "%AppData%\Rime\"

::���Ҥp�T�@��J�k
IF EXIST "C:\Program Files\Rime\weasel-0.16.2\WeaselDeployer.exe" (
    "C:\Program Files\Rime\weasel-0.16.2\WeaselDeployer.exe" /deploy
    echo ���Ҥp�T�@��J�k�A��_64
) ELSE (
    IF EXIST "C:\Program Files (x86)\Rime\weasel-0.16.2\WeaselDeployer.exe" (
        "C:\Program Files (x86)\Rime\weasel-0.16.2\WeaselDeployer.exe" /deploy
        echo ���Ҥp�T�@��J�k�A��_32
    ) ELSE (
        echo �w�]���|�L�k���p�T�@��J�k�A�Цۦ��ʭ��ҪA�ȡC
    )
)
pause
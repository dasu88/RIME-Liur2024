@echo off
:: 讀取所在資料夾
set "batchPath=%~dp0"
::改變資料夾到批次檔所在資料夾
cd /d "%batchPath%"
::刪除RIME所有資料
del "%AppData%\Rime\*.*" /Q
::移除opencc
rmdir "%AppData%\Rime\opencc" /S /Q
::複製自訂資料至RIME資料夾
xcopy ".\Rime\*.*" /S "%AppData%\Rime\"

::重啟小狼毫輸入法
IF EXIST "C:\Program Files\Rime\weasel-0.16.2\WeaselDeployer.exe" (
    "C:\Program Files\Rime\weasel-0.16.2\WeaselDeployer.exe" /deploy
    echo 重啟小狼毫輸入法服務_64
) ELSE (
    IF EXIST "C:\Program Files (x86)\Rime\weasel-0.16.2\WeaselDeployer.exe" (
        "C:\Program Files (x86)\Rime\weasel-0.16.2\WeaselDeployer.exe" /deploy
        echo 重啟小狼毫輸入法服務_32
    ) ELSE (
        echo 預設路徑無法找到小狼毫輸入法，請自行手動重啟服務。
    )
)
pause
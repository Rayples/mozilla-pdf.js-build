@echo off
setlocal enabledelayedexpansion

rem ��ȡ��ǰĿ¼�����е����ļ���
for /d %%f in (pdf.js-*) do (
    rem �������ļ���
    cd %%f
    
    rem ɾ�� package-lock.json �ļ���������ڣ�
    if exist package-lock.json (
        del package-lock.json
    )
    
    rem ɾ�� package-lock.json �ļ���������ڣ�
    if exist yarn.lock (
        del yarn.lock
    )
    
    rem ɾ�� node_modules �ļ��У�������ڣ�
    if exist node_modules (
        rmdir /s /q node_modules
    )
    rem �����ļ�����ִ�� npm i
    npm install --ignore-scripts

    rem ִ�� gulp generic
    gulp generic
	
	mkdir ..\build\%%f
	
	xcopy /y /e build\generic ..\build\%%f

    rem �����ϼ�Ŀ¼
    cd C:\Users\Ray\Downloads\Compressed
)

endlocal
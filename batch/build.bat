@echo off
setlocal enabledelayedexpansion

rem 获取当前目录下所有的子文件夹
for /d %%f in (pdf.js-*) do (
    rem 进入子文件夹
    cd %%f
    
    rem 删除 package-lock.json 文件（如果存在）
    if exist package-lock.json (
        del package-lock.json
    )
    
    rem 删除 package-lock.json 文件（如果存在）
    if exist yarn.lock (
        del yarn.lock
    )
    
    rem 删除 node_modules 文件夹（如果存在）
    if exist node_modules (
        rmdir /s /q node_modules
    )
    rem 在子文件夹中执行 npm i
    npm install --ignore-scripts

    rem 执行 gulp generic
    gulp generic
	
	mkdir ..\build\%%f
	
	xcopy /y /e build\generic ..\build\%%f

    rem 返回上级目录
    cd C:\Users\Ray\Downloads\Compressed
)

endlocal
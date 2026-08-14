@echo off
setlocal
chcp 65001 >nul
cd /d "%~dp0"

if not exist ".venv\Scripts\python.exe" (
    echo [错误] 未找到 .venv，请先安装项目依赖。
    exit /b 1
)

if "%FEISHU_WEBHOOK%"=="" (
    echo [提示] 未设置 FEISHU_WEBHOOK，本次只在本机输出信号。
)

REM ========== 运行监控 ==========
".venv\Scripts\python.exe" -u realtime_monitor.py --force
set "EXIT_CODE=%ERRORLEVEL%"

REM 暂停查看结果（可选）
REM pause

exit /b %EXIT_CODE%

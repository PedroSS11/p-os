@echo off
setlocal

REM ====== CONFIGURAÇÕES ======
set FILE=boot
set HOST=pedro@raspberrypi.local
set DEST=/home/pedro/pos

REM ====== COMPILAÇÃO COM NASM ======
echo Compilando %FILE%.asm ...
nasm -f bin %FILE%.asm -o %FILE%.bin

if %errorlevel% neq 0 (
    echo Erro na compilação do NASM!
    pause
    exit /b %errorlevel%
)

REM ====== ENVIO VIA SCP ======
echo Enviando %FILE%.bin para o Raspberry Pi...
scp %FILE%.bin %HOST%:%DEST%

if %errorlevel% neq 0 (
    echo Falha ao enviar arquivo!
    pause
    exit /b %errorlevel%
)

echo =====================================
echo Compilação e envio concluídos com sucesso!
echo Arquivo: %FILE%.bin
echo Destino: %HOST%:%DEST%
echo =====================================

pause

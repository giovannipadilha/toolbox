@echo off
chcp 65001 >nul
title Verificação do Sistema Windows
color 0B

echo ==================================================
echo          VERIFICAÇÃO DO SISTEMA WINDOWS
echo ==================================================
echo.
echo Este processo verificará o Windows e o disco sem realizar reparos ou alterações.
echo Não feche esta janela durante a execução.
echo.

:: Verifica se o script foi executado como administrador
net session >nul 2>&1
if %errorlevel% neq 0 (
echo ERRO: Execute este arquivo como Administrador.
echo.
pause
exit /b
)

echo ==================================================
echo [1/3] Verificando a integridade da imagem do Windows
echo ==================================================
echo.
DISM /Online /Cleanup-Image /ScanHealth

echo.
echo ==================================================
echo [2/3] Verificando os arquivos do sistema
echo ==================================================
echo.
sfc /verifyonly

echo.
echo ==================================================
echo [3/3] Verificando o disco C:
echo ==================================================
echo.
chkdsk C: /scan

echo.
echo ==================================================
echo VERIFICAÇÃO FINALIZADA
echo ==================================================
echo.
echo Analise as mensagens apresentadas durante o processo.
echo.
echo Se forem encontrados problemas, execute o script de reparação do Windows.
echo.
pause

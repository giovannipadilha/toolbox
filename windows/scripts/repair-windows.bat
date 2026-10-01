@echo off
chcp 65001 >nul

title Reparo do Sistema Windows
color 0A

echo ==================================================
echo      REPARO DO SISTEMA WINDOWS
echo ==================================================
echo.
echo Este processo pode demorar bastante. Não feche esta janela durante a execução.
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
echo [1/3] Executando DISM...
echo ==================================================
DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo ==================================================
echo [2/3] Executando SFC /SCANNOW...
echo ==================================================
sfc /scannow

echo.
echo ==================================================
echo [3/3] Verificando o disco C: com CHKDSK...
echo ==================================================
echo.
echo O CHKDSK pode solicitar uma verificação na próxima
echo reinicialização do computador.
echo.
chkdsk C: /f /r

echo.
echo ==================================================
echo PROCESSO FINALIZADO
echo ==================================================
echo.
echo Se o CHKDSK foi agendado, reinicie o computador.
echo.
pause

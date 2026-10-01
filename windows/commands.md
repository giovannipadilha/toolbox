# Comandos para Diagnóstico e Reparo do Sistema Operacional Windows

## Comandos para buscar por erros e arquivos corrompidos

### DISM

Verifica e/ou repara a imagem do Windows, principalmente o Component Store do Windows (WinSxS), em busca de corrupção.

Apenas verifica:
```bat
DISM /Online /Cleanup-Image /ScanHealth
```

Verifica e repara:
```bat
DISM /Online /Cleanup-Image /RestoreHealth
```

### SFC

Verifica e/ou repara os arquivos protegidos do Windows em busca de corrupção e, quando possível, substitui os arquivos corrompidos por cópias corretas.

Apenas verifica:
```bat
sfc /verifyonly
```

Verifica e repara:
```bat
sfc /scannow
```

### CHKDSK

Verifica e/ou repara o sistema de arquivos da unidade, procurando também por setores defeituosos.

Apenas verifica a unidade:
```bat
chkdsk <unidade> /scan
```

Verifica e repara o sistema de arquivos da unidade e setores defeituosos:
```bat
chkdsk <unidade> /f /r
```

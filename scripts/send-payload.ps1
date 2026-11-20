# Wysyla plik .elf/.bin do konsoli po zaladowaniu GoldHEN (BinLoader, port 9090).
# Uzycie: .\send-payload.ps1 -Ip 192.168.0.50 -File .\linux-1024mb.elf
param([Parameter(Mandatory)][string]$Ip,[Parameter(Mandatory)][string]$File,[int]$Port=9090)
$c = New-Object Net.Sockets.TcpClient($Ip,$Port)
$s = $c.GetStream(); $b=[IO.File]::ReadAllBytes($File); $s.Write($b,0,$b.Length); $s.Close(); $c.Close()
"Wyslano $($b.Length) B do ${Ip}:$Port"

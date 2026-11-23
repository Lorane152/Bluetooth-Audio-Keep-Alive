@echo off
chcp 65001 >nul
title Bluetooth Audio Keep-Alive
echo Keep-alived.

powershell -NoProfile -ExecutionPolicy Bypass -Command ^
"$sr = 44100; $freq = 1; $amp = 20; $sec = 5; $n = $sr * $sec; ^
$bytes = New-Object byte[] (44 + $n * 2); ^
[Text.Encoding]::ASCII.GetBytes('RIFF').CopyTo($bytes, 0); ^
[BitConverter]::GetBytes([int](36 + $n * 2)).CopyTo($bytes, 4); ^
[Text.Encoding]::ASCII.GetBytes('WAVEfmt ').CopyTo($bytes, 8); ^
[BitConverter]::GetBytes([int]16).CopyTo($bytes, 16); ^
[BitConverter]::GetBytes([int16]1).CopyTo($bytes, 20); ^
[BitConverter]::GetBytes([int16]1).CopyTo($bytes, 22); ^
[BitConverter]::GetBytes([int]$sr).CopyTo($bytes, 24); ^
[BitConverter]::GetBytes([int]($sr * 2)).CopyTo($bytes, 28); ^
[BitConverter]::GetBytes([int16]2).CopyTo($bytes, 32); ^
[BitConverter]::GetBytes([int16]16).CopyTo($bytes, 34); ^
[Text.Encoding]::ASCII.GetBytes('data').CopyTo($bytes, 36); ^
[BitConverter]::GetBytes([int]($n * 2)).CopyTo($bytes, 40); ^
for ($i = 0; $i -lt $n; $i++) { ^
    $v = [int16]($amp * [Math]::Sin(2 * [Math]::PI * $freq * $i / $sr)); ^
    [BitConverter]::GetBytes($v).CopyTo($bytes, 44 + $i * 2); ^
} ^
$ms = New-Object IO.MemoryStream(,$bytes); ^
$p = New-Object Media.SoundPlayer($ms); ^
$p.PlayLooping(); ^
while ($true) { Start-Sleep -Seconds 60 }"

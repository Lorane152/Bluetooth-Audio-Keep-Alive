**Bluetooth Audio Keep-Alive**

### English

Simple Windows batch script that prevents Bluetooth headphones / speakers from going to sleep by continuously playing an almost inaudible low-frequency sine wave.

#### How it works
- Generates a short mono 16-bit WAV (5 seconds, 44100 Hz) containing a 1 Hz sine wave with very low amplitude (`amp = 20`).
- Plays this tone in an infinite loop via `System.Media.SoundPlayer`.
- The process stays alive forever (`while ($true)`), so the audio stream never stops.

This keeps the Bluetooth audio profile active and stops most devices from entering power-saving / disconnect mode.

#### Usage
1. Save the code as `Bluetooth-KeepAlive.bat`
2. Double-click it (or run from cmd)
3. A console window with the title **Bluetooth Audio Keep-Alive** will stay open. Just leave it running.

#### Troubleshooting
If the keep-alive does **not** work on your system / Windows version / Bluetooth adapter, try slightly increasing the values of `$freq` and `$amp` inside the script (for example `$freq = 5`–`20` and `$amp = 50`–`100`). Higher values make the tone a bit more audible but more reliable on stubborn devices.

---

### Русский

Простой bat-скрипт для Windows, который не даёт Bluetooth-наушникам / колонкам уходить в спящий режим, постоянно проигрывая почти неслышимую низкочастотную синусоиду.

#### Как работает
- Генерирует короткий mono 16-bit WAV (5 секунд, 44100 Гц) с синусом частотой 1 Гц и очень маленькой амплитудой (`amp = 20`).
- Бесконечно воспроизводит этот тон через `System.Media.SoundPlayer`.
- Процесс никогда не завершается (`while ($true)`), поэтому аудиопоток не прерывается.

За счёт этого Bluetooth-профиль остаётся активным, и большинство устройств не уходит в энергосбережение / не отключается.

#### Использование
1. Сохраните код как `Bluetooth-KeepAlive.bat`
2. Запустите двойным кликом (или из cmd)
3. Останется открыто консольное окно с заголовком **Bluetooth Audio Keep-Alive**. Просто оставьте его работать.

#### Если не работает
На некоторых версиях Windows / драйверах / адаптерах может понадобиться слегка увеличить значения `$freq` и `$amp` в скрипте (например `$freq = 5`–`20` и `$amp = 50`–`100`). Более высокие значения делают тон чуть более заметным, но заметно повышают надёжность на «упрямых» устройствах.

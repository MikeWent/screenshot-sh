# screenshot-sh

This is a solutions to my main problem with KDE: spectate can not copy screensot to clipboard via hotkey.

## How to use

```sh
# 1. Install **scrot** and **xclip**
sudo apt install scrot xclip

# 2. Install **scrot** and **xclip**
cd ~/.local/share
git clone https://gitlab.com/Mike_Went/screenshot-sh

# 3. Generate .khotkeys
./screenshot.sh --gen

# 4. Import .khotkeys (see pic below)
systemsettings5 &
```

![KDE Keybind import](kde-keybind-import.png)

## License

WTFPL

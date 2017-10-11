#!/bin/sh

display_help () {
    echo "Usage:"
    echo "    screenshot.sh [OPTION]"
    echo
    echo "Options:"
    echo "    --selection           Select region to screenshot"
    echo "    --fullscreen          Fullscreen screenshot"
    echo "    --window              Screenshot of active window only"
    echo "    --window-borders      Same as --window but includes WM borders"
    echo 
    echo "Additional:"
    echo "    --gen                 Generate .khotkeys file to import in KDE"
    echo
    echo "Credits:"
    echo "    Mike_Went (gitlab.com/Mike_Went/screenshot-sh)"
    echo
    exit 1
}

generate_khotkeys () {
    cat <<KHOTKEYS > screenshot-sh.khotkeys
[Data]
DataCount=1

[Data_1]
Comment=This script uses scrot and xclip to make screenshot and copy it to clipboard\n\ngitlab.com/Mike_Went/screenshot-sh
DataCount=4
Enabled=true
Name=screenshot-sh
SystemGroup=0
Type=ACTION_DATA_GROUP

[Data_1Conditions]
Comment=
ConditionsCount=0

[Data_1_1]
Comment=Select region to screenshot
Enabled=true
Name=Selection
Type=SIMPLE_ACTION_DATA

[Data_1_1Actions]
ActionsCount=1

[Data_1_1Actions0]
CommandURL=$HOME/.local/share/screenshot-sh/screenshot.sh --selection
Type=COMMAND_URL

[Data_1_1Conditions]
Comment=
ConditionsCount=0

[Data_1_1Triggers]
Comment=Simple_action
TriggersCount=1

[Data_1_1Triggers0]
Key=Ctrl+Print
Type=SHORTCUT
Uuid={870519b8-ca26-4889-9432-5c048cd76fef}

[Data_1_2]
Comment=Fullscreen screenshot
Enabled=true
Name=Fullscreen
Type=SIMPLE_ACTION_DATA

[Data_1_2Actions]
ActionsCount=1

[Data_1_2Actions0]
CommandURL=$HOME/.local/share/screenshot-sh/screenshot.sh --fullscreen
Type=COMMAND_URL

[Data_1_2Conditions]
Comment=
ConditionsCount=0

[Data_1_2Triggers]
Comment=Simple_action
TriggersCount=1

[Data_1_2Triggers0]
Key=Print
Type=SHORTCUT
Uuid={a1b25f36-8297-4b86-8669-feb8dc59c2d2}

[Data_1_3]
Comment=Screenshot of active window only
Enabled=true
Name=Window
Type=SIMPLE_ACTION_DATA

[Data_1_3Actions]
ActionsCount=1

[Data_1_3Actions0]
CommandURL=$HOME/.local/share/screenshot-sh/screenshot.sh --window
Type=COMMAND_URL

[Data_1_3Conditions]
Comment=
ConditionsCount=0

[Data_1_3Triggers]
Comment=Simple_action
TriggersCount=1

[Data_1_3Triggers0]
Key=Alt+Print
Type=SHORTCUT
Uuid={f9b1b826-c8e1-4be7-8c43-fda3de96af2f}

[Data_1_4]
Comment=Same as Window but includes WM borders
Enabled=true
Name=Window & borders
Type=SIMPLE_ACTION_DATA

[Data_1_4Actions]
ActionsCount=1

[Data_1_4Actions0]
CommandURL=$HOME/.local/share/screenshot-sh/screenshot.sh --widow-borders
Type=COMMAND_URL

[Data_1_4Conditions]
Comment=
ConditionsCount=0

[Data_1_4Triggers]
Comment=Simple_action
TriggersCount=1

[Data_1_4Triggers0]
Key=Alt+Shift+Print
Type=SHORTCUT
Uuid={7fdf9dad-6fe3-4f4e-b33d-d4b9a12fcc01}

[Main]
AllowMerge=false
ImportId=screenshot-sh
Version=2
KHOTKEYS
    echo "Generated screenshot-sh.khotkeys"
}

if [ "$#" -ne 1 ]
then
    display_help
fi

copy_and_delete='sh -c "xclip -selection clipboard -t image/png -i $f; rm $f"'

case "$1" in
"--selection")
    scrot -z -s -e "$copy_and_delete"
    ;;
"--fullscreen")
    scrot -z -e "$copy_and_delete"
    ;;
"--window")
    scrot -z -u -e "$copy_and_delete"
    ;;
"--window-borders")
    scrot -z -u -b -e "$copy_and_delete"
    ;;
"--gen")
    generate_khotkeys
    ;;
*)
    display_help
    ;;
esac

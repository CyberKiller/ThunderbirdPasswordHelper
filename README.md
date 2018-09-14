# Thunderbird Password Helper
A Thunderbird launcher AutoIt script that automatically deals with those pesky multiple Master Password prompts.

### Notice:
The addons StartupMaster and Master Password+ mysteriously appear to be working again so this script may not be needed anymore.

### Installation:
  Download and install AutoIt from here: https://www.autoitscript.com/site/autoit/downloads/, then download "Thunderbird Password Helper.au3" from this repo and place it somewhere convinent.
  If you have installed Thunderbird to somewhere other than: "C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe",
  then please edit the path near the top of the script. (I might add automatic installation location detection in a later version.)

### Usage:
  Run Thunderbird Password Helper.au3 and type in your Thunderbird Master Password into the box.
  
### Requirements: 
  AutoIt 3 installed from here: https://www.autoitscript.com/site/autoit/downloads/
  
### How it works:
  The script prompts for the master password, launches Thunderbird then types the password into each password prompt for you.

### Disclaimer:
  I (the author) ACCEPT NO RESPONSIBILITY FOR ANYTHING BAD THAT ARISES FROM USE OF THIS SCRIPT. USE WITH CAUTION!
  I quickly wrote this script due to the usual workaround addons not being compatible with Thunderbird 60 (Quantum).
  Bugs and security problems may be present.
  There is also a small chance the script could type the password into the wrong window.

### FAQs:
  Q: The script is just typing in infinite password boxes or has otherwise gone wrong! What do I do?<br />
  A: Right click on the AutoIt icon in the System Tray (bottom right of the screen) and click "Exit".

  Q: Why do I still get the multiple password prompts after launching Thunderbird?<br />
  A: You need to run the script instead which prompts for the master password then launches Thunderbird by it's self.
 
  Q: Why don't you provide a compiled version of the script that runs without needing to install Autoit?<br />
  A: Because some virus guards flag compiled AutoIt scripts as viruses.

# ThunderbirdPasswordHelper
A Thunderbird launcher AutoIt script that automatically deals with those pesky multiple Master Password prompts.

Installation:
  Download and install AutoIt from here: https://www.autoitscript.com/site/autoit/downloads/,
  Download and place Thunderbird Password Helper.au3 somewhere convinent.
  If you have installed Thunderbird to somewhere other than: "C:\Program Files (x86)\Mozilla Thunderbird\thunderbird.exe",
  then please edit the path near the top of the script. (I might add automatic installation location detection in a later version.)

Usage:
  Run Thunderbird Password Helper.au3 and type in your Thunderbird Master Password into the box.
  
Requirements: 
  AutoIt 3 installed from here: https://www.autoitscript.com/site/autoit/downloads/
  
How it works:
	The script prompts for the master password, launches Thunderbird then types the password into each password prompt for you.

Disclaimer:
  I (the author) ACCEPT NO RESPONSIBILITY FOR ANYTHING BAD THAT ARISES FROM USE OF THIS SCRIPT. USE WITH CAUTION!
	I quickly wrote this script due to the usual workaround addons not being compatible with Thunderbird 60 (Quantum).
	Bugs and security problems may be present.
	There is also a small chance the script could type the password into the wrong window.

FAQs:
 Q: Why do I still get the multiple password prompts after launching Thunderbird?
 A: You need to run the script instead which prompts for the master password then launches Thunderbird by it's self.
 
 Q: Why don't you provide a compiled version of the script that runs without needing to install Autoit?
 A: Because some virus guards flag compiled AutoIt scripts as viruses.

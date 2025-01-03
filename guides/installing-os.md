# 💻 Installing Raspberry Pi Imager

Shame on you for not knowing how to install an operating system, but I'll still help you.

From the [main page](https://www.raspberrypi.com/software/) download the software to be able to burn the image to an SDCard.

## Installing Raspberry Pi OS

1. **Click the Choose Device** button. A list of Pi boards appears. This is an optional step because, you can choose none and, as long as you select the right OS image, it should work. This option makes sure you only see compatible OS.

2. **Click the Choose OS** button. If we are going to use it as a headless server I recommend the lite version.

3. **Click Choose Storage** and **select your card** from the menu.

Click continue to reach the settings section.

### Custom OS settings

A section asking for **"Edit settings"** will appear. We need to **fill in all the fields on the General tab**: 
  - Hostname
  - Username / Password
  - Wireless LAN (if you plan to use Wi-Fi)
  - Locale settings.

Finally on the Services tab, **toggle enable SSH to on** and **select "Use password authentication."**  Then **click Save**.

Apply custom settings and install.

---

**IMPORTANT:** Remember the hostname, username and password. They will be necessary to access the server. 

# 🔑 Accessing to the Raspberry PI

If all of the steps done [here](/guides/installing-os.md) was done successfully, we will be able to access using the credentials what we used at the custom settings.

For example; if we used as a hostname:
- raspberrypi.local

And as a username and password:
- username: admin
- password: admin

Then we can connect to the server via SSH.

## Access to the terminal

- Window users: Click windows button at the keyboard and look for `powershell`
- MacOS users: Open terminal

The command what we need to use from our terminal is:

```
ssh admin@raspberrypi.local
```

And finally introduce the password once the server asks for it.

---

**IMPORTANT:** You need to be on the same network as the Raspberry Pi. That means you must also be connected to the wifi. It seemed obvious? well, many other things that I have had to explain to you seem obvious to me.

# Locale failed

if for some reason the locale has not been configured correctly and you see constant error messages like the following:

> Reading changelogs... Done perl: warning: Setting locale failed. perl: warning: Please check that your locale settings: LANGUAGE = (unset), LC_ALL = (unset), LC_CTYPE = "UTF-8", LANG = "en_GB.UTF-8" are supported and installed on your system. perl: warning: Falling back to a fallback locale ("en_GB.UTF-8").

Follow the next workaround to solve it:

1. Verify the available locales installed:

   ```bash
   locale -a
   ```

   Look if the selected locale appears, in this case **en_GB.UTF-8**

2. Reconfigure locales: If the required localization is not available, you can generate it.

   ```bash
   sudo dpkg-reconfigure locales
   ```

   - A menu will appear with all the available locales. Select the one you need.

3. Set up default locates: edit the `/etc/default/locale` file to set the correct locales:

   ```bash
   sudo nano /etc/default/locale
   ```

   The content of the file should have something similar to that, if not, at the needed lines:

   ```bash
   LANG="en_GB.UTF-8"
   LC_ALL="en_GB.UTF-8"
   LC_CTYPE="en_GB.UTF-8"
   ```

4. Export variables temporarily: to apply the changes at the actual session, execute the next sentences:

   ```bash
   export LANG=en_GB.UTF-8
   export LC_ALL=en_GB.UTF-8
   export LC_CTYPE=en_GB.UTF-8
   ```

5. Update the system configuration

   ```bash
   sudo update-locale LANG=en_GB.UTF-8 LC_ALL=en_GB.UTF-8 LC_CTYPE=en_GB.UTF-8
   ```

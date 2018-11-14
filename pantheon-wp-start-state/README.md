# Script for automating WordPress site creation on Pantheon
This script does the following:

- Spins up a WordPress site on Pantheon
- Sets the initial configuration
- Deletes extra themes
- Deletes extra plugins
- Installs and activates your usual starting plugins

To use:

```
$ ./pantheon-wp-start-state.sh your-new-site-name "Your New Blog Name"
```

To avoid the RSA key fingerprint "Are you sure you want to continue connecting (yes/no)?" message, modify your ~/.ssh/config with the following:

```
Host *.drush.in
	StrictHostKeyChecking no
	LogLevel ERROR
```

Feel free to customize and use.

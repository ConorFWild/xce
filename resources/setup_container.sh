"$2" | sshfs -o reconnect "$1"@ssh.diamond.ac.uk:/dls /dls -o password_stdin

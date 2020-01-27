cookie="$(xauth list)"

vagrant | sudo passwd root --stdin

sudo su root -c ./setup_windows_root.sh $cookie

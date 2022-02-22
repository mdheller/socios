printf "Analyzing system application environment. Wait for a moment...\n" && sleep 2

if osascript -e 'id of application "virtualbox" ' >/dev/null 2>&1; then
	printf "%s\n" "VirtualBox is available. Nothing to do." && exit 1
else
	printf "%s\n" "VirtualBox yet not installled. Need to install it."
	read -p "Click Yes to install VirtualBox, No to end the process(Yes\No):" choice
fi

case "$choice" in
	Yes|yes|"") vmInput=1;;
	No|no) vmInput=0;;
	* ) { echo "Invalid option. Plesase select the correct option."; exit 1; };;
esac

if [ $vmInput == 1 ]; then
	brew install cask virtualbox
fi

if [ $vmInput == 0 ]; then
	printf "%s\n" "Nothing to do."
fi

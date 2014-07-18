function console () {
	if [[ $# > 0 ]]; then
		query=$(echo "$*"|tr -s ' ' '|')
		tail -f /var/log/system.log|grep -i --color=auto -E "$query"
	else
	tail -f /var/log/system.log
	fi
}

function kill_port() {
	if [[ $# > 0 ]]; then
		lsof -P | grep ':'$1 | awk '{print $2}' | xargs kill -9 
	fi
}

function ips() {
	ifconfig | grep "inte " | awk '{ print $2 }'
}

function scratch() {
	if [ -f ~/Dropbox/Elements/Scratchpad.txt ]; then
		vim ~/Dropbox/Elements/Scratchpad.txt
	fi
}

function spaces_to_tabs() {
	sed -i '' -E "s/    /       /g" **/*(.)
}

function strip_trailing_whitespace() {
	sed -i '' -E "s/[[:space:]]*$//" **/*(.)
}

# Count the significant lines of code in the current directory.
function sloc() {
	grep -v '^$' **.(js|php|scss) | grep -v '//' | wc -l
}

function delete_font() {
	if [[ $# > 0 ]]; then
		rm ../webfonts/$1.ttf;
		rm ../webfonts/$1.eot;
		rm ../webfonts/$1.woff;
	fi
}

# Compile Compass, making a guess about what directory to compile in.
function compile_compass() {
	ls -d1 **/.sass-cache/../ | xargs -L1 compass compile --force -s compressed
}


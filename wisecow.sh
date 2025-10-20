#!/usr/bin/env bash

SRVPORT=4499
RSPFILE=response

rm -f $RSPFILE
mkfifo $RSPFILE

get_api() {
	read line
	echo $line
}

handleRequest() {
    # 1) Process the request
	get_api
	# Random fortune
	mod=$(fortune)

    # Add a random "mood" for fun
    moods=("😎 Cool" "🤓 Geeky" "😂 Funny" "🧠 Smart" "🐮 Moo-tivational")
    mood=${moods[$RANDOM % ${#moods[@]}]}

cat <<EOF > $RSPFILE
HTTP/1.1 200 OK
Content-Type: text/html


<pre>
`cowsay "$mod"`
------------------------
Today's vibe: $mood
</pre>
EOF
}

prerequisites() {
	command -v cowsay >/dev/null 2>&1 &&
	command -v fortune >/dev/null 2>&1 || 
		{ 
			echo "Please install cowsay and fortune before running this script."
			exit 1
		}
}

main() {
	prerequisites
	echo "🐮 Serving random wisdom on port $SRVPORT..."

	while true; do
		cat $RSPFILE | nc -lN $SRVPORT | handleRequest
		sleep 0.01
	done
}

main

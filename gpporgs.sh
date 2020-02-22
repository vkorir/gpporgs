#!/bin/bash

# if arg1="run" starts embedded tomcat server
# if arg1="package" generates a war file to deploy to server

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

if [ $# -ne 1 ] || !([ $1 == "run" ] || [ $1 == "package" ]); then
  echo "Usage: ./gpporgs.sh {run|package}"
  exit 1
fi

if [ $1 = "run" ]; then
	cd ./client && ng serve &&
	cd ../server && mvn spring-boot:run
fi

if [ $1 = "package" ]; then
	echo "packaging"
fi

exit 0
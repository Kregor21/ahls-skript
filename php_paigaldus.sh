# php paigaldus
#
# kontrollime, mitu lprda php korral ok installed
# sõnad on leitud ja vastus salvestatud
# muutuja sisse:
PHP=$(dpkg-query -W -f='${Status}' php8.0 2>/dev/null | grep -c 'ok installed')
# kui php muutuja väärtus võrdub 0-ga
if [ $PHP -eq 0 ]; then
	# siis ok installed ei ole leitud
	# ja väljastame vastav teade ning
	# paigaldame teenus
	echo "Paigaldame php ja vajalikud lisad"
	apt install php
	echo "php on paigaldatud"
# kui php muutuja väärtus võrdub 1-ga
elif [ $PHP -eq 1 ]; then
	# siis ok installed on leitud 1 kord
	# ja teenus on juba paigaldatud
	echo "php on juba paigaldatud"
	#kontrollime olemasolu
	which php
#lõpetame tingimuslause
fi
#skripti lõpp

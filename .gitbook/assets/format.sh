#!/bin/sh
#Runs clang-format on all files (sans API.h) in a PROS repo
#Clang-format is needed on PATH
[ -e "project.pros" ] || {
	echo "Current directory is not a PROS project - will not format it."
	exit 1
}

echo "Formatting Code..."
for i in ./include/*.h
do
	[ "${i##*/}" = "API.h" ] && continue; #ignore PROS files
	echo "Formatting ${i##*/}"
	clang-format -i "./include/${i##*/}"
done
for i in ./src/*.c
do
	[ "${i##*/}" = "init.c" ] || [ "${i##*/}" = "auto.c" ] || \
	[ "${i##*/}" = "opcontrol.c" ] && continue; #ignore PROS files
	echo "Formatting ${i##*/}"
	clang-format -i "./src/${i##*/}"
done
echo "Formatting Complete"

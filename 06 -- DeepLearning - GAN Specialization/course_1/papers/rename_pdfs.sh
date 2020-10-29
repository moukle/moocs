#!/bin/bash

for filename in ./*.pdf; do
	proper_title=$(pdftitle -p $filename)
	lower_title=${proper_title,,}
	spaces_to_underscores=${lower_title// /_}

	length=${#spaces_to_underscores}
	if [[ $length > 0 ]] ; then
		mv $filename $spaces_to_underscores.pdf
	fi

done

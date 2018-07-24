#!/bin/bash

# extract package function
function extractPackage()
{
	# Create temporary directory
	PACKAGE_CONTENTS_DIR=`mktemp -d /tmp/Installer.XXXXXX`

	mkdir "${PACKAGE_CONTENTS_DIR}/Contents"

	# unpack installer
	xar -xf "${1}" -C "${PACKAGE_CONTENTS_DIR}/Contents"

	cd "${PACKAGE_CONTENTS_DIR}/Contents/"

	for file in *.pkg; do
		name=$(echo "$file" | cut -f 1 -d '.')

	 	mkdir "${PACKAGE_CONTENTS_DIR}/$name"

		# extract payload
	 	(cd "${PACKAGE_CONTENTS_DIR}/$name" && cpio -i < "${PACKAGE_CONTENTS_DIR}/Contents/$file/Payload" &>/dev/null)
	done

 	echo ${PACKAGE_CONTENTS_DIR}
}

if [ $# -eq 0 ]; then
	echo "USAGE:"
	echo "   $0 <PKG-file>"

	exit 1
fi

if [ $# -eq 1 ]; then
	PACKAGE_CONTENT=$(extractPackage "$1")
 	open $PACKAGE_CONTENT
	exit 0
fi

exit 0

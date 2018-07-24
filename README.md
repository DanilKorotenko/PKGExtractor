# PKGExtractor
Extracts .pkg file contents to folder.

Assumes that .pkg file is a complex installer that is a xar archive and contains one or more simple .pkg installers.

1. Extracts .pkg file to a temporary directory, by using xar.
2. Search for .pkg files inside.
3. for each .pkg file creates separate folder and extracts it contents to the folder, by using cpio utility.

Using:
	./PKGExtractor <Path-to-.pkg-file>

Example:
Double click .dmg file in Finder.
Open Terminal and execute:
	./PKGExtractor /Volumes/diskImage/installer.pkg

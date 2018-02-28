ReadMe file for the Virtual Floppy Tools from PowerQuest Corp.

Tools available

1) MBRUtil.exe    (Windows Version)
2) MBRUtilD.exe   (DOS Version)
3) WipeTrk.exe    (Windows Version)
4) WipeTrkD.exe   (DOS Version)


MBRUtil.exe (and MBRUtilD.exe)

This utility will save the Master Boot Record (the first sector on the first
hard drive) to a file. It will also restore the contents of a file to the MBR.
It can be used to save the first head (sectors 1 through 62 on most drives)
to a file. It will also restore the contents of a file to the first head.

Syntax:

MBRutil[D] /S=<fileName>    This will save the MBR (sector 1) to a file
MBRutil[D] /SH=<fileName>   This will save the entire first head to a file
MBRutil[D] /R=<fileName>    This will restore the MBR from a file
MBRutil[D] /RH=<fileName>   This will restore the entire first head from a file
MBRutil[D] /?               This will diplay the program syntax


WipeTrk.exe (and WipeTrkD.exe)

This utility will clear the contents of the first track (a.k.a. head) on the
first hard drive with the exception of the MBR (the first sector). If the
drive has 63 sectors per track, this utility will clear out (e.g. set all
bytes to zero) sectors 2 through 63. It has an optional parameter (a file
name) that can be used to save the contents of the first track to a file prior
to clearing.

Syntax:

WipeTrk[D] /S=<fileName>	Save the first track to a file before clearing it
WipeTrk[D] /?               This will diplay the program syntax


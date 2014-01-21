/*
 * Packing Program - Gismo
 *
 */

rc = rxfuncadd( "sysloadfuncs", "rexxutil", "sysloadfuncs")
if rc <> 1 then rc = sysloadfuncs()

say ""
address cmd "@echo off"
say "PACKING... Gismo"

VRX_file = "window1.vrx"

vmaj = 0
vmin = 0
beta = 0
do until lines(VRX_file) = 0
    line_text=strip(linein(VRX_file),,)
    if left(line_text, length("Gismo_version")) = "Gismo_version" then do
        parse var line_text . '= "' ver '"'
        say "Version "ver
        parse var ver vmaj "." vmin " beta " beta
        leave
    end
end
call lineout VRX_file
say ""

if beta > 0 then do
    fn  = "g"vmaj""vmin"b"beta".zip"
    fnr = "g"vmaj""vmin"b"beta"r.zip"
    wpi = "g"vmaj""vmin"b"beta"r"
    ver = vmaj"."vmin"."beta
end
else do
    fn  = "gsm"vmaj""vmin".zip"
    fnr = "gsm"vmaj""vmin"r.zip"
    wpi = "gsm"vmaj""vmin"r"
end

say "File Name : "fn "/" fnr
say ""
rc = SysFileDelete(wpi".in")
rc = SysFileDelete(wpi".wis")

say "1.ZIP Files"
address cmd "zip -D" fn  "*.*"
address cmd "zip -D" fnr "Gismo.exe Color.lst Gismo.txt install.cmd readme_?.htm upload.nifty upload.hobbes"
say ""

say "2.Copy runtime file to bin"
address cmd "copy" fnr "bin"
say ""

say "3.Unzip new archive in BIN directory"
address cmd "cd bin"
address cmd "unzip -o "left(fnr, length(fnr) - 4)".zip"
address cmd "cd .."

say "4.Create WPI file"
call lineout wpi".in", "install=\PrettyPop\Gismo", 1
call lineout wpi".in", "vendor=Pretty Pop Software"
call lineout wpi".in", "application=Gismo"
call lineout wpi".in", "description=Gismo, HTML color coordinating utility"
call lineout wpi".in", "version="ver
call lineout wpi".in", "execute=install.cmd"
call lineout wpi".in"

address cmd "zip2wpi.exe "wpi".zip "wpi".in "wpi".wpi "wpi".wis"
say ""

say "5.Homepage library directory"
address cmd "copy" fnr "F:\wwwhome\index\prettypopnet\software\library"
address cmd "copy" wpi".wpi" "F:\wwwhome\index\prettypopnet\software\library"
address cmd "copy readme_?.htm  f:\wwwhome\index\prettypopnet\software\gismo"
address cmd "copy" fn "F:\wwwhome\index\xoom\software"
say ""

say "6.Copy to Upload directory"
address cmd "copy" fnr "f:\upload"
address cmd "copy upload.hobbes f:\upload\"left(fnr, length(fnr) - 4)".txt"
address cmd "copy upload.nifty  f:\upload\"left(fnr, length(fnr) - 4)".nifty"
address cmd "copy upload.vector f:\upload\"left(fnr, length(fnr) - 4)".vector"
say ""

say "7.Delete temporary files"
rc = SysFileDelete(wpi".in")
rc = SysFileDelete(wpi".wis")
rc = SysFileDelete(wpi".wpi")
say ""

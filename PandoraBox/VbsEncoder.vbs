' .\VbsEncoder.vbs filetoencode.vbs
Option Explicit 
 
dim oEncoder, oFilesToEncode, file, sDest 
dim sFileOut, oFile, oEncFile, oFSO, i 
dim oStream, sSourceFile 

set oFilesToEncode = WScript.Arguments 
set oEncoder = CreateObject("Scripting.Encoder") 
For i = 0 to oFilesToEncode.Count - 1 
    set oFSO = CreateObject("Scripting.FileSystemObject") 
    file = oFilesToEncode(i) 
    set oFile = oFSO.GetFile(file) 
    Set oStream = oFile.OpenAsTextStream(1) 
    sSourceFile=oStream.ReadAll 
    oStream.Close 
    sDest = oEncoder.EncodeScriptFile(".vbs",sSourceFile,0,"") 
    sFileOut = Left(file, Len(file) - 3) & "vbe" 
    Set oEncFile = oFSO.CreateTextFile(sFileOut) 
    oEncFile.Write sDest 
    oEncFile.Close 
Next 
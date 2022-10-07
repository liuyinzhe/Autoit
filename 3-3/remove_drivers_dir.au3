Opt("MustDeclareVars",1)

_Main()

Exit

Func _Main()
    Local $DriversDir = @HomeDrive & "\Drivers"
    Local $CameraDir = @HomeDrive & "\Camera"
    Local $TempDir = EnvGet("WinDir") & "\Temp"
    If FileExists($DriversDir) Then
        Local $r = MsgBox(3 + 32,"Delete directory of drivers",_
        "发现" & $DriversDir & " , 是否全部删除？" _
        & @CRLF & @CRLF & _
        "单击1 “是” ,全部删除 ; " & @CRLF & _
        "单击2 “否” ,保留摄像头驱动 ; " & @CRLF & _
        "单击3 “取消”,不删除" )

        If $r = 6 Then
            DirRemove($DriversDir,1)
            MsgBox(0 + 64,'Delete directory of drivers',$DriversDir & " 全部驱动已删除! ")
        Elseif $r = 7 Then
            DirMove($DriversDir & "\Camera", _
            $TempDir & "\Camera",1)
            DirRemove($DriversDir,1)
            DirCreate($DriversDir)

            DirMove($TempDir & "\Camera", _
            $DriversDir & "\Camera",1)

            MsgBox(0 + 64,'Delete directory of drivers',_
            " 除摄像头以外的驱动已删除! ")
        Elseif $r = 2 Then
            MsgBox(0 + 64,'Delete directory of drivers'," 全部驱动已保留!")
        EndIf
    Else
        MsgBox(0,'Delete directory of drivers',"未发现目录" & $DriversDir & " ! ")
    EndIf
EndFunc  ;==>_Main

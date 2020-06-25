.assembly extern mscorlib { }
.assembly kompilator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

.locals init(float64 temp)
ldc.r8 0
stloc temp

.locals init(int32 tempInt)
ldc.i4 0
stloc tempInt

.locals init (bool b_d)
ldc.i4 0
stloc b_d

ldc.i4 0
ldc.i4 5
clt

brtrue IL_762614971
ldc.i4 1

brtrue IL_762614971
ldc.i4 0
br IL_1386311432
IL_762614971: ldc.i4 1
IL_1386311432: nop
stloc b_d
ldloc b_d
call void [mscorlib]System.Console::Write(bool)

leave EndMain
}
catch [mscorlib]System.Exception
{
callvirt instance string [mscorlib]System.Exception::get_Message()
call void [mscorlib]System.Console::WriteLine(string)
leave EndMain
}
EndMain: ret
}

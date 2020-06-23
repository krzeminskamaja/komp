.assembly extern mscorlib { }
.assembly calculator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

.locals init (float64 d_d)
ldc.r8 0
stloc d_d
ldloc d_d
call void [mscorlib]System.Console::WriteLine(float64)

ldc.r8 0.4
stloc d_d

ldloc d_d
call void [mscorlib]System.Console::Write(float64)

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

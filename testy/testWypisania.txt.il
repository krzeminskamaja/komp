.assembly extern mscorlib { }
.assembly calculator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

ldc.i4 i
call void [mscorlib]System.Console::WriteLine(int32)

ldc.r8 d
call void [mscorlib]System.Console::WriteLine(float64)

ldstr s
call void [mscorlib]System.Console::WriteLine(string)

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

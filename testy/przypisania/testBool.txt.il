.assembly extern mscorlib { }
.assembly calculator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

.locals init (bool b_b)
ldc.i4.s 0
stloc b_b
ldloc b_b
call void [mscorlib]System.Console::WriteLine(bool)

ldc.i4.s 1
stloc b_b

ldloc b_b
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

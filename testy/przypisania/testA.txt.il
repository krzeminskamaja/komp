.assembly extern mscorlib { }
.assembly calculator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

.locals init (int32 i_a)
ldc.i4 0
stloc i_a
ldloc i_a
call void [mscorlib]System.Console::WriteLine(int32)

ldc.i4 5
stloc i_a

ldloc i_a
call void [mscorlib]System.Console::Write(int32)

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

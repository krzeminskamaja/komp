.assembly extern mscorlib { }
.assembly kompilator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

IL_996481953: nop
ldc.i4 1
ldc.i4 0
clt

brfalse IL_634237466
ldc.i4 0
br IL_996481953
IL_634237466: nop
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

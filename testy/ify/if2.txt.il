.assembly extern mscorlib { }
.assembly kompilator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

ldc.i4 2
ldc.i4 0
cgt

brfalse IL_461636404
ldstr "w 1 if"
call void [mscorlib]System.Console::Write(string)

ldc.i4 3
ldc.i4 0
clt

brfalse IL_2084861957
ldstr "w 2 if"
call void [mscorlib]System.Console::Write(string)

br IL_1748608264
IL_2084861957: nop 
ldstr "w 2 else"
call void [mscorlib]System.Console::Write(string)

ldc.i4 1

brfalse IL_1896081294
ldstr "trzeci if"
call void [mscorlib]System.Console::Write(string)

br IL_1385481699
IL_1896081294: nop 
ldc.i4 0
IL_1385481699: nop 
IL_1748608264: nop 
br IL_1314875552
IL_461636404: nop 
IL_1314875552: nop 
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

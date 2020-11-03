.assembly extern mscorlib { }
.assembly kompilator { }
.method static void main()
{
.entrypoint
.try
{

// prolog

ldc.i4 1

ldc.i4 1
ldc.i4 2
cgt

brfalse IL_1066058593
ldstr "jestem w if"
call void [mscorlib]System.Console::Write(string)

ldc.i4 2
ldc.i4 3
add
br IL_445654091
IL_1066058593: nop 
ldstr "jestem w else"
call void [mscorlib]System.Console::Write(string)

IL_445654091: nop 
ldstr "po if"
call void [mscorlib]System.Console::Write(string)

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

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

.locals init (int32 i_a)
ldc.i4 0
stloc i_a

.locals init (int32 i_b)
ldc.i4 0
stloc i_b

ldc.i4 1
stloc i_a
ldc.i4 1
stloc i_b
IL_1859776628: nop
ldloc i_a
ldc.i4 10
cgt
ldc.i4 0
ceq

brfalse IL_1995133554
ldloc i_a
call void [mscorlib]System.Console::Write(int32)

IL_812059412: nop
ldloc i_b
ldc.i4 2
clt

brfalse IL_1248775512
ldstr "wewnatrz"
call void [mscorlib]System.Console::Write(string)

ldloc i_b
ldc.i4 1
add
stloc i_b
br IL_812059412
IL_1248775512: nop
ldloc i_b
ldc.i4 1
sub
stloc i_b
ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldloc i_a
ldc.i4 1
add
stloc i_a
br IL_1859776628
IL_1995133554: nop
ldc.i4 1
stloc i_a
ldc.i4 1
stloc i_b
IL_1085885983: nop
ldloc i_a
ldc.i4 10
cgt
ldc.i4 0
ceq

brfalse IL_1248972688
ldloc i_a
call void [mscorlib]System.Console::Write(int32)

IL_787937187: nop
ldloc i_b
ldc.i4 2
clt

brfalse IL_865180650
ldstr "wewnatrz"
call void [mscorlib]System.Console::Write(string)

ldloc i_b
ldc.i4 1
add
stloc i_b
br IL_787937187
IL_865180650: nop
ldloc i_b
ldc.i4 1
sub
stloc i_b
ldstr "\n"
call void [mscorlib]System.Console::Write(string)

ldloc i_a
ldc.i4 1
add
stloc i_a
br IL_1085885983
IL_1248972688: nop
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

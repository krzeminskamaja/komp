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
dup
stloc i_a
pop
ldc.i4 1
dup
stloc i_b
pop
IL_1335548242: nop
ldloc i_a
ldc.i4 10
cgt
ldc.i4 0
ceq

brfalse IL_1793493100
ldloc i_a
call void [mscorlib]System.Console::Write(int32)

ldloc i_a
ldc.i4 1
add
dup
stloc i_a
pop
br IL_1335548242
IL_1793493100: nop
ldc.i4 1
dup
stloc i_a
pop
IL_1614380638: nop
ldloc i_a
ldc.i4 10
cgt
ldc.i4 0
ceq

brfalse IL_1330369771
ldloc i_a
call void [mscorlib]System.Console::Write(int32)

ldloc i_a
ldc.i4 1
add
dup
stloc i_a
pop
br IL_1614380638
IL_1330369771: nop
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

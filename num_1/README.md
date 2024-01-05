# Kotlin "Hello World!"

Since decades programmers start with "Hello World!". Why shoudn't we?

## Run "Hello World!" with kotlin

Let's compile it to Java Bytecode:
```shell
kotlinc HelloWorld.kt
```

Let's run it with the `kotlin` command.
```shell
kotlin HelloWorldKt
```

## Run "Hello World!" as a jar

To enable running our app without an installed kotlin, we simply include the batteries:

```shell
kotlinc HelloWorld.kt -include-runtime -d HelloWorld.jar
```

And then run it as any other Java jar:
```shell
java -jar HelloWorld.jar
```

## Compile to machine code

Kotlin can be compiled directly to native machine code on many architectures:

```shell
kotlinc-native HelloWorld.kt -o HelloWorld
```

Inspect our output and run it:
```shell
ldd HelloWorld.kexe
```

```shell
./HelloWorld.kexe
```

## Run a command line script

You want a scipting laguage? Here we go:

```
kotlin HelloWorld,kts
```


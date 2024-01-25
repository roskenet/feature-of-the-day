# Kotlin "Hello World!"

For centuries programmers start with "Hello World!". Why shouldn't we?

## Run it online:

https://play.kotlinlang.org

## Use the REPL
(Read Evaluate Print Loop)

```shell
❯ kotlin
Welcome to Kotlin version 1.9.10 (JRE 21+35)
Type :help for help, :quit for quit
>>> println("Hello World!")
Hello World!
>>> :quit
```

## Run a command line script

You want a scripting laguage? Here we go:

```
kotlin HelloWorld.kts
```

## Run "Hello World!" with kotlin

Let's compile it to Java Bytecode:
```shell
kotlinc HelloWorld.kt
```

And run it with the `kotlin` command.
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

Kotlin can be compiled directly to native machine code on many architectures. Download the native-compiler for your architechture.

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


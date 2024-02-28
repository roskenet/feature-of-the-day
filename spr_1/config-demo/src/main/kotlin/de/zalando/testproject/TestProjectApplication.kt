package de.zalando.testproject

import org.springframework.beans.factory.annotation.Value
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

fun main(args: Array<String>) {
    runApplication<TestProjectApplication>(*args)
}

@SpringBootApplication
class TestProjectApplication : CommandLineRunner {

    @Value("\${greeting.value}")
    lateinit var hello: String

    @Value("\${greeting.area}")
    lateinit var area: String

    override fun run(vararg args: String?) {
        println("In ${area} we say ${hello}")
    }
}

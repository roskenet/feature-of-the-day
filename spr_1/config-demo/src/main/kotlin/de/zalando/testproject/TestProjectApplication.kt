package de.zalando.testproject

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class TestProjectApplication : CommandLineRunner {

    @Autowired
    lateinit var thApp: HelloApp;

    override fun run(vararg args: String?) {
        thApp.sayHello()
    }
}

fun main(args: Array<String>) {
    runApplication<TestProjectApplication>(*args)
}

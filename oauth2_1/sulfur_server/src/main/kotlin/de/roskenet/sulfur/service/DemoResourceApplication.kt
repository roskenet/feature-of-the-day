package de.roskenet.sulfur.service

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity

@SpringBootApplication
class DemoResourceApplication

fun main(args: Array<String>) {
    runApplication<DemoResourceApplication>(*args)
}

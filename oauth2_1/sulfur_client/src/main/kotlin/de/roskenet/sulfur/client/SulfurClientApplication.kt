package de.roskenet.sulfur.client

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication

@SpringBootApplication
class SulfurClientApplication

fun main(args: Array<String>) {
    runApplication<SulfurClientApplication>(*args)
}

package de.zalando.testproject

import org.springframework.beans.factory.annotation.Value
import org.springframework.stereotype.Component

@Component
class MultilangHelloApp: HelloApp {

    @Value("\${greeting.value}")
    lateinit var hello: String

    @Value("\${greeting.area}")
    lateinit var area: String

    override fun sayHello() {
        println("In ${area} we say ${hello}")
    }

}
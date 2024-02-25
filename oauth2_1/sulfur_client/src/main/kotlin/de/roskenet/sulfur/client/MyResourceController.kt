package de.roskenet.sulfur.client

import org.springframework.http.ResponseEntity
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class MyResourceController {

    @GetMapping("/resource")
    fun getResource(): ResponseEntity<String> {
        return ResponseEntity.ok().body("Resource")
    }

}
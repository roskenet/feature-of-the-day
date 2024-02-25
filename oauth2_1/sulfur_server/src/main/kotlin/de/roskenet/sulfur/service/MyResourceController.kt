package de.roskenet.sulfur.service

import org.springframework.security.access.prepost.PreAuthorize
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class MyResourceController {

    @GetMapping("/element")
    @PreAuthorize("hasAuthority('SCOPE_email')")
    fun getMyResource(): Map<String, Any> {
        val hashMap = HashMap<String, Any>()
        hashMap.put("element", "sulphur")
        hashMap.put("atomic_number", 16)
        return hashMap
    }
}
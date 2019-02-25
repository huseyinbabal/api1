package com.huseyin.api1;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@Slf4j
@RestController
public class BookController {

    private final RestTemplate restTemplate;

    public BookController(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    @GetMapping("/books/{name}")
    public Book getBook(@PathVariable("name") String name) {
        log.info("Calling customer service...");
        Uuid isbn = restTemplate.getForObject("http://api2/customers/5", Uuid.class);
        return Book.builder().name(name).isbn(isbn.getUuid()).build();
    }

    @Data
    @Builder
    @NoArgsConstructor
    @AllArgsConstructor
    private static class Book {
        private String name;
        private String isbn;
    }

    @Data
    private static class Uuid {
        private String uuid;
    }
}

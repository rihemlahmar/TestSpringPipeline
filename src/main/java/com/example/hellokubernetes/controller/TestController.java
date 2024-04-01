package com.example.hellokubernetes.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.concurrent.atomic.AtomicLong;

@RestController
public class TestController {
    private static final String template = "Hello from %s!";
    private final AtomicLong counter = new AtomicLong();



    @GetMapping("/")
    public Greeting greeting() {
        return new Greeting(counter.incrementAndGet(), "hello");
    }

    static public class Greeting {
        public long id;
        public String content;

        public Greeting(long id, String content) {
            this.id = id;
            this.content = content;
        }
    }
}


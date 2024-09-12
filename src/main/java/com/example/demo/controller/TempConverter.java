package com.example.demo.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TempConverter {

    @GetMapping("/celsiusParaFahrenheit")
    public double celsiusParaFahrenheit (@RequestParam double grau) {
        return grau * 9 / 5 + 32;
    }

    @GetMapping("/fahrenheitParaCelsius")
    public double fahrenheitParaCelsius (@RequestParam double grau) {
        return (grau - 32) * 5 / 9;
    }
}

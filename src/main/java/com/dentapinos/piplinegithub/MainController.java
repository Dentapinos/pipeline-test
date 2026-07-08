package com.dentapinos.piplinegithub;

import io.swagger.v3.oas.annotations.media.Schema;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MainController {

    @Schema(name= "Получаем приветствие")
    @GetMapping("/")
    public String getHello() {
        return "<h1>Hello Deniska ya<h1>";
    }
}

package edu.berkeley.gpporgs.config;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
public class ClientForwardController {
    @GetMapping(value = "/**/{path:[^.]*}")
    public String forward(@PathVariable String path) {
        return "forward:/";
    }
}

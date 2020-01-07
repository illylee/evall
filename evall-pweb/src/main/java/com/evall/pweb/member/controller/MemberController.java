package com.evall.pweb.member.controller;

import com.evall.member.domain.Member;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class MemberController {

    @GetMapping("/member")
    public Member get() {
        return new Member("leeilly", "kyoungjin.illy@gmail.com", "illy");
    }

}

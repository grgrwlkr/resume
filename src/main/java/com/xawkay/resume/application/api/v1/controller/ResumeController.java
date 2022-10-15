package com.xawkay.resume.application.api.v1.controller;

import com.xawkay.resume.domain.resume.Resume;
import com.xawkay.resume.domain.resume.service.ResumeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.UUID;

@RestController
@RequestMapping("api/v1/resumes")
public class ResumeController {

    private ResumeService resumeService;

    @Autowired
    public ResumeController(ResumeService resumeService) {
        this.resumeService = resumeService;
    }

    @GetMapping("/resumes/{id}")
    public Resume getResume(@PathVariable UUID id) {
        return resumeService.getResume(id).orElse(new Resume());
    }
}

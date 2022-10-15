package com.xawkay.resume.infrastracture.configuration;

import com.xawkay.resume.ResumeApplication;
import com.xawkay.resume.domain.resume.repository.ResumeRepository;
import com.xawkay.resume.domain.resume.service.DomainResumeService;
import com.xawkay.resume.domain.resume.service.ResumeService;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackageClasses = ResumeApplication.class)
public class BeanConfiguration {

    @Bean
    ResumeService resumeService(final ResumeRepository resumeRepository) {
        return new DomainResumeService(resumeRepository);
    }
}
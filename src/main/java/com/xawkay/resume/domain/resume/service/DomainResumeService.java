package com.xawkay.resume.domain.resume.service;

import com.xawkay.resume.domain.resume.PersonalData;
import com.xawkay.resume.domain.resume.Resume;
import com.xawkay.resume.domain.resume.repository.ResumeRepository;

import java.util.Optional;
import java.util.UUID;

public class DomainResumeService implements ResumeService {

    private final ResumeRepository resumeRepository;

    public DomainResumeService(ResumeRepository resumeRepository) {
        this.resumeRepository = resumeRepository;
    }

    @Override
    public UUID createResume(PersonalData personalData) {
        return null;
    }

    @Override
    public Optional<Resume> getResume(UUID id) {
        return resumeRepository.findById(id);
    }

    @Override
    public void deleteResume(UUID id) {

    }
}

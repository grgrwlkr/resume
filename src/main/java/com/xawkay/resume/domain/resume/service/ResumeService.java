package com.xawkay.resume.domain.resume.service;

import com.xawkay.resume.domain.resume.PersonalData;
import com.xawkay.resume.domain.resume.Resume;

import java.util.Optional;
import java.util.UUID;

public interface ResumeService {
    UUID createResume(PersonalData personalData);
    Optional<Resume> getResume(UUID id);
    void deleteResume(UUID id);
}

package com.xawkay.resume.domain.resume.repository;

import com.xawkay.resume.domain.resume.Resume;

import java.util.Optional;
import java.util.UUID;

public interface ResumeRepository {
    Optional<Resume> findById(UUID id);

    void save(Resume resume);
}

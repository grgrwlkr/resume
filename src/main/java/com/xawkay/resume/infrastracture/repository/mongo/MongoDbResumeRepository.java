package com.xawkay.resume.infrastracture.repository.mongo;

import com.xawkay.resume.domain.resume.Resume;
import com.xawkay.resume.domain.resume.repository.ResumeRepository;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import java.util.Optional;
import java.util.UUID;

@Component
@Primary
public class MongoDbResumeRepository implements ResumeRepository {
    private final SpringDataMongoResumeRepository resumeRepository;

    public MongoDbResumeRepository(final SpringDataMongoResumeRepository resumeRepository) {
        this.resumeRepository = resumeRepository;
    }


    @Override
    public Optional<Resume> findById(UUID id) {
        return resumeRepository.findById(id);
    }

    @Override
    public void save(Resume resume) {
        resumeRepository.save(resume);
    }
}

package com.xawkay.resume.infrastracture.repository.mongo;

import com.xawkay.resume.domain.resume.Resume;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface SpringDataMongoResumeRepository extends MongoRepository<Resume, UUID> {
}

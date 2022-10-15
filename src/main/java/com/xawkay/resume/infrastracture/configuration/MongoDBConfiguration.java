package com.xawkay.resume.infrastracture.configuration;

import com.xawkay.resume.infrastracture.repository.mongo.SpringDataMongoResumeRepository;
import org.springframework.data.mongodb.repository.config.EnableMongoRepositories;

@EnableMongoRepositories(basePackageClasses = SpringDataMongoResumeRepository.class)
public class MongoDBConfiguration {
}

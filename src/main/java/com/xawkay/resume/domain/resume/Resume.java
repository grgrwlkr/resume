package com.xawkay.resume.domain.resume;


import java.util.List;
import java.util.UUID;

public final class Resume {
    private UUID id;
    private String professionalSummary;
    private PersonalData personalData;
    private List<EmploymentHistoryItem> employmentHistoryItems;
    private List<EducationItem> educationItems;
}

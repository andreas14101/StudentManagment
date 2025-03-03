# StudentManagment

this branch renames Grade to FinalGrade in a new Enrollment model called Enrollment_V1_1

I chose this approach because it is nondestructive and makes sure that all other services can still access grade date while the enrollment data gets migrated to the newer version, although other services will have to do all database operations for Enrollment on both the old and new versions until migration is completed across all services then you can drop the old Enrollment model.
I could have just renamed the attribute but that would have been destructive and result in us having to wait to publish this feature to the users
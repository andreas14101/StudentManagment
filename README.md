# StudentManagment

this branch changes the course variable credits to be a decimal with the precision of (5,2).

I made a new Course model called Course_v1_1 and a new enrollment model as well called Enrollment_v1_1,
the reason for the two models are to make sure that the change to the course model does not affect the availability of data in other services after migrating the database,
you would have to do any action on both the old and new both of models that were changed, I could have just made it a credits a different data type, but I wanted to insure both data availability and data integrate.
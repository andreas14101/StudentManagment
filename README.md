# StudentManagment

this branch adds the Instructor model and gives Course a relation to said Instructor model although nullable at the start to ensure that all the old data can still be used and when an instructor has been added to all courses then you can change instructor to not be nullable, you could have a default and just edit it with the correct information after migrating the database
# SSIS-Packages

## Main reason that I need to build this logic was:

1. Replicating into same table from various of sources without losing data
2. Avoiding duplication.
3. Running packages in parallel.
4. Interactive master packages with child packages.
5. Logging all activities of all master-child packages in understandable format.
6. Sending summary of replication via email notifications with logs after job complete (Not ready yet)

## If you need same, then can use this one. I hope it will save your time.

If do you want to learn more before downloading, please continue to read.


## SSIS packages
1. One Landing package
   - Gathering data from source as it is. It has a basic truncate insert steps.
2. Master package for landing packages
   - For executing all landing packages by one single master package.
3. One Staging package
   - It moves data from landing to staging area as it is. But with correct data types. Before moving data into warehouse, preparing data into correct format.
   - And additionally, calculating hash values for eliminating duplication before moving data into warehouse. Email is unique in my sample, and i calculate a hash value of email and hash value of rest of columns(firstname+lastname+address...). This is similar approach of Enterprise Data Warehouse(EDW) model. So if you want to use multiple source, you must have a unique key like Email instead of identity ID columns.
4. Master package for staging packages
   - For executing all staging packages by one single master package.
5. One Warehousing package
   - It is place to cleaning, transforming and loading data into warehouse. I put a sample about loading unique data into a system versioned table. But you can use any task as you need. Also I didn't use but, you can use Hub, Satellite and Link tables like defined in EDW approach.
6. Master package for warehousing package
   - For executing all warehousing packages by one single master package.
7. Master package for all Master packages
   - For executing all Master packages by one single master package.

## Database Solutions
1. Replication database solution
   - I like to keep log and setting into separate db but if you like, you can move items that db has into another common database. It is like configuration db for all jobs that you have.
2. Target database solution
   - It is main database where we keep data. I created a sample for you but you can build same structure into your original db.
   - There is system versioned table sample, but you can ignore it and use traditional table. It will not affect Replication.
3. Source database solution
   - A sample database with a single table for you test in first time.

## Steps you need to follow are:


Publish Database solutions on your dev environment and edit replication packages as you wish.
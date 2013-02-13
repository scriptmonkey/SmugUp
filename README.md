#SmugUp

##Smugmug Image Uploader

Eventually this will be a command line image uploader to Smugmug.  This script will traverse the current directory, recursively, upload all images not previously uploaded.




##things to think about:
There is an ugly smelly test in the configuration_spec.  Need to think about the best way to clean that up.

A way to make sure that this script has the proper authoriztion.

If I am traversing a Mac Pictures folder, I do not want to upload the thumbs.

##things I thought about:
- I have to understand how imporant it is to keep the API-key and API-seceret private.  I am concerned they will become public if I put them in the script and publish.  I have learned that they are imprtnat to keep secure.  This means everyone who wants to use this script will have to have thier own set of API key and API secret.

- Decide how to save the Oauth tokens for future use.  ( I could create a ~/.smugup folder to put the keys and other info in )  Will save them in ./smugup as a default.



##currently working on:
- Making the connection to SmugMug.  Currently have the connection to test for valid API key and API secret.
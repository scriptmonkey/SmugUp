#SmugUp

##Smugmug Image Uploader

Eventually this will be a command line image uploader to Smugmug.


##things to think about:
- Figure out how to make VCR work along with webmock to test the Smugmug connections.

- I have to understand how imporant it is to keep the API-key and API-seceret private.  I am concerned they will become public if I put them in the script and publish.

- Decide how to save the Oauth tokens for future use.  ( I could create a ~/.smugup folder to put the keys and other info in )



##currently working on:
- creating a confifuration object to hold all the global configuration from the config file.
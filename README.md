#Setup terraform
Download latest version of terraform from https://www.terraform.io/downloads.html

#set up on local machine 
# Mac 
extract and copy to local dir to make it available for terminal
  ```mv terraform /usr/local/bin```

# Create AWS profile 
  create directory .aws
  vi .aws/credentials 
  #add below entry
  [demo]
  aws_access_key_id=<aws_access_key>
  aws_secret_access_key=<aws-secret>
 # Go to the dir where terraform script are created for your project  and run below commands to create instance on aws
 # Run init once
 ```terraform init``` 
 
 ```$ terraform plan``` 
 ```$ terraform apply```
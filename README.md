# GCP-task
# Abdallah GCP-Final-Project
### Build Docker image for the pyhton app from the Dockerfile, and upload the image to gcr
  * $ docker build -t python_image .
  * $ docker tag pyton_image:v1 gcr.io/abdallah-iti/python_app_image:v1
  * $ docker push gcr.io/abdallah-iti/python_app_image:v1
### Pull another redis image from docker hub then push it to gcr
  * $ docker pull redis
  * $  docker tag redis   gcr.io/abdallah-devops-iti/redis_image
  * $  docker push  gcr.io/abdallah-devops-iti/redis_image
### Check that the images had been pushed
![home_Page Image](https://github.com/Abdalla1297/GCP-task/blob/main/pic/1.png)
 
### Now You can run terraform code
  * $ terraform init
  * $ terraform plan
  * $ terraform apply
### After vm cereation
 ## U must pass the yaml files to it 
  # U can use this code 
  * $ gcloud compute scp --recurse hame/username/gcp-test1/kube_files/ private-vm-instance:~  --zone"us-east4-b"   --tunnel-through-iap 
  # --recurse after it the path of your yaml file
  # And after the space is the destination and it the vm name and : the path on it
  # --zone the zone that your vm on it
### Now SSH To your vm 
 ## check that the files here useing (ls) command
 ## SSh Form Your Vm to the Cluster
 ## After that Run Your Yaml Files
 ## U can use this command 
 * $ kubectl create -Rf kube_files
 ## After that Run this Command to get the loadbalancer ip 
 ## U can use this command
 * $ kubectl get svc
### Copy the ip and open it in Ur browser
![home_Page Image](https://github.com/Abdalla1297/GCP-task/blob/main/pic/2.png)

  


 
  

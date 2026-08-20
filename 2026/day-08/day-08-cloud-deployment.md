# Deploy a real web server on the cloud 
* Step 1 : Launch an instance from AWS console.

* Step 2 : Connect to instance using ssh.
    
- Command : `ssh -i "devops-ai-powered2.pem" ubuntu@ec2-54-151-14-4.us-west-1.compute.amazonaws.com`

* Step 3 : Install Nginx

- Command : `sudo apt update` and `sudo apt install nginx`
- Configure security groups for web access. From the AWS console, go to the security group and add an inbound rule for port 80 (default for Nginx).
    
* Step 4 : Check logs of nginx service

- Command : `journalctl -u nginx`

* Step 5 : Save logs to file

- Command : `ssh -i "devops-ai-powered2.pem" ubuntu@ec2-54-151-14-4.us-west-1.compute.amazonaws.com:/var/log/nginx/access.log .`
    
- `ssh -i "devops-ai-powered2.pem" ubuntu@ec2-54-151-14-4.us-west-1.compute.amazonaws.com:~/journalctl.log .`
    
## Installing Docker

- Command:  `sudo apt install docker.io`
- Logs: `journalctl -u docker`

## Challenges Faced

* ssh vs scp : I initially used ssh when trying to download a file. I learned that: `ssh` → Connect to a remote server and `scp` → Copy files between local and remote systems.
* File permission issue: I couldn't directly copy /var/log/nginx/access.log as a normal user, so i copied it to my home directory and changed its ownership using cp and chown.
* Webpage access issue: I initially opened only the EC2 IP address instead of including the HTML filename. I resolved it by accessing http://54.151.14.4/webpage.html. (Wanted to host a web page)

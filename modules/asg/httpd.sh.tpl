#!/bin/bash
sudo yum -y update
sudo yum -y install httpd
sudo systemctl start httpd
sudo systemctl enable httpd
myip=`curl http://169.254.169.254/latest/meta-data/local-ipv4`

echo "<html>
<head>
    
    
</head>
<body>
    <h1>Hello!</h1>
    <h4>Group Members</h4>
    <h4>Bibek Shrees</h4>
    <h4>Kartik Sharma</h4>
    <h4>Rajvi Khatri</h4>
    <h4>Sanjam Malhotra</h4>
    <img src="/var/www/html/TimeTable.jpg" />
</body>
</html>" > /var/www/html/index.html

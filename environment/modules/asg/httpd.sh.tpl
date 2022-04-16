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
   <li color"pink">Bibek Shrees</li>
    <li color"pink">Kartik Sharma</li>
    <li color"pink">Rajvi Khatri</li>
    <li color"pink">Sanjam Malhotra</li>
    <img src="/var/www/html/TimeTable.jpg" />
</body>
</html>" > /var/www/html/index.html

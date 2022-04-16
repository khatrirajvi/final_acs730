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
    <ul>
   <li>Bibek Shrees</li>
    <li>Kartik Sharma</li>
    <li>Rajvi Khatri</li>
    <li>Sanjam Malhotra</li>
    </ul>
    <img src="/var/www/html/TimeTable.jpg" />
</body>
</html>" > /var/www/html/index.html

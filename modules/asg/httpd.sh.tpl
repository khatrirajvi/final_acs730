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
    <ul>Group Members</ul>
    <li color"blue">Bibek Shrees</li>
    <li color"blue">Kartik Sharma</li>
    <li color"blue">Rajvi Khatri</li>
    <li color"blue">Sanjam Malhotra</li>
    <img src="/var/www/html/TimeTable.jpg" />
</body>
</html>" > /var/www/html/index.html

#!/bin/bash
sudo apt-get update

sudo apt-get install -y apache2
hostnamectl set-hostname Web
INSTANCEID=$(curl http://169.254.169.254/latest/meta-data/instance-id)
REGION=$(curl http://169.254.169.254/latest/dynamic/instance-identity/document | grep region | awk -F\" '{print $4}')
HOSTNAME=$(curl http://169.254.169.254/latest/meta-data/hostname)
AMI=$(curl http://169.254.169.254/latest/meta-data/ami-id)
IP=$(curl http://169.254.169.254/latest/meta-data/local-ipv4)

cat  > /var/www/html/index.html <<EOL
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="my.css" />
<title>Joe's Sample Website</title>
<body>
<div id="box">
<h1>Region: $REGION</h1>
<p><strong>InstanceId:</strong> <span style="color: red;"> <strong>$INSTANCEID</strong></span></p>
<p><strong>Hostname:</strong> <span style="color: red;"> <strong>$HOSTNAME</strong></span></p>
<p><strong>AMI:</strong> <span style="color: red;"> <strong>$AMI</strong></span></p>
<p><strong>Private IP:</strong> <span style="color: red;"> <strong>$IP</strong></span></p>
</div>
</body>
</html>
EOL
cat > /var/www/html/my.css <<EOL
@charset "UTF-8";
/* CSS Document */
 body
{
    height: 220px;
}
#box 
{
    width: 600px;
    padding-left: 20px;
    margin-left: auto;
    margin-right: auto;
    height:100%;
    border:1px solid #8D8D8D;
}
EOL

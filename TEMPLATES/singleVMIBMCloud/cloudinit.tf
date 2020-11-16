
# Create CloudInit section
# Install Apache web server, copy index.html to avoid 403 http code
# Record final msg in /var/log/cloud-init.log

# package_upgrade not set to true. Avoids long execution time in demo mode. 
# base64_encode and gzip set to false as not supported by IBM Cloud

data "template_cloudinit_config" "app_userdata" {
  base64_encode = false
  gzip          = false

  part {
    content = <<EOF
#cloud-config
manage_etc_hosts: true
package_upgrade: false
packages:
- httpd
runcmd:
- 'cp /usr/share/httpd/noindex/index.html /var/www/html' 
- 'systemctl start httpd'
final_message: "The system is finally up, after $UPTIME seconds"
EOF

  }
}

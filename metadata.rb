maintainer       "Robert J. Berger"
maintainer_email "rberger+maintainer@ibd.com"
license          "Apache License, Version 2.0"
description      "Installs/Configures vsftpd for Secure SSL SFTP"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.rdoc'))
version          "0.0.2"

recipe "vsftp::default", "Install/configure vsftp FTP Server."

attribute 'vsftpd/chroot_local_user',
  :display_name => "vsftpd Chroot Local User",
  :description => "If set to ‘YES’, then the chroot_list_file (contents of vsftpd[:chroot_users]) will specify list of local users to NOT chroot their home directories. If set to “NO” the users in chroot_list_file will have their home directories chroot’d. Default: YES.",
  :choice => [ 'YES', 'NO' ],
  :type => "string",
  :required => "recommended",
  :recipes => [ 'vsftp::default' ],
  :default => "YES"

attribute 'vsftpd/chroot_users',
  :display_name => "vsftpd Chroot Users",
  :description => "Optional list of local usernames to be put in the chroot_list_file (/etc/vsftpd.chroot_list) file. Default: empty.",
  :type => "string",
  :required => "optional",
  :recipes => [ 'vsftp::default' ]

attribute 'vsftpd/ssl_cert_path',
  :display_name => "vsftpd SSL Certificate Path",
  :description => "The pathname of the directory that the ssl cert file should live. Default: /etc/ssl/certs.",
  :type => "string",
  :default => "/etc/ssl/certs",
  :required => "optional",
  :recipes => [ 'vsftp::default' ]

attribute 'vsftpd/ssl_private_key_path',
  :display_name => "vsftpd SSL Private Key Path",
  :description => "The pathname of the directory that the ssl private key file should live. Default: /etc/ssl/private.",
  :type => "string",
  :default => "/etc/ssl/private",
  :required => "optional",
  :recipes => [ 'vsftp::default' ]

attribute 'vsftpd/ssl_certs_basename',
  :display_name => "vsftpd SSL Certificate Base Name",
  :description => "Base name of the ssl cert PEM file and ssl private key filenames. Default: ‘ftp.example.com’ You will want it to be the FQDN of your host that you used to create the certs.",
  :type => "string",
  :default => "ftp.example.com",
  :recipes => [ 'vsftp::default' ]

attribute 'vsftpd/use_ssl_certs_from_cookbook',
  :display_name => "vsftpd Use SSL Certs from Cookbook",
  :description => "If set, you must have the ssl public and private cert files in the cookbook’s files directory. Default: true.",
  :type => "string",
  :default => "true",
  :recipes => [ 'vsftp::default' ]
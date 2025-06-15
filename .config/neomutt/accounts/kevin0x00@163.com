#IMAP

set my_my_address = "kevin0x00@163.com"

set imap_user = $my_address
set imap_send_id = yes
set imap_pass = `gpg --decrypt ~/password/email/kevin0x00@163.com`

set folder = "imaps://imap.163.com"
set spoolfile = "+INBOX"

#  SMMTP
set realname = kevin
set from = $my_address
set smtp_url = "smtp://$my_address@smtp."

# vim: ft=neomuttrc

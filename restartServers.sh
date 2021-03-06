#!/usr/bin/expect 

stty -echo
send_user -- "Password : "
expect_user -re "(.*)\n"
send_user "\n"
stty echo
set pw $expect_out(1,string)

set f [open "hosts.txt"]
set hosts [split [read $f] "\n"]
close $f

foreach host $hosts {
    spawn ssh -oStrictHostKeyChecking=no hostname@$host
    expect "Password*"
    send "$pw\r"
    expect "*~$*"
    send "sudo -S service tomcat7 restart\r"
    expect "*password for hostname:"
    send "$pw\r"
    expect "*~$*"
    send "exit\r"
    expect eof
}


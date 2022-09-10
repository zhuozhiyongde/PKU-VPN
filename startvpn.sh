#!/usr/bin/expect

## 将 *** 替换为你电脑的开机密码
set root_pwd ***
## 将 *** 替换为你的IAAA账号（学号）
set pku_stu_id ***
## 将 *** 替换为你的IAAA密码
set pku_stu_pwd ***

spawn sudo openconnect --protocol=nc https://vpn.pku.edu.cn

expect "Password:"
send "$root_pwd\r"

expect "username:"
send "$pku_stu_id\r"

expect "password:"
send "$pku_stu_pwd\r"

interact

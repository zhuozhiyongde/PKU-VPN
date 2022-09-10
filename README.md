# 前言

受够了Pulse Secure的丑陋界面、不兼容ClashX、老是开机重启然后以其巨丑的图标大大咧咧占据我的菜单栏的各种问题，但因为自己技术过菜，也不知道怎么绕过这个程序启动北大VPN，前段时间在Github上看见了[这个项目](https://github.com/PKUfudawei/pkuvpn/)，下载试了试发现真的可以用，并且完全可以做到和ClashX同时开启（同时挂梯子+学校VPN），于是在此记录一下。

在使用前，请确保你已经**细心且完全**地阅读了此文档，**包括Q&A部分**。

# 配置方式

1. clone本项目到本地，然后更改 startvpn.sh 中的开机密码、IAAA用户名、IAAA密码。

2. 将整个文件夹（保证文件夹命名为PKU-VPN）复制到你的`~/`目录下

3. 在终端输入如下指令：

   ```shell
   echo "\nstartvpn () {\n    exec ~/PKU-VPN/startvpn.sh\n}\nstopvpn () {\n    exec ~/PKU-VPN/stopvpn.sh\n}" >> ~/.zshrc
   ```

   ，将 `startvpn` 和 `stopvpn`两个函数写入你的`.zshrc`中，方便日后调用。

4. 在终端输入 `brew install openconnect` 下载openconnect库。

4. 输入 `source ~/.zshrc` 重载你的配置。



# 使用方式

* 连接VPN：在终端输入 `startvpn`，即可。连接过程中需要保持窗口开启。
* 断开VPN：首先，使用 `ctrl+C` 终止VPN链接进程。然后重新打开一个终端窗口，输入 `stopvpn`即可。

# Q&A

## 输入 `startvpn`后，程序直接终止并退出？

这是因为 `startvpn.sh`缺少可执行权限所致。请在终端键入：

```shell
chmod +x ~/PKU-VPN/startvpn.sh; chmod +x ~/PKU-VPN/stopvpn.sh
```

如上完成后，即可正常使用。

## 断开VPN后，失去网络连接？

这点原因我尚且不清楚，可能是 `openconnect` 这个库导致的问题，在实际测试后，我发现只需要断开网络重新连接即可，也正是为此，我比原项目多写了一个 `stopvpn.sh` 来自动化这个过程（其实质功能就是断开网络、然后重新连接，说实话多少有点无奈）。

如果有大佬知道原因，欢迎联系我以改进这个项目。
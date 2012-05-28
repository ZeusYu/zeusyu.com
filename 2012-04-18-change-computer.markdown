---
layout: post
title: "mac下ruby环境搭建"
date: 2012-04-18 21:47
meta: true
comments: true
tags: mac ruby rvm
---
前一阵子换了新电脑，一直在忙其他的事情，再加上贪玩打了一遍《质量效应3》，把程序方面的学习给落下了。这会儿稍稍空点了，还是继续上路吧。
换了电脑以后，之前熟悉的windows不见了，遇上了据说很方便的mac，什么都得重头搞起，第一件事就是架环境。听说用rvm安装ruby很方便，于是搜了个教程跟着做。
<!--more-->
##1.安装git
前往[http://code.google.com/p/git-osx-installer/](http://code.google.com/p/git-osx-installer/downloads/list?can=3&q=&sort=-uploaded&colspec=Filename+Summary+Uploaded+Size+DownloadCount)下载Git，直接搞个dmg包，打开安装即可，整个过程算是最顺利的了。
##2.安装rvm
在终端里执行  
`bash < <( curl http://rvm.beginrescueend.com/releases/rvm-install-head )`  
为了能在只能在终端中使用，照着教程在用户配置文件/Users/username/.profile里加上了  
`[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.` 
##3.安装Xcode
本来根据找到的教程是没有这一步的，但是我用rvm的命令安装ruby时，总是无法编译，看了日志才知道是mac系统太高，lion下没有GCC造成的，原本想单独下一个，但是由于水平太低，对这玩意儿不熟，没敢搞，还是安安稳稳下个xcode吧。  
这里，我抱着追新的态度，下了xcode 4.3.2，安装后发现还是无法编译，借了个开发者账号下了command line tools 都不管用。唉还是不折腾了，最后还是卸掉了4.3.2的版本，装了xcode4.1，这才算过了编译。
##4.安装ruby
重启终端后，就开始用rvm装ruby了
`rvm install 1.9.3`

本来，到这里ruby环境算是搞定了。但是当我进入irb开始试用的时候发现，在终端里输入中文遇到点问题，无论怎么输，就是不能正常显示，不是显示utf码，就是啥都没有。又得拜托谷歌大神了。根据说明得依靠readline。在终端里输入  
`rvm pkg install readline`  
`rvm reinstall 1.9.3 --with-readline-dir=$rvm_path/usr`  
重新编译了一遍，这才解决了这个问题。  

余下的设定默认ruby版本  
`rvm use ruby 1.9.2 -default`  
更新rubygems  
`rubygems gem update --systme`  
修改Rubygems的源  
`gem sources --remove http://rubygems.org/`  
`gem sources -a http://ruby.taobao.org/`

好吧，千辛万苦之后算是在mac下配好了基本环境。rails啥的还是放在以后再研究吧。


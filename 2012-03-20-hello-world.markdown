---
layout: post
title: "像黑客一样写博客"
date: 2012-03-20 21:00
meta: true
comments: true
tags: GitHub Octopress 
---
标题摘自网上对Octopress的评价。自从从同事那里得知了有这么一个东西的存在以后，出于对免费事物的莫名爱好和对之前自己写的乱七八糟东西的不满，一直想在GitHub上重头搭一个博客玩玩，但由于才疏学浅，完全写不来前端代码，看着同事的博客心痒痒。正好，前几天同事开源了他的博客主题，于是，直接拿来用，在这里，谢谢[wǒ_is神仙](http://mrzhang.me/ "wǒ_is神仙")童鞋。  
<!--more-->
这边搭建的版本是基于[wǒ_is神仙](http://mrzhang.me/ "wǒ_is神仙")童鞋[Fork的Octopress](https://github.com/jsw0528/octopress/tree/mrzhang_me/)，与原始版本的的区别如下：  

1. [.Rvmrc](https://github.com/jsw0528/octopress/blob/mrzhang_me/.rvmrc)  
神仙同学用的是Ruby1.9.3，Octopress最低要求1.9.2

2. [Gemfile](https://github.com/jsw0528/octopress/blob/mrzhang_me/Gemfile)  
源改成了ruby.taobao.org的，去掉了部分gem的版本号限制

3. [Rakefile](https://github.com/jsw0528/octopress/blob/mrzhang_me/Rakefile)  
用haml替换了markdown，修改了时区，降低主题对custom目录的依赖

4. [_config.yml](https://github.com/jsw0528/octopress/blob/mrzhang_me/_config.yml)  
定制化配置信息，日期格式、永久链接、微博等等

5. [Plugins/sh_js.rb](https://github.com/jsw0528/octopress/blob/mrzhang_me/plugins/sh_js.rb)  
代码高亮插件

6. [Plugins/tag_generator.rb](https://github.com/jsw0528/octopress/blob/mrzhang_me/plugins/tag_generator.rb)  
支持中文的Tag插件

7. [.Themes/blog/](https://github.com/jsw0528/octopress/blob/mrzhang_me/.themes/blog/)  
神仙同学的博客主题  

但是，处于我本地的一些情况和个人使用习惯还是对它做了点改动，

在.rvmrc文件中修改了ruby版本  

rvm use 1.9.2

在Rakefile中换回了markdown  

new_post_ext = "markdown"  
new_page_ext = "markdown"  
（咦，怎么有种绕弯子的感觉……）

安装、部署博客还是比较简单的，无非是先用git把神仙同学的代码迁到本地，修修改改之后放到github上，绑个域名就OK了。这方面，[wǒ_is神仙的博客](http://mrzhang.me/blog/blog-equals-github-plus-octopress.html) 上已经有比较详细的介绍了，这里我也不再摘抄了。  
但是-作为一个老土的windows用户，在本地运行博客的过程中我还是遇到了不少的问题。

1. `bundle install` 失败  
这里的问题主要是由于我对Octorpress的不了解造成的因为Octorpess有一个gem是需要从github上迁下来的，而我本地没有相关的工具支持。通过在本地安装配置git客户端，这个问题得到了解决

2. `rake new_post`后`rake generate` 失败  
这是windows上跑Ruby的老问题了,由于我写博客的时候用了中文，编码问题又冒了出来。解决方法有两步，先设定windows的环境变量，增加  
LANG=zh_CN.UTF-8  
LC=zh_CN.UTF-8  
再把生成的markdown文件存为utf8格式（UTF-8无BOM编码格式）。

（我在网上查找过有关Octorpress的一些材料，据说在windows下还有许许多多的问题，不过目前我还没有碰到其他比较恶心的毛病，如果有的话，到时候继续想办法搞定吧）
好了，新博客搭好了，我也算迈入“黑客”的行列了吧，嗯，要开始认真地写些东西了。


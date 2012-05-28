---
layout: post
title: "小修改"
date: 2012-03-22 22:29
meta: true
comments: true
tags: octpress blog
---
这两天趁着新鲜劲，对博客做了些小小的改动。

1. 左侧增加了google+的链接图标
2. 用[多说](http://duoshuo.com/)取代[Disqus](http://disqus.com)作为博客的评论系统
3. 正式把域名[ZeusYu.com](http://zeusyu.com,"zeusyu.com")指了过来。

增加图标本来很容易，根据模板的写法，在`\.themes\blog\source\_includes\social-links.html`和`_config.yml`里增加对应的代码，但麻烦在于为了保持图标的一致性，我得搞一个相同风格的svg文件，在网上遍寻不到的情况下，只好硬着头皮搜索了一下AI的简单用法，自己画了一个，勉强凑上，刚把图放上去的时候，图标的位置有些诡异，在`\.themes\blog\sass\screen.scss`里增加相关的样式以后才正常，以后要继续增加其他图标，如法炮制即可。

至于更换评论系统，完全是因为[九间](http://smalloranges.net)童鞋的建议，毕竟我们能不能登录[Disqus](http://disqus.com)开始评论，完全要看方校长的G.F.W心情如何。虽然[多说](http://duoshuo.com/)也存在这一些小毛病（修改个人资料有点问题、彻底删除评论没反应，不知道是不是偶然，过几天再看看），但至少主要功能还算正常，先这样吧。

[ZeusY.com](http://zeusyu.com，"zeusyu.com")指过来以后，原先在[Tumblr](http://tumblr.com)上的博客就只能用二级域名[ZeusYu.tumblr.com](http://zeusyu.tumblr.com/)了,上面难得有几篇对自己之前工作有些帮助的东西也懒得搬过来了，以后看着更新吧~
---
layout: post
title: "使用ruby批量制作二维码"
date: 2012-05-28 20:59
meta: true
comments: true
tags: ruby QRCode 实用小脚本
---
随着移动互联网和智能手机的迅猛发展，[QRCode](http://en.wikipedia.org/wiki/QRcode)作为一种常见的二维码，也越来越多得被应用于各个场所。最近，公司这边有个业务需要用到大量的QRcode，对于这个简单的应用，也没必要麻烦开发人员，直接搞起~

制作QRcode其实说起来也容易，本质上就是将一些文本，按照约定好的格式，编码成图形（比如最近大热的二维码名片，其实就是用[vCard](http://en.wikipedia.org/wiki/Vcard)的格式将个人信息编码），在与实际应用二维码的具体程序开发人员约定好内容格式（就是一个字符串，用逗号分隔不同信息）后就可以开始二维码的制作了。

<!--more-->

制作二维码有很多种方法：  

1. 使用网上多如牛毛的在线工具  

2. 使用网上下载到的本地工具

3. 调用谷歌的[在线api](https://developers.google.com/chart/infographics/)

但这几种方法都有各自的不足。  

1. 在线工具大多都应用于更简单的场景，用于制作少量二维码，方便在于内置了多种约定好的格式，但对于批量生产缺乏支持

2. 找来找去，能下载到的批量生产工具基本上都是一个软件，虽然能生成二维码，但是由于设置极为坑爹，导致生成的图片一来尺寸过小，而来还存在中文乱码的情况，因此也只能放弃。

3.  调用谷歌的在线api看上去是个不错的选择，只要写两句简单的函数调用，就能达到批量生成二维码的目的，可惜托方校长的福，程序需要挂个vpn或者代理才能稳定工作，这显然不够方便。

所以，我们选择了第4种方案，上[rubygems.org](rubygems.org)找现成的gem包（别怪我懒，代码盲真心看不懂QRcode的编码算法），哇，万能的ruby社区提供了许多相关的gem包，有生成QRcode的[rqrcode](http://rubygems.org/gems/rqrcode)，更有直接将生成的QRcode转存成png图片的[rqrcode_png](http://rubygems.org/gems/rqrcode_png)，万事具备，开始。
首先，先把需要转成QRcode的用户信息保存在123.csv文件中，一行一个用户，各个信息间用“,”分隔。

{% sh :ruby %}
require 'rubygems'
require 'url_safe_base64' #用于加密手机号码，避免直接通过扫描二维码获得导致的用户个人信息泄露
require 'rqrcode_png'
names = []
mobiles = []
hospital = []
major = []
zc = []
File.readlines('123.csv').each do |line| #逐行读入用户信息
  a = line.split(',')
  xm.push(a[0])
  yy.push(a[1])
  ks.push(a[2])
  zc.push(a[3])
  dh.push(a[4]) #将不同类型的用户数据压入数组的不同位置
end

dh.each_with_index do|v,k|
  qr = RQRCode::QRCode.new("#{xm[k]},#{yy[k]},#{ks[k]},#{zc[k]},"+Base64.encode64(v),:size => 5,:level => :l) #size、level是QRcode的配置，根据需求可做调整（level：l,m,q,h;size<=14）
  png = qr.to_img #生成图片
  png.resize(320,320).save("/Users/maclion/Desktop/QRcode/#{xm[k]}.png") #保存图片
end
{% endsh %}

运行一下，就在桌面QRcode目录下生成了一大对二维码图片。

当然，事情永远不会那么简单，以上代码在ruby1.9.3下报错，说是文件编码有问题，但是换了ruby1.8.7环境却跑通了，这点说啥我也想不通，留作以后再考虑吧。
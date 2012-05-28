# coding: utf-8
require 'rubygems'
require 'url_safe_base64'
require 'rqrcode_png'
names = []
mobiles = []
hospital = []
major = []
zc = []
File.readlines('123.csv').each do |line|
 #puts line
 a = line.split(',')
 names.push(a[0])
 hospital.push(a[1])
 major.push(a[2])
 zc.push(a[3])
 mobiles.push(a[4])
end

mobiles.each_with_index do|v,k|
  #qr = RQRCode::QRCode.new(Base64.encode64(v),:size => 4,:level => :l)
  qr = RQRCode::QRCode.new("#{names[k]},#{hospital[k]},#{major[k]},#{zc[k]},"+Base64.encode64(v),:size => 5,:level => :l)
  png = qr.to_img
  png.resize(320,320).save("/Users/maclion/Desktop/#{names[k]}.png")
end

#2.times do |t|
#  File.open("c:\\#{name[t]}.txt",'w') do |f|
#    #f.puts "name:#{name[t]}\nmobile:#{mobile[t]}"
#    f.puts Base64.encode64 mobile[t]
#  end
#end

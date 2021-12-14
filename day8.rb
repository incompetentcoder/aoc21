pp a=File.open("input8.txt").readlines.map {|x| x.split("| ")[1].scan(/\w+/).map{|y| y.length}}.flatten.tally.select {|z| [2,3,4,7].include?(z)}.values.sum

require 'pry'
res=0
a=File.open("input8.txt").each_line do |x|
  x=x.scan(/\w+/).map{|y| y.chars.sort}
  b={}
  b[1]=x[0..-5].select{|y| y.length==2}[0]
  b[7]=x[0..-5].select{|y| y.length==3}[0]
  b[4]=x[0..-5].select{|y| y.length==4}[0]
  b[8]=x[0..-5].select{|y| y.length==7}[0]
  b[6]=x[0..-5].select{|y| y.length==6 && (y - b[1]).length == 5}[0]
  b[9]=x[0..-5].select{|y| y.length==6 && (y - b[4]).length == 2}[0]
  b[0]=x[0..-5].select{|y| y.length==6 && y!=b[6] && y!=b[9]}[0]
  b[5]=x[0..-5].select{|y| y.length==5 && (b[6] - y).length == 1}[0]
  b[3]=x[0..-5].select{|y| y.length==5 && y!=b[5] && (b[9] - y).length == 1}[0]
  b[2]=x[0..-5].select{|y| y.length==5 && y!=b[5] && y!=b[3]}[0]
  c=b.invert
  res+= x[-4..-1].map{|y| c[y]}.join.to_i
end
pp res

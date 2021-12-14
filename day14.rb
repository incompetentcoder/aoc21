require 'pry'

b={}
start=[]
count=0
a=File.open("input14.txt").readlines.each {|x| y=x.scan(/\w+/);y.length>1 ? b[y[0].chars]=y[1] : (start=y[0].chars if y[0])}
start=(start+[" "]).each_cons(2).tally
10.times do
  boo=start.dup
  start.each do |x|
    if b[x[0]]
    if boo[[x[0][0],b[x[0]]]]
      boo[[x[0][0],b[x[0]]]]+=start[x[0]]
    else
      boo[[x[0][0],b[x[0]]]]=start[x[0]]
    end
    if boo[[b[x[0]],x[0][1]]]
      boo[[b[x[0]],x[0][1]]]+=start[x[0]]
    else
      boo[[b[x[0]],x[0][1]]]=start[x[0]]
    end
    boo[x[0]]-=start[x[0]]
    end
  end
  start=boo
end
pp ("A".."Z").map {|y| [y,start.select{|x| x[0].include?(y)}.values.sum]}.delete_if{|x| x[1]==0}.minmax_by{|x| x[1]}.reduce {|x,y| y[1]-x[1]}

30.times do
  boo=start.dup
  start.each do |x|
    if b[x[0]]
    if boo[[x[0][0],b[x[0]]]]
      boo[[x[0][0],b[x[0]]]]+=start[x[0]]
    else
      boo[[x[0][0],b[x[0]]]]=start[x[0]]
    end
    if boo[[b[x[0]],x[0][1]]]
      boo[[b[x[0]],x[0][1]]]+=start[x[0]]
    else
      boo[[b[x[0]],x[0][1]]]=start[x[0]]
    end
    boo[x[0]]-=start[x[0]]
    end
  end
  start=boo
end
pp ("A".."Z").map {|y| [y,start.select{|x| x[0].include?(y)}.values.sum]}.delete_if{|x| x[1]==0}.minmax_by{|x| x[1]}.reduce {|x,y| y[1]-x[1]}


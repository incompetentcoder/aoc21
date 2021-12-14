a=File.open("input1.txt").readlines.map{|x| x.to_i}
pp a.each_cons(2).select{|x,y| y>x}.size
pp a.each_cons(3).map {|x| x.reduce:+}.each_cons(2).select{|x,y| y > x}.size

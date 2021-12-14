a=File.open("input7.txt").read.scan(/\d+/).map(&:to_i).sort
mid = a.length.even? ? a[(a.length/2 -1 + a.length/2)/2] : a[a.length/2]
pp a.map {|x| (mid-x).abs}.sum

a=File.open("input7.txt").read.scan(/\d+/).map(&:to_i).sort
mid=a.sum/a.length
pp a.map {|x| (0..(mid-x).abs).sum}.sum

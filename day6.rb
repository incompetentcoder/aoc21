
a=File.open("input6.txt").read.scan(/\d+/).map(&:to_i).tally

80.times {|x| (a[9] ? a[9]+=a[0] : a[9]=a[0];a[7] ? a[7]+=a[0] : a[7]=a[0];a.delete(0)) if a[0];a.transform_keys!{|x| x-=1}}
pp a.values.sum

176.times {|x| (a[9] ? a[9]+=a[0] : a[9]=a[0];a[7] ? a[7]+=a[0] : a[7]=a[0];a.delete(0)) if a[0];a.transform_keys!{|x| x-=1}}
pp a.values.sum

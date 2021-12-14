require 'pry'
b={}
eh=[]
a=File.open("input13.txt").each_line do |x|
  if x[0]=~/[0-9]/
    b[x.scan(/\d+/).map(&:to_i)]=1
  elsif x[0]=~/f/
    eh.push(*x.scan(/([xy]).(\d+)/))
  end
end
eh.each do |x|
  z=x[1].to_i
  b.transform_keys! do |y|
    if x[0]=="y"
      if y[1] > z
        [y[0],z-(y[1]-z)]
      else
        y
      end
    else
      if y[0] > z
        [z-(y[0]-z),y[1]]
      else
        y
      end
    end
  end
  pp b.length
end

dims=b.keys.max_by{|x| [x[1],x[0]]}.map(&:succ)
c=Array.new(dims[1]){Array.new(dims[0],".")}
b.keys.each {|x| c[x[1]][x[0]]=0}
c.each {|x| pp x.join}

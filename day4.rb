require 'pry'
a=File.open("input4.txt").read.split("\n\n").map{|x| x.split("\n").map{|y| y.scan(/\d+/)}}
b=[]
a[1..-1].each do |x|
  b.push x+x.transpose
end
done=false
a[0][0].length.times do |x|
  b.length.times do |y|
    b[y].each do |z|
      z.delete(a[0][0][x])
    end
    if b[y].include?([])
      pp b[y][0..4].flatten.map(&:to_i).sum*a[0][0][x].to_i
      done=true
    end
    break if done==true
  end
  break if done==true
end

a=File.open("input4.txt").read.split("\n\n").map{|x| x.split("\n").map{|y| y.scan(/\d+/)}}

b=[]
a[1..-1].each do |x|
  b.push x+x.transpose
end
done=false
a[0][0].length.times do |x|
  b.each do |y|
    y.each do |z|
      z.delete(a[0][0][x])
    end
  end
  if b.length == 1 && b[0].include?([])
    pp b[0][0..4].flatten.map(&:to_i).sum*a[0][0][x].to_i
    exit
  else
    b.delete_if{|x| x.include?([])}
  end
end




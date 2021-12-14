require 'pry'
a=File.open("input3.txt").readlines.map {|x| x.chomp.chars.map(&:to_i)}
half=a.length/2
gamma=[]
epsilon=[]
a[0].length.times do |x|
  b=a.collect{|y| y[x]}.tally.sort_by{|x| x[1]}
  gamma[x]=b[1][0]
  epsilon[x]=b[0][0]
end
pp gamma.join.to_i(2)*epsilon.join.to_i(2)

b=a.clone 
c=a.clone
  a[0].length.times do |x|
    d=b.collect{|y| y[x]}.tally.sort_by{|x| x[1]}
    next if d.length == 1
    if d[0][1] != d[1][1]
      b.delete_if{|y| y[x]==d[0][0]}
    elsif d[0][1] == d[1][1]
      b.delete_if{|y| y[x]==0}
    end
  end
  a[0].length.times do |x|
    d=c.collect{|y| y[x]}.tally.sort_by{|x| x[1]}
    next if d.length == 1
    if d[0][1] != d[1][1]
      c.delete_if{|y| y[x]==d[1][0]}
    elsif d[0][1] == d[1][1]
      c.delete_if{|y| y[x]==1}
    end
  end
  pp b.join.to_i(2) * c.join.to_i(2)



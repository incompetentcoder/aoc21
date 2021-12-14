require 'pry'
a=File.open("input11.txt").readlines.map {|x| x.chomp.chars.map(&:to_i).prepend(-100000).append(-10000)}.prepend(Array.new(12,-10000)).append(Array.new(12,-10000))
flashes=0
100.times do 
  a.map!{|x| x.map(&:succ)}
  while b=a.flatten.find_index(10) do
    y,x=b.divmod(12)
    a[y][x]=11
    flashes+=1
    (y-1..y+1).each{|yy| (x-1..x+1).each{|xx| a[yy][xx] +=1 if a[yy][xx] < 10 }}
  end
  a.map!{|x| x.map{|y| y == 11 ? 0 : y}}
end
pp flashes

a=File.open("input11.txt").readlines.map {|x| x.chomp.chars.map(&:to_i).prepend(-100000).append(-10000)}.prepend(Array.new(12,-10000)).append(Array.new(12,-10000))
flashes=0
10000.times do |i|
  a.map!{|x| x.map(&:succ)}
  flashesold=flashes
  while b=a.flatten.find_index(10) do
    y,x=b.divmod(12)
    a[y][x]=11
    flashes+=1
    (y-1..y+1).each{|yy| (x-1..x+1).each{|xx| a[yy][xx] +=1 if a[yy][xx] < 10 }}
  end
  if flashes-flashesold == 100
    pp i+1
    break
  end
  a.map!{|x| x.map{|y| y == 11 ? 0 : y}}
end

require 'pry'
mins={}
a=File.open("input9.txt").readlines.map{|x| x.chomp.chars.map(&:to_i).prepend(10).append(10)}.prepend(Array.new(102){10}).append(Array.new(102){10})
a.length.times do |x|
  a[x].length.times do |y|
    mins[[x,y]]=(a[x][y]) if a[x][y] == a[x-1..x+1].map{|z| z[y-1..y+1]}.flatten.min
  end
end
pp mins.values.map(&:succ).sum

res=[]
mins.keys.each do |x|
  a[x[0]][x[1]]=11
  pit=[x]
  pit.each do |y|
    [[y[0]-1,y[1]],[y[0]+1,y[1]],[y[0],y[1]-1],[y[0],y[1]+1]].each do |z|
      if a[z[0]][z[1]] < 9
        a[z[0]][z[1]]=11
        pit.push(z)
      end
    end
  end
  res.push(pit.size)
end

pp res.sort[-3..-1].reduce(:*)


require 'pry'
ar=Array.new(1000){Array.new(1000,0)}
File.open("input5.txt").each_line do |a|
  b=a.scan(/\d+/).map(&:to_i)
  if b[0] == b[2]
    sta,en = [b[1],b[3]].minmax
    (sta .. en).each {|x| ar[x][b[0]]+=1}
  elsif b[1] == b[3]
    sta,en = [b[0],b[2]].minmax
    (sta .. en).each {|x| ar[b[1]][x]+=1}
  end
end
pp ar.flatten.select {|x| x>=2}.count

ar=Array.new(1000){Array.new(1000,0)}
File.open("input5.txt").each_line do |a|
    b=a.scan(/\d+/).map(&:to_i)
    if b[0] == b[2]
      sta,en = [b[1],b[3]].minmax
      (sta .. en).each {|x| ar[x][b[0]]+=1}
    elsif b[1] == b[3]
      sta,en = [b[0],b[2]].minmax
      (sta .. en).each {|x| ar[b[1]][x]+=1}
    else
      xstep=b[2]>b[0]? 1 : -1
      ystep=b[3]>b[1]? 1 : -1
      (0..(b[2]-b[0]).abs).each do |c|
        ar[b[1]+c*ystep][b[0]+c*xstep]+=1
      end
    end
end
pp ar.flatten.select {|x| x>=2}.count


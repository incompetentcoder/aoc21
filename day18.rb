require 'pry'
a=File.open("input18.txt").readlines
a[0].chomp!
a[1..-1].each do |x|
  a[0]="[#{a[0]},#{x.chomp}]"
  ind=0
  while ind != nil do
#    ind=a[0].chars.each_index.find{|x| a[0][0..x].count("[") - a[0][0..x].count("]") > 4}
#    ind=(indr=a[0].chars.each_index.find{|x| a[0][0..x].count("]") - a[0][0..x].count("[") > 4}) if ind==nil || indr < ind
    counts={"["=>0,"]"=>0}
    ind=nil
    a[0].length.times do |y|
      counts[a[0][y]]+=1 if a[0][y]=~/[\[\]]/
      if counts["["]-counts["]"] > 4 && (z=a[0][y..-1].match(/\[(\d+),(\d+)\]/))
        a[0]=a[0][0..y-1]+"0"+z.post_match
        right=a[0][y+1..-1].index(/\d/)
        if right
          rightend=a[0][y+1+right..-1].index(/[^\d]/)
          a[0][y+1+right..y+1+right+rightend-1]=(a[0][y+1+right..y+1+right+rightend-1].to_i + z[2].to_i).to_s
        end
        left=a[0][0..y-1].rindex(/\d/)
        if left
          leftend=a[0][0..left].rindex(/[^\d]/)
          a[0][leftend+1..left]=(a[0][leftend+1..left].to_i + z[1].to_i).to_s
        end
        ind=y
#        binding.pry
      end
      break if ind
    end
    next if ind
    left=a[0].index(/\d{2,}/)
    if left
#      binding.pry
      leftend=a[0][left..-1].index(/[^\d]/)
      num=a[0][left..left+leftend-1].to_f
      a[0][left..left+leftend-1]="["+(num/2).floor.to_s+","+(num/2).ceil.to_s+"]"
      ind=left
    end
  end
end

while z=a[0].match(/\[(\d+),(\d+)\]/) do
  a[0].gsub!(z[0],(z[1].to_i()*3+(z[2].to_i()*2)).to_s)
end

pp a[0]



b=File.open("input18.txt").readlines
sum=0
b.permutation(2).each do |a|
  a[0].chomp!
a[1..-1].each do |x|
  a[0]="[#{a[0]},#{x.chomp}]"
  ind=0
  while ind != nil do
#    ind=a[0].chars.each_index.find{|x| a[0][0..x].count("[") - a[0][0..x].count("]") > 4}
#    ind=(indr=a[0].chars.each_index.find{|x| a[0][0..x].count("]") - a[0][0..x].count("[") > 4}) if ind==nil || indr < ind
    counts={"["=>0,"]"=>0}
    ind=nil
    a[0].length.times do |y|
      counts[a[0][y]]+=1 if a[0][y]=~/[\[\]]/
      if counts["["]-counts["]"] > 4 && (z=a[0][y..-1].match(/\[(\d+),(\d+)\]/))
        a[0]=a[0][0..y-1]+"0"+z.post_match
        right=a[0][y+1..-1].index(/\d/)
        if right
          rightend=a[0][y+1+right..-1].index(/[^\d]/)
          a[0][y+1+right..y+1+right+rightend-1]=(a[0][y+1+right..y+1+right+rightend-1].to_i + z[2].to_i).to_s
        end
        left=a[0][0..y-1].rindex(/\d/)
        if left
          leftend=a[0][0..left].rindex(/[^\d]/)
          a[0][leftend+1..left]=(a[0][leftend+1..left].to_i + z[1].to_i).to_s
        end
        ind=y
#        binding.pry
      end
      break if ind
    end
    next if ind
    left=a[0].index(/\d{2,}/)
    if left
#      binding.pry
      leftend=a[0][left..-1].index(/[^\d]/)
      num=a[0][left..left+leftend-1].to_f
      a[0][left..left+leftend-1]="["+(num/2).floor.to_s+","+(num/2).ceil.to_s+"]"
      ind=left
    end
  end
end
while z=a[0].match(/\[(\d+),(\d+)\]/) do
  a[0].gsub!(z[0],(z[1].to_i()*3+(z[2].to_i()*2)).to_s)
end
sum=a[0].to_i if a[0].to_i > sum
end
pp sum

require 'parallel'
require 'pry'
$a=File.open("input15.txt").readlines.map {|x| x.chomp.scan(/\d/).map(&:to_i)}
start=[[0,0]]
$end=[$a.length-1,$a[0].length-1]
$min=$a.each_with_index.map {|x,y| x.each_with_index.map {|z,zz| z=(y+zz+[(y+zz)/2,1].max)*5}}
#$min=[((1..$end[1]).map{|x| $a[x][1]}.sum + $a[$end[1]][1..$end[0]].sum),
#       ((1..$end[1]).map{|x| $a[x][$end[0]]}.sum + $a[1][1..$end[0]].sum)].min

#pp $min
#$min=800

def recur(pos,sum)
  x,y=pos[-1]
  b=[[x+1,y],[x-1,y],[x,y+1]].select{|z| z.all?{|zz| zz>-1 && zz<$a.length}}
 # b-=[[x,y-1]] if ($a[x][y-1] > $a[x+1][y] || $a[x][y-1] > $a[x-1][y])
  if b!=[]
    #b.each do |z|
    b.sort_by{|z| $a[z[1]][z[0]]+$end.sum-z.sum}.each do |z|
      if (s=sum+$a[z[1]][z[0]]) < $min[z[1]][z[0]]
        $min[z[1]][z[0]]=s
        recur(pos+[z],s)
#        c.priority=$min-sum
#        c.join(300)
#        recur(pos+[z],sum+$a[z[1]][z[0]])
      end
    end
  end
end
recur(start,0)
pp $min[-1][-1]

sides=$a.length
4.times do |y|
  sides.times do |x|
    $a[x].append(*$a[x][-sides..-1].map{|z| z > 8 ? 1 : z+=1})
  end
end
4.times do |x|
  $a.append(*$a[-sides..-1].map{|y| y.map{|z| z > 8 ? 1 : z+=1}})
end
#$min=$a.each_with_index.map {|x,y| x.each_with_index.map {|z,zz| z=(y+zz)*9}}
$min=$a.each_with_index.map {|x,y| x.each_with_index.map {|z,zz| z=(y+zz+[(y+zz)/2,1].max)*5}}
$end=[$a.length-1,$a[0].length-1]
pp "starting"
recur(start,0)
pp $min[-1][-1]

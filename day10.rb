require 'pry'
a=File.open("input10.txt").readlines.map {|x| x.chomp}
points={")"=>3,"]"=>57,"}"=>1197,">"=>25137}
points2={"("=>1,"["=>2,"{"=>3,"<"=>4}
ill=0
scores=[]
a.each_index do |x|
  score=0
  while b=(/\(\)|\[\]|\{\}|<>/.match(a[x]))
    a[x].sub!(b[0],"")
  end
  if b=(/[\)\]\}\>]/.match(a[x]))
    ill+=points[b[0]]
  else
    a[x].reverse.each_char do |y|
      score*=5
      score+=points2[y]
    end
    scores.push(score)
  end
end

pp ill
pp scores.sort[scores.length/2]




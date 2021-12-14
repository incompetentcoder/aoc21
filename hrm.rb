a=File.open("input12.txt").readlines.map{|x| x.chomp.split("-")}
require 'pry'
require 'set'
$b={}
a.each do |x|
  $b[x[0]]=[] unless $b[x[0]]
  $b[x[1]]=[] unless $b[x[1]]
  $b[x[0]].push(x[1]) unless $b[x[0]].include?(x[1])
  $b[x[1]].push(x[0]) unless $b[x[1]].include?(x[0])
end
$c=$b.keys.select{|x| x=~/[[:lower:]]/}
$paths=[]

def recur(path,cur)
  if ($c.include?(cur) && path.include?(cur))==false
    if cur=="end"
      $paths.push(path+[cur])
    else
      $b[cur].each {|x| recur(path+[cur],x)}
    end
  end
end

def recur2(path,cur,shit)
  shit+=1 if ($c.include?(cur) && path.include?(cur))
  if shit < 2
    if cur=="end"
      $paths.push(path+[cur])
    else
      ($b[cur]-["start"]).each {|x| recur2(path+[cur],x,shit)}
    end
  end
end


$b["start"].each {|x| recur(["start"],x)}

pp $paths.length

$paths=[]

$b["start"].each {|x| recur2(["start"],x,0)}

pp $paths.length


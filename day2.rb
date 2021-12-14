b={"forward"=>0,"down"=>0,"up"=>0}
File.open("input2.txt").each_line {|x| c=x.split(" "); b[c[0]]+=c[1].to_i}
pp b["forward"]*(b["down"]-b["up"])
b={"forward"=>0,"down"=>0,"up"=>0,"aim"=>0,"depth"=>0}
File.open("input2.txt").each_line do |x| 
  c=x.split(" ")
  c[1]=c[1].to_i
  case c[0]
  when "down"
    b["aim"]+=c[1]
  when "up"
    b["aim"]-=c[1]
  when "forward"
    b["forward"]+=c[1]
    b["depth"]+=c[1]*b["aim"]
  end
end
pp b["forward"]*b["depth"]


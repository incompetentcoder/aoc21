require 'pry'
a=File.open("input16.txt").read.to_i(16).to_s(2)
lj=a.length%4
a.prepend("0"*(4-lj)) if lj != 0
$versions=0
pp a.length
def packet(data)
  v=data.slice!(0,3).to_i(2)
  t=data.slice!(0,3).to_i(2)
  $versions=$versions+v
  if t!=4
    i=data.slice!(0)
    if i=="0"
      sublen=data.slice!(0,15).to_i(2)
      len=data.length-sublen
      while data.length > len do
        packet(data)
      end
    else
      subpacks=data.slice!(0,11).to_i(2)
      while subpacks > 0 do
        packet(data)
        subpacks-=1
      end
    end
  else
    while data.slice!(0)!="0" do
      data.slice!(0,4) 
    end
    data.slice!(0,4)
  end
end

packet(a)
pp $versions

a=File.open("input16.txt").read.to_i(16).to_s(2)
lj=a.length%4
a.prepend("0"*(4-lj)) if lj != 0
$versions=0
pp a.length
def packet(data)
  v=data.slice!(0,3).to_i(2)
  t=data.slice!(0,3).to_i(2)
  $versions=$versions+v
  if t!=4
    values=[]
    i=data.slice!(0)
    if i=="0"
      sublen=data.slice!(0,15).to_i(2)
      len=data.length-sublen
      while data.length > len do
        values.push(packet(data))
      end
    else
      subpacks=data.slice!(0,11).to_i(2)
      while subpacks > 0 do
        values.push(packet(data))
        subpacks-=1
      end
    end
    value=0
    case t
    when 0
      value=values.sum
    when 1
      value=values.reduce(:*)
    when 2
      value=values.min
    when 3
      value=values.max
    when 5
      value=values[0]>values[1]?1:0
    when 6
      value=values[0]<values[1]?1:0
    when 7
      value=values[0]==values[1]?1:0
    end
    return value
  else
    values=""
    while data.slice!(0)!="0" do
      values+=data.slice!(0,4) 
    end
    values+=data.slice!(0,4)
    return values.to_i(2)
  end
end

pp packet(a)
pp $versions


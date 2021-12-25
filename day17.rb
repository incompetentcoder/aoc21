a=File.open("input17.txt").read.scan(/[0-9-]+/).map(&:to_i)
xtr=((a[0..1].min*2)**0.5).round
ytr=a[2..3].min.abs() -1
pp (1..ytr).sum

res=[]
(((a[0..1].min*2)**0.5).round .. a[0..1].max).each do |x|
    sum=0
    steps=0
    x.downto(1).each do |xx|
      sum+=xx
      steps+=1
      break if sum > a[0..1].max
      next if sum < a[0..1].min
      if xx==1
        (a[2..3].min .. ytr).each do |y|
          (x..x*x).each do |s|
            if (a[2..3].min .. a[2..3].max).include?(y*s-(0..s-1).sum)
              res.push([x,y])
              break
            end
          end
        end
      else
        (a[2..3].min/steps .. steps).each do |y|
          res.push([x,y]) if (a[2..3].min .. a[2..3].max).include?(y*steps-(0..steps-1).sum)
        end
      end
  end
end
pp res.uniq.length
      






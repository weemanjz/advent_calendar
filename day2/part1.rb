s = 0

while (l = gets)
  a, b, c = l.split('x').map(&:to_i).sort
  s += 3*a*b + 2*a*c + 2*b*c
end

p s

s = 0

while (l = gets)
  a, b, c = l.split('x').map(&:to_i).sort
  s += 2*a + 2*b + a*b*c
end

p s

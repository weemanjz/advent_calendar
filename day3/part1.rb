x = 0
y = 0
city = { 0 => { 0 => true }}
houses = 1

gets.each_char do |c|
  case c
  when '^'
    y += 1
  when 'v'
    y -= 1
  when '<'
    x -= 1
  when '>'
    x += 1
  end
  if city[x].nil? || city[x][y].nil?
    houses += 1
    city[x] ||= {}
    city[x][y] = true
  end
end

p houses

pos = [[0, 0], [0, 0]]
city = { 0 => { 0 => true }}
houses = 1

gets.each_char.with_index do |c, i|
  j = i % 2
  case c
  when '^'
    pos[j][1] += 1
  when 'v'
    pos[j][1] -= 1
  when '<'
    pos[j][0] -= 1
  when '>'
    pos[j][0] += 1
  end
  x, y = pos[j]
  if city[x].nil? || city[x][y].nil?
    houses += 1
    city[x] ||= {}
    city[x][y] = true
  end
end

p houses

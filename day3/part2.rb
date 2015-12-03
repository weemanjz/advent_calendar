pos = [[0, 0], [0, 0]]
xy = { '<' => 0, '>' => 0, '^' => 1, 'v' => 1 }
add = { '<' => -1, '>' => 1, '^' => 1, 'v' => -1 }
city = { 0 => { 0 => true }}
houses = 1

gets.each_char.with_index do |c, i|
  next if xy[c].nil?
  j = i % 2
  pos[j][xy[c]] += add[c]
  x, y = pos[j]
  if city[x].nil? || city[x][y].nil?
    houses += 1
    city[x] ||= {}
    city[x][y] = true
  end
end

p houses

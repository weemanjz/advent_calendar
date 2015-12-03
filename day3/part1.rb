pos = [0, 0]
xy = { '<' => 0, '>' => 0, '^' => 1, 'v' => 1 }
add = { '<' => -1, '>' => 1, '^' => 1, 'v' => -1 }
city = { 0 => { 0 => true }}
houses = 1

gets.each_char do |c|
  next if xy[c].nil?
  pos[xy[c]] += add[c]
  x, y = pos
  if city[x].nil? || city[x][y].nil?
    houses += 1
    city[x] ||= {}
    city[x][y] = true
  end
end

p houses

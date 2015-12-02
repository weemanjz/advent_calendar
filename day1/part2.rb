pos = 0
floor = 0

gets.each_char.with_index do |c, i|
  floor += c == '(' ? 1 : -1
  break pos = i + 1 if floor == -1
end

p pos

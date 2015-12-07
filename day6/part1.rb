arr = Array.new(1000) { Array.new(1000, false) }
no = 0

while gets
  args = $_.chomp.split(' ')
  corner2, corner1, function = args[-1], args[-3], args[-4]
  x1, y1, x2, y2 = *corner1.split(',').map(&:to_i), *corner2.split(',').map(&:to_i)
  (x1..x2).each do |x|
    (y1..y2).each do |y|
      case function
      when 'on'
        no += 1 unless arr[x][y]
        arr[x][y] = true
      when 'off'
        no -= 1 if arr[x][y]
        arr[x][y] = false
      when 'toggle'
        no += arr[x][y] ? -1 : 1
        arr[x][y] = !arr[x][y]
      end
    end
  end
end

p no

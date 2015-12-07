connections = []
signals = {}

def wire_value(x, signals)
  (x =~ /^[0-9]+$/ && x.to_i) || signals[x]
end

while gets
  connections << $_.chomp.split(' ')
end

loop do
  connections.delete_if do |con|
    case con.length
    when 3
      a, b = wire_value(con[0], signals), con[2]
      signals[b] = a if a
    when 4
      a, b = wire_value(con[1], signals), con[3]
      signals[b] = ~a & 65535 if a
    when 5
      a, b, c, op = wire_value(con[0], signals), wire_value(con[2], signals), con[4], con[1]
      if a && b
        signals[c] =
          case op
          when 'AND'
            a & b
          when 'OR'
            a | b
          when 'LSHIFT'
            a << b
          when 'RSHIFT'
            a >> b
          end
      end
    end
    signals[con.last]
  end
  break if signals['a']
end

p signals['a']

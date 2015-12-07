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
    x = con.last
    case con.length
    when 3
      a = wire_value(con[0], signals)
      signals[x] = a if a
    when 4
      a = wire_value(con[1], signals)
      signals[x] = ~a & 65535 if a
    when 5
      a, b, op = wire_value(con[0], signals), wire_value(con[2], signals), con[1]
      if a && b
        signals[x] =
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
    signals[x]
  end
  break if signals['a']
end

p signals['a']

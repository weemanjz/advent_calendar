class String
  def nice?
    double_strings? && repeated_letter?
  end

  def double_strings?
    strings = {}
    contains = false
    (0...length - 1).each do |i|
      sub = self[i, 2]
      break contains = true if strings.fetch(sub, i) < i - 1
      strings[sub] ||= i
    end
    contains
  end

  def repeated_letter?
    contains = false
    (2...length).each { |i| break contains = true if self[i] == self[i - 2] }
    contains
  end
end

no = 0

while gets
  no += 1 if $_.nice?
end

p no

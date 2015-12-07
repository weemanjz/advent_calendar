class String
  def nice?
    has_vovels? && has_double_letter? && no_strings?
  end

  def has_vovels?
    self =~ /[aeiou].*[aeiou].*[aeiou]/
  end

  def has_double_letter?
    prev = nil
    has = false
    self.each_char do |c|
      break has = true if c == prev
      prev = c
    end
    has
  end

  def no_strings?
    (self =~ /ab/ || self =~ /cd/ || self =~ /pq/ || self =~ /xy/).nil?
  end
end

no = 0

while gets
  no += 1 if $_.nice?
end

p no

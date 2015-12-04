require 'digest'

secret = gets.chomp
number = 1

loop do
  break if Digest::MD5.hexdigest("#{secret}#{number}") =~ /^0{5,}/
  number += 1
end

p number

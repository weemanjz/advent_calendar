require 'digest'

secret = gets.chomp
number = 1

loop do
  break if Digest::MD5.hexdigest("#{secret}#{number}") =~ /^0{6}/
  number += 1
end

p number

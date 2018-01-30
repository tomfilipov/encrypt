if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
# /XXX

require 'digest'

puts 'Enter word or phrase for encrypting:'
string = STDIN.gets.chomp

encrypt_method = ''

until([1,2].include?(encrypt_method)) do
  puts "\nWith which method to encrypt the data:\n1. MD5\n2. SHA1"
  encrypt_method = STDIN.gets.chomp.to_i
end

puts "Here we get the result:"

case encrypt_method
  when 1
    puts Digest::MD5.hexdigest(string)
  when 2
    puts Digest::SHA1.hexdigest(string)
end

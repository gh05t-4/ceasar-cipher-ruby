#!/usr/bin/env ruby

# defination of ceasar_cipher method
def ceasar_cipher(input, key)
  enc_s = "" # variable to store encrypted string

  # for each character in input shift the character
  # with key if it is a alphabet
  input.each_char do |char|
    if ('A'..'Z').include?(char) # Check for upcase
      if (char.ord + key) < 91
        enc_s += (char.ord + key).chr
      else
        enc_s += (65 + (char.ord + key) - 91).chr
      end
    elsif ('a'..'z').include?(char) # Check for downcase
      if (char.ord + key) < 123
        enc_s += (char.ord + key).chr
      else
        enc_s += (97 + (char.ord + key) - 123).chr
      end
    else # numbers and special chars
      enc_s += char
    end
  end
  enc_s
end

# Get user input of the string to encrypt
input = ARGV[0]

# Get user input for the key (1 - 25)
key = ARGV[1].to_i

unless ARGV.length == 2 or ["-h", "--help"].include?(ARGV[1])
  puts("USAGE: ruby ceasar.rb <String> <key>")
  puts
  exit
end

until key > 0 and key < 27 do
  print("Key should be in range of [1,26], Enter key: ")
  key = gets.chomp.to_i
end

# Pass the arguments to ceasar_cipher method
encrypted_string = ceasar_cipher(input, key)

# Output the encrypted string to the console
print("Output, key[#{key}]: ")
puts(encrypted_string)
puts

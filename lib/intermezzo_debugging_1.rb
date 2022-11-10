def say_hello(name)
    return "hello #{name}"
end
  
def encode(plaintext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    ciphertext_chars = plaintext.chars.map do |char|
    p "char = #{char}"
    p "cipher.find_index(char) =" 
    p cipher.find_index(char)
      (65 + cipher.find_index(char)).chr
    end
    return ciphertext_chars.join
end
  
def decode(ciphertext, key)
    cipher = key.chars.uniq + (('a'..'z').to_a - key.chars)
    plaintext_chars = ciphertext.chars.map do |char|
      cipher[char.ord - 65]
    end
    return plaintext_chars.join
end

puts encode("theswiftfoxjumpedoverthelazydog", "secretkey")
puts decode("EMBAXNKEKSYOVQTBJSWBDEMBPHZGJSL", "secretkey")
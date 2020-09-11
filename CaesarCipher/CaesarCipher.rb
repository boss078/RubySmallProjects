mode = ""
until mode =~ /[1-2]/ do
    print "Choose mode(1 - encrypt, 2 - decript): "
    mode = gets.strip
    case mode
    when "1"
        puts "Reading data from CaesarCipherDecrypted.txt..."
        input_file = File.open("CaesarCipherDecrypted.txt")
        input_str = input_file.read
        input_file.close
    when "2"
        puts "Reading data from CaesarCipherEncrypted.txt..."
        input_file = File.open("CaesarCipherEncrypted.txt")
        input_str = input_file.read
        input_file.close
    else
        puts "Wrong input"
    end
end

input_k = ""
output_str = ""

until input_k =~ /\d/
    print "Offset for Caesar cypher: "
    input_k = gets.chomp
end

input_str.each_char do |char|
    if char =~ /[a-z]|[A-Z]/
        if mode == "1"
            modified_char = char.ord + input_k.to_i
        else
            modified_char = char.ord - input_k.to_i
        end
        if char =~ /[a-z]/
            modified_char -= 26 if modified_char > "z".ord
            modified_char += 26 if modified_char < "a".ord
        else
            modified_char -= 26 if modified_char > "Z".ord 
            modified_char += 26 if modified_char < "A".ord
        end
        output_str += modified_char.chr
    else
        output_str += char
    end
end

puts "Output: #{output_str}"

if mode == "1"
    puts "Writing to CaesarCipherEncrypted.txt..."
    File.write("CaesarCipherEncrypted.txt", output_str)
else
    puts "Writing to CaesarCipherDecrypted.txt..."
    File.write("CaesarCipherDecrypted.txt", output_str)
end

class CaesarCipher
    def perform (mode, k, input, *args)
        return nil if mode !~ /e|d/
        input_str = ''
        if input.class == File
            if input
                input_str = input.read
                input.close
            else
                return nil
            end
        elsif input.class == String
            input_str = input
        end
        output_str = ''
        
        input_str.each_char do |char|
            if char =~ /[a-z]|[A-Z]/
                if mode == 'e'
                    modified_char = char.ord + k
                else
                    modified_char = char.ord - k
                end
                if char =~ /[a-z]/
                    modified_char -= 26 if modified_char > 'z'.ord
                    modified_char += 26 if modified_char < 'a'.ord
                else
                    modified_char -= 26 if modified_char > 'Z'.ord 
                    modified_char += 26 if modified_char < 'A'.ord
                end
                output_str += modified_char.chr
            else
                output_str += char
            end
        end
        if args.length == 0
            return output_str
        else
            output_file = File.open(args[0], 'w')
            output_file.write(output_str)
            output_file.close
            return 0
        end
    end
end

cipherInstance = CaesarCipher.new
inputFile = File.open('CaesarCipherDecrypted.txt')
cipherInstance.perform('e', 2, inputFile, 'CaesarCipherEncrypted.txt')


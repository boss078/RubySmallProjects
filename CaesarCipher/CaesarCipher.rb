# Usage:
# Methods encrypt/decrypt for encryption/decryption
# First arg - offset for cipher
# Second arg - input string or input file opened in reading mode
# Third arg(optional) - name for output file

class CaesarCipher
    def encrypt(k, input, *args)
        return perform_something(true, k, input, args)
    end
    def decrypt(k, input, *args)
        return perform_something(false, k, input, args)
    end

    private
    def perform_something(encrypt, k, input, args)
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
                if encrypt == true
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
        if args.length != 0
            output_file = File.open(args[0], 'w')
            output_file.write(output_str)
            output_file.close
            return 0
        end
        return output_str
    end
end

# Some test code
cipherInstance = CaesarCipher.new
inputFile = File.open('CaesarCipherDecrypted.txt')
cipherInstance.encrypt('e', 2, inputFile, 'CaesarCipherEncrypted.txt')

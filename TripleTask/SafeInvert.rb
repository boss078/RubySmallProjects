class Hash
    def safe_invert
        output = Hash.new
        self.each { |key, value| 
            output[value] = key
        }
        return output
    end
end

fruits_country = {
    'orange' => 'Marocco',
    'banana' => 'Ecuador',
    'lemon' => 'Marocco',
}
puts fruits_country.safe_invert
puts fruits_country
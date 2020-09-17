class Array
    def to_histogram
        output = Hash.new(0)
        self.each { |e| output[e] += 1 }
        return output
    end
end

a = ['orange', 'banana', 'banana', 'banana', 'lemon', 'lemon']
puts a.to_histogram
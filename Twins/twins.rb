# Complete the function below.

# DO NOT MODIFY anything outside the below function
def twins(a, b)
  result = []
  max_l = a.length() >= b.length()? a.length(): b.length()
  (0..max_l - 1).each do |i|
    if !a[i] || !b[i] || a[i].length != b[i].length
      result << 'No'
      next
    end
    a_even_ctr = Hash.new(0)
    b_even_ctr = Hash.new(0)
    a_odd_ctr = Hash.new(0)
    b_odd_ctr = Hash.new(0)
    a[i].split('').each_index { |index| index.even? ? a_even_ctr[a[i][index]] += 1: a_odd_ctr[a[i][index]] += 1 }
    b[i].split('').each_index { |index| index.even? ? b_even_ctr[b[i][index]] += 1: b_odd_ctr[b[i][index]] += 1 }
    (a_even_ctr == b_even_ctr && a_odd_ctr == b_odd_ctr)? result << 'Yes': result << 'No'
  end
  return result
end



# DO NOT MODIFY anything outside the above function

# DO NOT MODIFY THE CODE BELOW THIS LINE!
_a_cnt = Integer(gets)
_a_i=0
_a = Array.new(_a_cnt)

while (_a_i < _a_cnt)
  _a_item = gets.to_s.strip;
  _a[_a_i] = (_a_item)
  _a_i+=1
end

_b_cnt = Integer(gets)
_b_i=0
_b = Array.new(_b_cnt)

while (_b_i < _b_cnt)
  _b_item = gets.to_s.strip;
  _b[_b_i] = (_b_item)
  _b_i+=1
end

res = twins(_a, _b);
for res_i in res do
  puts res_i
end

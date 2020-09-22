require 'date'

print 'Enter date(month-day-year): '
d = Date.parse(gets)

print 'Enter max N (hash element length): '
max_n = gets

hash = {
    'day' => [],
    'week' => [],
    'month' => [],
    'year' => []
}
offset = 0
(0..max_n.to_i).each do |i|
    hash['day'] << Date.new(d.year, d.month, d.day) + i
    hash['week'] << Date.new(d.year, d.month, d.day) + i * 7
    hash['month'] << Date.new(d.year + (d.month + i) / 13, d.month + i > 12? (d.month - 1 + i) % 12 + 1: d.month + i, d.day)
    hash['year'] << Date.new(d.year + i, d.month, d.day)
end

print 'Choose time unit (1 - day, 2 - week, 3 - month, 4 - year): '
case gets.to_i
when 1
    mode = 'day'
when 2
    mode = 'week'
when 3
    mode = 'month'
when 4
    mode = 'year'
end

print 'Enter N (should be less than max N): '
n = gets
(0..n.to_i).each do |i|
    puts "#{hash[mode][i].day}-#{hash[mode][i].month}-#{hash[mode][i].year}"
end

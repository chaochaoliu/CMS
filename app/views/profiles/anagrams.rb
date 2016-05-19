 puts "Please inter strings separate by space:"
 s = gets
 a = s.split(' ')

 def groupAnagrams(arr)
   arr.group_by { |element| element.downcase.chars.sort }.values
 end

 print groupAnagrams(a)

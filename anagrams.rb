def first_anagram?(string)
  return [string] if string.length == 1
  anagrams = []

  string.split("").each_with_index do |char, i|
    smaller_anagrams = first_anagram?(string[0...i] + string[i + 1..-1])
    smaller_anagrams.each do |sub_anagram|
      anagrams << char + sub_anagram
    end
  end

  anagrams
end

def anagram?(string1, string2)
  first_anagram?(string1).include?(string2)
end

# p first_anagram?("gizmo")
p anagram?("gizmo", "sally")
p anagram?("elvis", "lives")

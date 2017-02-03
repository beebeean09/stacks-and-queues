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
  fourth_anagram?(string1, string2)
end

def second_anagram?(string1, string2)
  i, word_length = 0, string1.length

  word_length.times do
    return false unless string2.include?(string1[0])
    string2.delete!(string1[0])
    string1.slice!(0)
  end

  true
end

def third_anagram?(string1, string2)
  string1.split("").sort.join("") == string2.split("").sort.join("")
end

def fourth_anagram?(string1, string2)
  letter_counts = Hash.new { |h, k| h[k] = 0 }

  string1.split("").each { |char| letter_counts[char] += 1 }
  string2.split("").each { |char| letter_counts[char] -= 1 }

  letter_counts.values.all? { |val| val == 0 }
end

p anagram?("gizmo", "sally")
p anagram?("elvis", "lives")

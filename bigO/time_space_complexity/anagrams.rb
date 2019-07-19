
# iterates over the first string. For each letter in the first string, find the 
# index of that letter in the second string (hint: use Array#find_index) and 
# delete at that index. The two strings are anagrams if an index is found for 
# every letter and the second string is empty at the end of the iteration.
# O(n^2) bc there is a nested loop
# O(n) space bc creating an array of size n
def anagram2(str1, str2)
  str2_arr = str2.split("")

  str1.each_char.with_index do |char, i|
    char_i = str2_arr.index(char)
    return false if char_i == nil
    str2_arr.delete_at(char_i)
  end
  
  return str2_arr.empty?
end

# sorts both strings alphabetically. The strings are then anagrams if and 
# only if the sorted versions are the identical.
# O(n log n) time bc Ruby's sort method uses the QuickSort alg
# O(log n) space to store the sorted strings
def anagram3(str1, str2)
  str1 = str1.downcase.chars.sort.join
  str2 = str2.downcase.chars.sort.join

  return str1 == str2
end

# use two Hashes to store the number of times each letter appears in both words. 
# Compare the resulting hashes.
# O(n) time bc loop through strings
# O(n) space bc allocate space for hash table's keys. Could be O(1) bc there 
#   is a fixed constant number of keys(26 alphabets) in this case.
def anagram4(str1, str2)
  hash1 = Hash.new(0)
  hash2 = Hash.new(0)

  str1.each_char do |char|
    hash1[char] += 1
  end
  str2.each_char do |char|
    hash2[char] += 1
  end
  
  return hash1 == hash2
end


str1 = "elvis"
str2 = "lives"

#str1 = "gizmo"
#str2 = "sally"
p anagram4(str1, str2)
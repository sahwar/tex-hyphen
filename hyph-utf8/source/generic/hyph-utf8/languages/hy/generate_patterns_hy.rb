#!/usr/bin/env ruby
#    
# This script generates TeX hyphenation patterns for Armenian
#
# Rules written by Sahak Petrosyan <sahak at mit.edu> (author)
#
# These are just primitive rules that says that if there is a
# combination like <vowel><consonant><vowel>, then it should hyphenate
# like this: <vowel> - <consonant><vowel>.
# 
# There are more rules to implement
#
# Script written by Mojca Miklavec <mojca.miklavec.lists at gmail.com>
# (who is not the author of patterns)
#
$file = File.new("../../../../../tex/generic/hyph-utf8/patterns/hyph-hy.tex", "w")

# write comments into the file
def add_comment(str)
	$file.puts "% " + str.gsub(/\n/, "\n% ").gsub(/% \n/, "%\n")
end

vowels=%w{ա ե է ը ի ո օ}
consonants=%w{բ գ դ զ թ ժ լ խ ծ կ հ ձ ղ ճ մ յ ն շ չ պ ջ ռ ս վ տ ր ց փ ք}

add_comment(
"Hyphenation patterns for Armenian.

(TODO - write some more comments)

Written by Sahak Petrosyan <sahak at mit.edu>

These are just primitive rules that hyphenate combinations like
<vowel> - <consonant><vowel>.

File auto-generated by a script (see source/generic/hyph-utf8/languages/hy)

Vowels:     #{vowels.join(" ")}
Consonants: #{consonants.join(" ")}

Some of the patterns below represent combinations that never
appear in Armenian, but they would be hyphenated according to the rules.
")

$file.puts '\patterns{'

add_comment(
"և-<vowel>")
vowels.each do |vowel|
	$file.puts "և1#{vowel}"
end

add_comment(
"<vowel>-<consonant><vowel>")
vowels.each do |v1|
	consonants.each do |c|
		patterns = []
		vowels.each do |v2|
			patterns.push "#{v1}1#{c}#{v2}"
		end
		$file.puts patterns.join(" ")
	end
	$file.puts "%"
end

$file.puts "}"
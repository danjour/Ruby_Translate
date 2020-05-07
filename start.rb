require_relative 'translat.rb'

LANGUAGE_MAP = { '1' => 'en' , '2' => 'ru' , '3'=> 'ar' , '4'=>'es', '5'=>'ko','6'=>'it',
'7'=>'de','8'=>'pt','9'=>'el','10'=>'no'}

print 'Enter a phrase:'
text = gets.chomp
puts '1 - English 6 - Italian'
puts '2 - Russian 7 - German'
puts '3 - Arabic  8 - Portuguese'
puts '4 - Spanish 9 - Greek'
puts '5-  Korean  10- Norwegian'
print 'What is the language?'
number = gets.chomp
current_language = LANGUAGE_MAP[number]


puts 'What language to translate into?'
puts '1 - English 6 - Italian'
puts '2 - Russian 7 - German'
puts '3 - Arabic  8 - Portuguese'
puts '4 - Spanish 9 - Greek'
puts '5-  Korean  10- Norwegian'
number2 = gets.chomp
destination_language = LANGUAGE_MAP[number2]


translate = Traducao.new(text , current_language ,destination_language)

translate.traduzir

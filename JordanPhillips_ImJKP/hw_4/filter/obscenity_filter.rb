# Filter out obscenities using gsub.

blacklist=["bad","evil"]

def filter(string,blacklist)
  original_words = string.split(/[^A-Za-z]/)
  processed_words = []
  original_words.each_with_index do |word,i|
    if blacklist.include?(word.downcase)
      processed_words[i] = word.gsub(/[a-zA-Z]/, '*')
    else
      processed_words[i] = word
    end
  end
    original_words.each_with_index do |word, i|
    string = string.gsub(word,processed_words[i])
  end
  return string
end

# puts filter("Hebads a bad man evil face!",blacklist)
require 'yaml'
require 'pry'


# def load_library(file_path)
#   emoticons = YAML.load_file(file_path)
#   new_hash = {}

#   emoticons.each do |key,value|
#     new_hash[key] = {}
#     # binding.pry
#     new_hash[key][:english] = value[0]
#     new_hash[key][:japanese] = value[1]
#   end
#   new_hash
# end

# def get_japanese_emoticon(file_path, emoticon)
#   library = load_library(file_path)
#   emoticon = library.keys.find do |key|
#     library[key][:english] == emoticon
#   end
#   emoticon ? library[emoticon][:japanese] : "Sorry, that emoticon was not found"
# end


# def get_english_meaning(file_path, emoticon)
#   library = load_library(file_path)
#   emoticon = library.keys.find do |key|
#     library[key][:japanese] == emoticon
#   end
#   emoticon ? emoticon : "Sorry, that emoticon was not found"
# end

def load_library(path)
  library = YAML.load_file(path)
  e = {}
  
  library.each_pair do |key, value|
    e[key] = {:english => value[0], :japanese => value[1]}
  end
  return e
end

def get_japanese_emoticon(path, emoticon)
  library = load_library(path)
  library.each_pair do |key, value|
    if value[:english] == emoticon
      return value[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  library = load_library(path)
  library.each_pair do |key, value|
    if value[:japanese] == emoticon
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end
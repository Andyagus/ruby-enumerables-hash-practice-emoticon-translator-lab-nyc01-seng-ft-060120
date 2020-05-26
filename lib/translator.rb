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
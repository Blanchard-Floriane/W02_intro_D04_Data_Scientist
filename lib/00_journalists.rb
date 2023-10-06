#Exo Big Data
require_relative("../datas/handle_twitter.rb")

def intro #servira à remplacer le gets.chomp par la question
  puts ""
  puts "Voici les questions auxquelles je peux répondre, Ô grand maître :
  
  1 - Combien y a-t-il de handle dans cette array ?
  2 - Quel est le handle le plus court de cette liste ?
  3 - Combien y-a-t\'il de handle contenant 5 caractères ?
  4 - Combien commencent par une majuscule ?
  5 - Trie la liste de handle par ordre alphabétique.
  6 - Trie la liste de handle par taille des handle (les plus petits en premiers, les plus grands après).
  7 - Quelle est la position dans l\'array de la personne @epenser ?
  8 - Sors-moi une répartition des handle par taille de ces derniers (nombre de handle avec 1 caractère, nombre de handle avec 2 caractères, nombre de handle avec 3 caractères, etc).
  "
end

def handle_length(twitter_datas)
  return twitter_datas.length #renvoie le nb total d'éléments du tableau
end

def shortest_string(twitter_datas)
  #chaque caractère correspond à une valeur, moi je ne veux pas la valeur mais le plus petit nb de caractères
  return twitter_datas.min do |a,b| #min pour trouver plus petite chaine de caractère. A et b sont des éléments de ma array  
    a.size <=> b.size #à chaque itération, il compare un élément par rapport à un autre, il garde le plus petit et le compare à l'élément suivant
  end
end

def five_chrs(twitter_datas)
  result_array = twitter_datas.select do |handle| #la fonction select ne modifie pas les éléments de twitter_datas, elle les sélectionne juste
    handle.gsub(/@/, "").length == 5 #gsub remplace l'un par l'autre
  end
  return result_array.size
end

def upper_start(twitter_datas)
  result_array = twitter_datas.select do |handle|
    handle =~ /^@+[A-Z]/
    #explication regex : ^indique le début d'une ligne ou d'une chaîne de caractères
    # + correspond à une ou plusieurs occurrences du caractère précédent,
    #[A-Z] tous les caractères maj de A à Z,
  end
  return result_array.size
end

def alphabetic_order(twitter_datas)
  no_at = twitter_datas.map do |handle|
    handle.gsub("@", "")
  end
  sorted_array = no_at.sort_by do |handle| #sort by et je spécifie selon quel critère, ici en applicant la minuscule partout
    handle.downcase
  end
  puts sorted_array
  return sorted_array #downcase met tous en minuscule afin que le code ASCII ne soit plus un problème, puis sort classe par ordre alpha
end

def length_order(twitter_datas)
  sorted_array = twitter_datas.sort_by do |handle|
    handle.length
  end
  puts sorted_array
  return sorted_array 
end

def epenser(twitter_datas)
  return twitter_datas.index("@epenser")
end

def group_by_size(twitter_datas)
  new_hash = {} 
  twitter_datas.each do |handle|
    handle_length = handle.length
    if new_hash[handle_length].nil?
      new_hash[handle_length] = 1
    else
      new_hash[handle_length] += 1
    end
  end
  result_hash = new_hash.sort.to_h
  puts result_hash
  return result_hash
end


def perform
  intro
  puts "Tape un chiffre compris entre 1 et 8 :"
  print "> "
  answer = gets.chomp 
  case answer
  when "1"
    puts "Réponse : Il y en a #{handle_length(twitter_datas)}."
  when "2"
    puts "Réponse : Le handle le plus court de la liste est #{shortest_string(twitter_datas)}."
  when "3"
    puts "Réponse : Il y a #{five_chrs(twitter_datas)} de 5 caractères (sans comprendre le @)."
  when "4"
    puts "Réponse : Il y a #{upper_start(twitter_datas)} handles qui commencent par une majuscule (première lettre juste après le @)."
  when "5"
    puts "Voici la liste des handles par ordre alphabétique :" 
    alphabetic_order(twitter_datas)
  when "6"
    puts "Voici la liste des handles triées par taille de la plus petite à la plus grand :"
    length_order(twitter_datas)
  when "7"
    puts "Réponse : le pseudonyme @epenser se trouve en postion #{epenser(twitter_datas)} dans l'array."
  when "8"
    puts "Voici une répartition des handle par taille (nb de caractères) :"
    group_by_size(twitter_datas)
  else 
    puts "Entrée inexistante, au revoir !"
  end
  # puts "Veux-tu continuer ? O/N"
  # keep_going = gets.chomp
  # if keep_going == "N"
  #   puts "Au revoir, à bientôt !"
  # elsif keep_going == "O"
  #   perform
  # else
  #   puts "Erreur, tu devais taper 'O' ou 'N'"
  # end
end

perform
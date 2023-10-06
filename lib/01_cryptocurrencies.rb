require_relative("../datas/blockchain")

def intro
  puts "Suite à ton nouveau contrat pour Carrefour.io vous allez devoir analyser des données de cyptomonnaies, pas de panique on a un programme pour ça :"
  puts "1 - La ou les crypto qui ont la plus grosse valeur,"
  puts "2 - La ou les crypto qui ont la plus petite valeur,"
  puts "3 - Les devises dont le cours est inférieur à 6000,"
  puts "4 - La devise la plus chère parmi celles dont le cours est inférieur à 6000."
  puts "Tape un chiffre entre 1 et 4 pour lancer le programme :"
end

def exo_1(hashes) #la variable est définie sur la méthode, peu importe son nom. L'important reste qu'au moment de lancer toutes les méthodes on donne à la variable l'info pour aller chercher les données
  crypto_max = hashes.max_by do |k, v|
    v.to_f
  end #Affiche le ou les keys dont la valeur est max
end

def exo_2(hashes)
  crypto_float = hashes.group_by do |k, v| #c'est le group_by qui permet de réunir les éléments en fonctions de leur valeur, ainsi si plusieurs éléments ont la même valeur, ils seront réunis
    v.to_f #essentiel pour réunir par valeurs, ce doivent être des floats
  end
  crypto_min = crypto_float.min[1] #min renvoie un tableau comprenant les valeurs les plus petites avec à chaque fois une clé et une valeur.
  # [1] me renvoie uniquement les valeurs comprises dans mon tableau. Dans ce tableau crypto_min [0] = key = 4.5e-07
end


def perform
  intro
  print "> "
  answer = gets.chomp.to_i 
  case answer
  when 1
    puts "Exo. 1 :"
    puts "Voici la ou les crypto.s avec la plus grande valeur : #{exo_1(datas_blockchain)}." #ici datas_blockchain remplacera toutes les variables hashes dans ma méthode exo_1
    puts ""
  when 2
    puts "Exo. 2 :"
    p "Voici la ou les crypto.s avec la plus petite valeur : #{exo_2(datas_blockchain)}."
    puts ""
  #when 3
  #when 4
  else
    puts "On t'avait dit un chiffre entre 1 et 4, Andouille !"
  end
end

perform
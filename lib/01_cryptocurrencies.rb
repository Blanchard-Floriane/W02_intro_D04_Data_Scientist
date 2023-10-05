require_relative("../datas/blockchain")

def exo_1(datas_blockchain)
  crypto_max = datas_blockchain.max_by do |k, v|
    v.to_f
  end #Affiche le ou les keys dont la valeur est max
  puts "Exo. 1 :"
  puts "Voici la ou les crypto.s avec la plus grande valeur : #{crypto_max}."
end

def exo_2(datas_blockchain)
  crypto_float = datas_blockchain.group_by do |k, v| #c'est le group_by qui permet de réunir les éléments en fonctions de leur valeur, ainsi si plusieurs éléments ont la même valeur, ils seront réunis
    v.to_f #essentiel pour faire le min, ce doivent être des floats
  end
  crypto_min = crypto_float.min[1]
  puts "Exo. 2 :"
  p "Voici la ou les crypto.s avec la plus petite valeur : #{crypto_min}."
end

def perform
  exo_1(datas_blockchain)
  exo_2(datas_blockchain)
end

perform
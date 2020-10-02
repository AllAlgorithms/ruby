system('clear')

p "Qual o ano que deseja saber ?"
ano = gets.chomp.to_i


a1 = (ano % 400).to_i
a2 = (ano % 4).to_i
a3 = (ano % 100).to_i
system('clear')



if a1 == 0 || a2 == 0
	p 'É um ano bissexto'
else 
	p 'Não é um ano bissexto'
end

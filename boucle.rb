utilisateurs = [
	"Alice", "Bob", "John"
]

i = 0
utilisateurs.each do |utilisateur|
	puts i
	i = i + 1
	puts utilisateur
end

10.times do
	puts "hello"
end

10.times do |i|
	puts "hello #{i}"
end
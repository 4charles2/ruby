emails = [ 
	"bob@bob.com","jane@hello.com"
]

emails.each do |email|
	puts email
	if email == "bob@bob.com"
		puts "bonjour bob!"
	else
		puts "bonjour jane d;-}"
	end
end


if emails.size == 1
	puts "J'ai un email"
else
	puts "J'ai plus ou moins d'un email ?"
end
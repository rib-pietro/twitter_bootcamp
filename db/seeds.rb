20.times do |n| #faça 20 vezes:
	User.create(email: "user-numero#{n}@email.com", password: '123123')
end
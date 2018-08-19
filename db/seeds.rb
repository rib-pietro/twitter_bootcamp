20.times do |n| #faça 20 vezes:
	user = User.create(email: "user-numero#{n}@email.com", password: '123123')
	10.times do |nn|
		user.tweets.create(content: "Hello #{nn}")
	end
end
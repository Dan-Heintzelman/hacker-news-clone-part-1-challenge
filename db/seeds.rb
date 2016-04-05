require 'faker'

dan = User.create!(username: "dheintz", password: "password", image: Faker::Placeholdit.image)
bob = User.create!(username: "bob", password: "password", image: Faker::Placeholdit.image)
sandra = User.create!(username: "sandra", password: "password", image: Faker::Placeholdit.image)

10.times do 
	User.create!(username: Faker::Name.name, password: "password", image: Faker::Placeholdit.image)
end	

50.times do
	Post.create!(
		title: Faker::Hipster.sentence, 
		article_url: Faker::Internet.url,
		user: User.find(rand(1...13))
		) 
end


100.times do
	Comment.create!(text: Faker::Hacker.say_something_smart,
		post: Post.find(rand(1...50)),
		user: User.find(rand(1...13))
	)
end
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

filler_paragraph = 'Fugiat fanny pack locavore, roof party scenester yr cornhole fashion axe.
							Cardigan tousled scenester, PBR&B reprehenderit yr laboris est. Sint squid
							occupy paleo Intelligentsia pariatur, single-origin coffee semiotics pug sunt
							ennui. Reprehenderit assumenda mlkshk velit enim whatever vero. Readymade
							officia squid fap Terry Richardson in ethical PBR est deep v. Tattooed Marfa
							keffiyeh, cupidatat typewriter fanny pack letterpress Intelligentsia occaecat
							nostrud quinoa semiotics asymmetrical. Pork belly magna disrupt Bushwick ex
							letterpress actually, photo booth Wes Anderson leggings DIY brunch PBR&B.'

filler_sentence = 'Drinking vinegar scenester small batch, nisi bitters incididunt et twee PBR
							tousled dreamcatcher ethical viral irony. Post-ironic Etsy quinoa Pitchfork'

users = []

10.times do |n|
	users << User.create({ email: "person#{n}@gmail.com", password: 'foobar', password_confirmation: 'foobar' })
end


posts = Post.create([{ title: 'Portland Startup Weekend Pre-party!', url: 'http://portland.startupweekend.org/2013/10/23/join-the-pdxsw-pre-party/', user: users.sample },
										 { title: 'Styistically awesome filler text', url: 'http://htpsteripsum.me', user_id: users.sample.id },
										 { title: 'A social gaming site', url: 'http://newgameplus.co', user_id: users.sample.id },
										 { title: 'New coding bootcamp in Portland, OR', url: 'http://epicodus.com', user_id: users.sample.id },
										 { title: 'Want to know more about a board game? This is the best site around.', url: 'http://boardgamegeek.com', user_id: users.sample.id },
										 { title: 'It\'s essentially the Hitchhiker\'s Guide to the Galaxy', url: 'http://wikipedia.com', user_id: users.sample.id },
										 { title: 'Watch people be dumb and talk smart about tech', url: 'http://tested.com', user_id: users.sample.id },
										 { title: 'The latest culprit in paralax overuse', url: 'http://polygon.com', user_id: users.sample.id },
										 { title: 'Some nice (and free!) bootstrap templates', url: 'http://startbootstrap.com', user_id: users.sample.id },
										 { title: 'Hey, have you seen this new responsive framework?', url: 'http://getbootstrap.com', user_id: users.sample.id },
										 { title: 'Stream movies right to your livingroom. It\'s magical!', url: 'http://netflix.com', user_id: users.sample.id },
										 { title: 'Version management that doesn\'t suck', url: 'http://github.com', user_id: users.sample.id },
										 { title: 'A search engine like no others!', url: 'http://altavista.com', user_id: users.sample.id },
										 { title: 'Social network your mom will like (err...maybe that\'s not a good thing)', url: 'http://facebook.com', user_id: users.sample.id },
										 { title: 'Have a question? Don\'t mind making a fool of yourself?', url: 'http://stackoverflow.com', user_id: users.sample.id },
										 { title: 'Shopping online? And they said it couldn\'t be done!', url: 'http://amazon.com', user_id: users.sample.id }])

posts.each do |post|
	2.times { post.comments.create([{ content: filler_paragraph, user_id: users.sample.id }, { content: filler_sentence, user_id: users.sample.id }]) }
end

10.times do
	posts.sample.comments.sample.comments.create([{ content: filler_sentence, user_id: users.sample.id }])
end

100.times do
	Vote.create(user: users.sample, post: posts.sample)
end

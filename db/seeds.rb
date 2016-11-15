# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Product.delete_all

Product.create!(title: 'DJI Phantom 4',
	description:
		%{camera drone},
	image_url: '',
	price: 1399)
Product.create!(title: 'DJI Phantom 3',
	description:
		%{camera drone},
	image_url: '',
	price: 499)
Product.create!(title: 'DJI Inspire 1',
	description:
		%{camera drone},
	image_url: '',
	price: 2899)
Product.create!(title: 'Yuneec Q500 4K',
	description:
		%{camera drone},
	image_url: '',
	price: 929)
Product.create!(title: 'Yuneec Typhoon H 4k',
	description:
		%{camera drone},
	image_url: '',
	price: 1199)
Product.create!(title: '3DR Solo',
	description:
		%{camera drone},
	image_url: '',
	price: 999)
Product.create!(title: 'Parrot Bebop',
	description:
		%{camera drone},
	image_url: '',
	price: 399)
Product.create!(title: 'DJI Mavic Pro',
	description:
		%{camera drone},
	image_url: '',
	price: 999)
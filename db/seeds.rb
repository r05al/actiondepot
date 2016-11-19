admin_user = User.create(email: "admin@example.com",
												 name: "admin",
												 password: "password",
												 password_confirmation: "password",
												 admin: true)

url = "http://product1.djicdn.com/uploads/sku/covers/30020/small_aece41a1-c4fa-4644-8f3d-61d8f9bd5e4f.png"

Product.create(title: "Reviewer Beta",
							description: "Best in class drone.",
							image_url: url,
							price: 999)

# Product.delete_all


# Product.create!(title: 'DJI Phantom 4',
# 	description:
# 		%{camera drone},
# 	image_url: url,
# 	price: 1399)
# Product.create!(title: 'DJI Phantom 3',
# 	description:
# 		%{camera drone},
# 	image_url: url,
# 	price: 499)
# Product.create!(title: 'DJI Inspire 1',
# 	description:
# 		%{camera drone},
# 	image_url: url,
# 	price: 2899)
# Product.create!(title: 'Yuneec Q500 4K',
# 	description:
# 		%{camera drone},
# 	image_url: url,
# 	price: 929)
# Product.create!(title: 'Yuneec Typhoon H 4k',
# 	description:
# 		%{camera drone},
# 	image_url: url,
# 	price: 1199)
# Product.create!(title: '3DR Solo',
# 	description:
# 		%{camera drone},
# 	image_url: url,
# 	price: 999)
# Product.create!(title: 'Parrot Bebop',
# 	description:
# 		%{camera drone},
# 	image_url: url,
# 	price: 399)
# Product.create!(title: 'DJI Mavic Pro',
# 	description:
# 		%{camera drone},
# 	image_url: url,
# 	price: 999)
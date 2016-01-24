# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Post.delete_all
Review.delete_all
User.create(email: 'test')
u = User.create(email: 'test2')

Post.create!(problem: 'Как вывести Hello world',
                 code: 'https://gist.github.com/yarafan/fb03b1921e34b342432e.js',
                 reviewed: true,
                 to_be_approved: false,
                 user_id: u.id,
                 review_questions: 'Как лучше поступить?')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Post.delete_all
Review.delete_all
p = Post.create!(problem: 'Как вывести Hello world',
                 code: 'https://gist.github.com/yarafan/fb03b1921e34b342432e.js',
                 reviewed: true,
                 review_questions: 'Как лучше поступить?')
Post.create!(problem: 'Как вывести Hello world2',
             code: 'https://gist.github.com/yarafan/fb03b1921e34b342432e.js',
             reviewed: false,
             review_questions: 'Как лучше поступить3?')
Post.create!(problem: 'Как вывести Hello world3',
             code: 'https://gist.github.com/yarafan/fb03b1921e34b342432e.js',
             reviewed: false,
             review_questions: 'Как лучше поступить3?')
Review.create(text: 'Используй print', post_id: p.id)

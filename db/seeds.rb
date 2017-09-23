# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'


#create topics
15.times do
    Topic.create!(
        name: RandomData.random_sentence,
        description: RandomData.random_paragraph
    )
end
topics = Topic.all


#create posts
50.times do
    # #1
    Post.create!(
        # #2
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph
    )
end
posts = Post.all 

#create comments
# #3
100.times do
    Comment.create!(
        # #4
        post: posts.sample,
        body: RandomData.random_paragraph
    )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

Post.find_or_create_by(title: "New post!", body: "Hey, I am an original post!")


#create ads
50.times do
    Advertisement.create!(
        # #4
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: 120
    )
end

puts "Seed finished"
puts "#{Advertisement.count} ads created"

#create questions
50.times do
    Question.create!(
        # #4
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        resolved: true
    )
end

puts "Seed finished"
puts "#{Question.count} questions created"
puts "#{Topic.count} topics created"

#create sponsored posts
50.times do
    SponsoredPost.create!(
        # #4
        title: RandomData.random_sentence,
        body: RandomData.random_paragraph,
        price: 120
    )
end

puts "Seed finished"
puts "#{SponsoredPost.count} Sponsored Posts created"
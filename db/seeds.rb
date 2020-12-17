10.times do
  student=Student.create(name: Faker::Name.name, mod: rand(1..5))
  
  student.ducks << Duck.create(name: Faker::Creature::Dog.meme_phrase, description: Faker::Creature::Dog.breed)
end

# 5.times do
#   Duck.create(name: Faker::Creature::Dog.meme_phrase, description: Faker::Creature::Dog.breed, student_id: rand(1..10))
# end
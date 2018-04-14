p 'Please wait...'
# Creaete users and teams
50.times.each do
  user = User.create!(
    provider: 'starladder',
    uid: SecureRandom.uuid,
    email: Faker::Internet.email,
    nick: Faker::Name.name,
    uuid: SecureRandom.uuid
  )
  user.teams.create(
    name: Faker::Team.name,
    logo: File.open(Rails.root + 'lib/assets/seeds_images/logo.png')
  )
end
# Create tournaments
20.times.each do
  Tournament.create(name: Faker::Company.name)
end
p 'Done!'

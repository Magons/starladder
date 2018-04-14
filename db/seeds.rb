# Creaete users and teams
p 'Please wait...'
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
p 'Done!'

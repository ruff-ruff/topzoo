User.find_or_create_by!(username: "admin") do |user|
  user.password = "topzoo"
  user.role = "admin"
end

User.find_or_create_by!(username: "explorer") do |user|
  user.password = "welcome"
  user.role = "user"
end

[
  {
    name: "Red panda",
    scientific_name: "Ailurus fulgens",
    taxonomy: "Mammal, Carnivore",
    habitat: "Eastern Himalayas",
    summary: "A small tree-dwelling mammal with a rust-red coat and a famously expressive face."
  },
  {
    name: "Blue whale",
    scientific_name: "Balaenoptera musculus",
    taxonomy: "Mammal, Marine",
    habitat: "Open ocean",
    summary: "The largest animal known to have ever lived, moving through the ocean with quiet power."
  },
  {
    name: "Green sea turtle",
    scientific_name: "Chelonia mydas",
    taxonomy: "Reptile, Marine",
    habitat: "Tropical and subtropical seas",
    summary: "A long-distance ocean traveler that returns to sandy beaches to begin the next generation."
  }
].each do |attributes|
  Animal.find_or_create_by!(name: attributes[:name]) { |animal| animal.assign_attributes(attributes) }
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


organisations = [
  {
    name: "THE WHY",
    subheading: "Free access to information for everyone everywhere is the way to a just world.",
    description: "The WHY Foundation is a non-profit media organization with a mission to provide the world with thought-provoking journalism and entertaining human interests stories, that inspire people to ask WHY?. The WHY produces and distributes documentaries about human rights, democracy, justice and environment that are being used in schools, community centres, public cinemas or citizens at large through television stations in almost 200 countries. With the project ASK WHY? it brings quality documentaries and discussions about human rights into the public education system in Denmark.",
    categories: ["Human Right", "Art", "Media"],
    tags: ["documentaries", "film", "media", "journalism", "human rights", "environment"],
    website: "https://www.thewhy.dk/",
    facebook: "https://www.facebook.com/TheWhyFound/",
    linkedin: "https://www.linkedin.com/company/thewhyfoundation/",
    internship: true,
    english: true,
    volunteering: false,
    address: "Gothersgade 55,Copenhagen,1123,Denmark",
    email: "info@thewhy.dk",
    phone: "31384191"
  }
]

organisations.each do |organisation|
  Organisation.create(organisation)
end

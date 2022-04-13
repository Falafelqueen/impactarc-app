# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "open-uri"
require "csv"

Tag.destroy_all
OrganisationCategory.destroy_all
Organisation.destroy_all
Category.destroy_all
SearchWord.destroy_all
puts "Deleted all organisations, tags, searchwords"

puts "Creating new organisations"
organisations = [
  {
    name: "THE WHY",
    subheading: "Free access to information for everyone everywhere is the way to a just world.",
    description: "The WHY Foundation is a non-profit media organization with a mission to provide the world with thought-provoking journalism and entertaining human interests stories, that inspire people to ask WHY?. The WHY produces and distributes documentaries about human rights, democracy, justice and environment that are being used in schools, community centres, public cinemas or citizens at large through television stations in almost 200 countries. With the project ASK WHY? it brings quality documentaries and discussions about human rights into the public education system in Denmark.",
    categories: ["Art", "Media", "Homelessness"],
    tags: ["documentaries", "film", "media", "journalism", "human rights", "environment"],
    website: "https://www.thewhy.dk/",
    facebook: "https://www.facebook.com/TheWhyFound/",
    linkedin: "https://www.linkedin.com/company/thewhyfoundation/",
    internship: true,
    english: true,
    volunteering: false,
    street: "Gothersgade 55",
    city: "Copenhagen",
    zip: "1123",
    country: "Denmark",
    email: "info@thewhy.dk",
    phone: "31384191",
    logo: "app/assets/images/logos/thewhy.png",
    unsolicited: true
  }
]

organisations.each do |organisation|
  organisation_in_db = Organisation.new(
    name: organisation[:name],
    subheading: organisation[:subheading],
    description: organisation[:description],
    website: organisation[:website],
    facebook: organisation[:facebook],
    linkedin: organisation[:linkedin],
    internship: organisation[:internship],
    volunteering: organisation[:volunteering],
    street: organisation[:street],
    country: organisation[:country],
    zip: organisation[:zip],
    city: organisation[:city],
    email: organisation[:email],
    phone: organisation[:phone],
    unsolicited: organisation[:unsolicited]
  )

  logo = organisation[:logo].split('/')
  organisation_in_db.photo.attach(io: File.open(organisation[:logo]), filename: "#{logo.last}.png", content_type: "image/png")
  organisation_in_db.save!
  organisation[:tags].each do |tag|
    tag_word = SearchWord.create(search_word: tag)
    Tag.create(search_word: tag_word, organisation: organisation_in_db)
  end
  organisation[:categories].each do |category|
    puts category
    category_in_db = Category.create!(name: category, main: false)
    OrganisationCategory.create(organisation: organisation_in_db, category: category_in_db)
  end
end

puts "Done creating new organisations"

puts "Seeding categories"

categories = [
  {
    name: "human rights",
    main: "true"
  },
  {
    name: "environment",
    main: "true"
  },
  {
    name: "social work",
    main: "false"
  },
  {
    name: "gender equality",
    main: "false"
  }
]

categories.each do |category|
  Category.create(name: category[:name], main: category[:main])
end

puts "Done seeding categories"

csv_text = File.read(Rails.root.join('lib','seeds','ngos_110422.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'UTF-8')

csv.each do |row|
  if row['Org. description'] != nil && row['Active'].downcase == 'yes'
    org = Organisation.new
    org.name = row['OrgName']
    org.subheading = row['Subheading']
    org.description = row['Org. description']
    org.email = row['Email General']
    org.phone = row['Number']
    org.website = row['Web']
    org.linkedin = row['LinkedIn']
    org.facebook = row['FB']
    org.street = row['Address']
    org.city = row['City']
    org.country = row['Country']
    org.zip = row['ZIP']
    org.size = row['Size'].downcase
    if row['Unsolicited'].downcase == 'yes'
      org.unsolicited = true
    end
    if row['Volunteer oportunity'].downcase == 'yes'
      org.volunteering = true
    end
    #joins category rows into one array
    #iterate over the org_cat array creates Organisation category instances
    #tags
    org.save
    puts "#{org.name} saved"
  end
end

puts "There is now #{Organisation.count} rows in the organisations table"

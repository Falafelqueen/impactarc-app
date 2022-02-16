FactoryBot.define do
  factory :organisation do
    name {'Example name'}
    subheading {'Example subheading'}
    description {'Example blabla bla bla bla bla bla
    blablablablabla bla blabla Example blabla bla bla bla bla bla
    blablablablabla bla blabla Example blabla bla bla bla bla bla
    blablablablabla bla blabla Example blabla bla bla bla bla bla
    blablablablabla bla blabla'}
    tags {['human rights', 'homeless people', 'serving food', 'homeless shelter']}
    categories {['human rights', 'homelessness']}
    english {true}
    internship {true}
    volunteering {true}
    address {
      {street: 'Example street'}
     { city: 'Example city'}
      {zip_code: '12345'}
      {country: 'Denmark'}
    }
    email {'examplemail@example'}
    phone {'12343454'}
    social_media {
      {linkedin: 'examplelink'}
     { facebook: 'examplelink'}
      {instagram: 'examplelink'}
    }

  end
end

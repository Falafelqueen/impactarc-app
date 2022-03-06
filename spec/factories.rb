
FactoryBot.define do
  factory :tag do
    
  end

  factory :search_word do
    search_word { "MyString" }
  end

  factory :organisation do
    name {'Name example'}
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
    address {'Example street,Copenhagen,2450,Denmark'}
    email {'examplemail@example.com'}
    phone {'12343454'}
    linkedin  {'examplelink'}
    facebook {'examplelink'}
    instagram {'examplelink'}
  end
end

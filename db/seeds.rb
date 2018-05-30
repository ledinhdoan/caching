30.times do
  company = Company.new(:name => Faker::Company.name)
  if company.save
    SecureRandom.random_number(100).times do
      company.employees.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
      phone_number: Faker::PhoneNumber.phone_number
      )
    end
  end
end

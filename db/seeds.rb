if Rails.env.development? || Rails.env.production?
  3.times do |i|
    User.create!(email: "user#{i}@example.com", 
                 password: '123456',
                 password_confirmation: '123456',
                 username: "user#{i}@example")
  end
  
  3.times do |i|
    User.create!(email: "doctor#{i}@example.com", 
                 password: '123456',
                 role: 'doctor',
                 password_confirmation: '123456',
                 username: "doctor#{i}@example")
  end

  User.create!( email: "admin@example.com", 
                password: '123456',
                role: 'admin',
                password_confirmation: '123456',
                username: "admin@example")

  User.create!( email: "patient_phone@example.com",
                phone: "+380969407281", 
                password: '123456',
                role: 'patient',
                password_confirmation: '123456',
                username: "patient_phone@example")

  3.times do |i|
    Category.create!(name: "category#{i}@example")
  end

  Category.last.users << User.where(role: 'doctor').last
end

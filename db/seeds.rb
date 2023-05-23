if Rails.env.development?
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

  User.create!(email: "admin@example.com", 
                password: '123456',
                role: 'admin',
                password_confirmation: '123456',
                username: "admin@example")

  3.times do |i|
    Category.create!(name: "category#{i}@example")
  end

  Category.last.users << User.where(role: 'doctor').last
end

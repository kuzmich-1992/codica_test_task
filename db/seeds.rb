if Rails.env.development?
  3.times do |i|
    User.create!(email: "user#{i}@example.com", 
                password: '123456',
                password_confirmation: '123456',
                username: "admin#{i}@example")
  end
  
  3.times do |i|
    User.create!(email: "doctor#{i}@example.com", 
                password: '123456',
                role: 'doctor',
                password_confirmation: '123456',
                username: "doctor#{i}@example")
  end

  3.times do |i|
    Category.create!(name: "category#{i}@example")
  end
end

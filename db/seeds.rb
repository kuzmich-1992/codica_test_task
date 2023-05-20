if Rails.env.development?
  3.times do |i|
    User.create!(email: "admin#{i}@example.com", 
                password: '123456',
                password_confirmation: '123456',
                username: "admin#{i}@example")
  end
end

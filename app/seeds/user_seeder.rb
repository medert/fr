class UserSeeder
  USERS = [
    {
      first_name: "Elya",
      last_name: "Tur",
      email: "sladkii@gmail.com",
      birthdate: "10/10/1900",
      gender: "Female",
      address: "38 Baxter str.",
      town: "Quincy",
      state: "MA",
      zip: "02169",
      d_lisence: "XXXXXXXX",
      phone: "123456789",
      rating: 1,
      role: "member",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }, {
      first_name: "Sunjar",
      last_name: "Tok",
      email: "sun@gmail.com",
      birthdate: "12/12/2000",
      gender: "Male",
      address: "38 Baxter str.",
      town: "Quincy",
      state: "MA",
      zip: "02169",
      d_lisence: "YYYYYYY",
      phone: "123456789",
      rating: 4,
      role: "member",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }, {
      first_name: "Lenny",
      last_name: "Kravitz",
      email: "lenny@gmail.com",
      birthdate: "12/12/1991",
      gender: "Male",
      address: "38 Baxter str.",
      town: "Quincy",
      state: "MA",
      zip: "02169",
      d_lisence: "FFFFFF",
      phone: "123456789",
      rating: 1,
      role: "member",
      password: "password",
      password_confirmation: "password",
      profile_photo: "http://lh3.ggpht.com/-TWC9qIZtt_c/Td-Z61cQk3I/AAAAAAAAAwY/HnIRI9DkBJg/s1600-h/facebook-dp%25255B7%25255D.png"
    }

  ]

  def self.seed!
    USERS.each do |user_params|
      first_name = user_params[:first_name]
      user = User.find_or_initialize_by(first_name: first_name)
      user.assign_attributes(user_params)
      user.save!
    end
  end

#   users.each do |user_params|
#     first_name = user_params[:first_name]
#     user = User.find_or_create_by!(first_name: first_name, last_name: last_name, email: email, role: role, password: password, password_confirmation: password_confirmation, profile_photo: profile_photo)
#     user.save!
#   end
end

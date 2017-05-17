namespace :db do
  desc "Fill database with sample data"
  task create_admin_account: :environment do
    admin = User.create!(name:  "Admin",
                         email: "numiz_admin@gmail.com",
                         password: "qwerty",
                         password_confirmation: "qwerty",
                         admin: true,
                         sex:   true)
  end
end

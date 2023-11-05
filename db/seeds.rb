# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Person.create(full_name: 'Иванов Иван Иванович', date_of_birth: Date.new(1990, 3, 15), phone_number: '123-456-7890', email: 'ivan@example.com')
Person.create(full_name: 'Петров Петр Петрович', date_of_birth: Date.new(1985, 8, 22), phone_number: '987-654-3210', email: 'petr@example.com')
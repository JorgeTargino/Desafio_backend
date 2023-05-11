# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Status.create(status_name: "SUBSCRIPTION_PURCHASED")
Status.create(status_name: "SUBSCRIPTION_CANCELED")
Status.create(status_name: "SUBSCRIPTION_RESTARTED")

User.create(full_name: "Adolfo")
User.create(full_name: "Ana Adila")
User.create(full_name: "Alex")
User.create(full_name: "Cesar")
User.create(full_name: "Deybson")
User.create(full_name: "Luana")
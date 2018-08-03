# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
registries = Registry.create([{
  address: "43 Hanson st Newtown Wellington",
  icp: "123456789" },
  { address: "14A Beach st Somgeville Auckland",
  icp: "951648237" },
  { address: "8 Woodvile road Lesston Canterbury",
  icp: "984EF5761" },
  { address: "86 Customhouse Quay Wellington",
  icp: "144476500" }
])


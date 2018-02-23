# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ClusterCounterType.create([
    {
      code: 1,
      description: 'Adição vindo de outro tanque'
    },
    {
      code: 2,
      description: 'Peixes mortos'
    },
    {
      code: 3,
      description: 'Peixes enviados para outro tanque'
    }
])

FishType.create([
  {
    name: 'Tilapia'
  },
  {
    name: 'Pintado'
  }
])

Food.create([
  {
    name: 'Ração A',
    thickness: 10
  },
  {
    name: 'Ração B',
    thickness: 20
  }
])

Lot.create([{
  price: 1000,
  validity: "2018-02-09",
  buy_date: "2018-10-09",
  quantity: 1000,
  current_quantity: 1000,
  food_id: 1
}])

Tank.create([{
  name: 'Tanque A'
}])


Cluster.create([
  {
    total: 300,
    is_done: "f",
    current_total: 300,
    fish_type_id: 1,
    tank_id: 1,
    initial_weight: 200
  }
])

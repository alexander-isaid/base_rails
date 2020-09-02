# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

r1 = Role.create({ name: 'admin', descripcion: 'Administrador del sistema' })
r2 = Role.create({ name: 'empresa', descripcion: 'Empresa pueda configurar opciones especiales para su empresa' })
r3 = Role.create({ name: 'operador', descripcion: 'Puede ver operaciones pero no puede realizar operaciones' })
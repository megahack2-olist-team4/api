# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Admin.where({ email: 'admin@example.com' }).exits?
  Admin.create!({ email: 'admin@example.com', password: 'KJRcS1JkNL', password_confirmation: 'KJRcS1JkNL' })
end

Site.create_with({ url: 'https://www.mercadolivre.com.br' }).find_or_create_by({ name: 'Mercado Livre' })
Site.create_with({ url: 'https://www.americanas.com.br' }).find_or_create_by({ name: 'Americanas' })
Site.create_with({ url: 'https://www.carrefour.com.br/' }).find_or_create_by({ name: 'Carrefour' })
Site.create_with({ url: 'https://www.madeiramadeira.com.br/' }).find_or_create_by({ name: 'Madeira Madeira' })
Site.create_with({ url: 'https://www.zoom.com.br/' }).find_or_create_by({ name: 'Zoom' })

Category.create_with({ slug: 'generic', keywords: [] }).find_or_create_by({ name: 'Genérico' })
Category.create_with({ keywords: ['celular', 'celulares', 'smartphone', 'smartphones'] }).find_or_create_by({ name: 'Celulares e Smartphones' })
Category.create_with({ keywords: ['eletrodoméstico', 'eletrodomésticos'] }).find_or_create_by({ name: 'Eletrodomésticos' })
Category.create_with({ keywords: ['console', 'consoles'] }).find_or_create_by({ name: 'Consoles' })
Category.create_with({ keywords: ['jogos', 'games'] }).find_or_create_by({ name: 'Jogos' })



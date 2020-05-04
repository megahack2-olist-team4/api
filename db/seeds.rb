# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

unless Admin.where({ email: 'admin@example.com' }).exists?
  Admin.create!({ email: 'admin@example.com', password: 'KJRcS1JkNL', password_confirmation: 'KJRcS1JkNL' })
end

sites = []
sites << Site.create_with({ url: 'https://www.mercadolivre.com.br' }).find_or_create_by({ name: 'Mercado Livre' })
sites << Site.create_with({ url: 'https://www.americanas.com.br' }).find_or_create_by({ name: 'Americanas' })
sites << Site.create_with({ url: 'https://www.carrefour.com.br/' }).find_or_create_by({ name: 'Carrefour' })
sites << Site.create_with({ url: 'https://www.madeiramadeira.com.br/' }).find_or_create_by({ name: 'Madeira Madeira' })
sites << Site.create_with({ url: 'https://www.zoom.com.br/' }).find_or_create_by({ name: 'Zoom' })

categories = []
categories << Category.create_with({ slug: 'generic', keywords: [] }).find_or_create_by({ name: 'Genérico' })
categories << Category.create_with({ keywords: ['celular', 'celulares', 'smartphone', 'smartphones'] }).find_or_create_by({ name: 'Celulares e Smartphones' })
categories << Category.create_with({ keywords: ['eletrodoméstico', 'eletrodomésticos'] }).find_or_create_by({ name: 'Eletrodomésticos' })
categories << Category.create_with({ keywords: ['console', 'consoles'] }).find_or_create_by({ name: 'Consoles' })
categories << Category.create_with({ keywords: ['jogos', 'games'] }).find_or_create_by({ name: 'Jogos' })

question = Question.create_with({ public: true, categories: [categories[0]] }).find_or_create_by({ description: 'Quais são as formas de envio?' })
Question.create_with({ public: true, relateds: [question], categories: [categories[0]] }).find_or_create_by({ description: 'Envia por PAC?' })
Question.create_with({ public: true, relateds: [question], categories: [categories[0]] }).find_or_create_by({ description: 'Envia por Sedex?' })
Question.create_with({ public: true, relateds: [question], categories: [categories[0]] }).find_or_create_by({ description: 'A entrega demora muito' })

question = Question.find_or_create_by({ description: 'Quais são as formas de pagamento?', public: true })
Question.create_with({ public: true, relateds: [question], categories: [categories[0]] }).find_or_create_by({ description: 'Parcela em quantas vezes?' })
Question.create_with({ public: true, relateds: [question], categories: [categories[0]] }).find_or_create_by({ description: 'Aceita pagamento em boleto?' })

question = Question.create_with({ public: true, categories: [categories[0]] }).find_or_create_by({ description: 'Quais são as garantias?' })
Question.create_with({ public: true, relateds: [question], categories: [categories[0]] }).find_or_create_by({ description: 'Tem garantia do vendedor?' })
Question.create_with({ public: true, relateds: [question], categories: [categories[0]] }).find_or_create_by({ description: 'Tem garantia da fábrica?' })
Question.create_with({ public: true, relateds: [question], categories: [categories[0]] }).find_or_create_by({ description: 'Quanto tempo de garantia?' })

Question.create_with({ public: true, categories: [categories[0]] }).find_or_create_by({ description: 'Há estoque disponível?' })
Question.create_with({ public: true, categories: [categories[0]] }).find_or_create_by({ description: 'Produto é novo ou usado?' })
Question.create_with({ public: true, categories: [categories[0]] }).find_or_create_by({ description: 'Em quais cores tem disponíveis?' })
Question.create_with({ public: true, categories: [categories[0]] }).find_or_create_by({ description: 'Quais items compõem o produto? (cabos, acessórios, pilhas, etc.)' })
Question.create_with({ public: true, categories: [categories[0]] }).find_or_create_by({ description: 'Na compra de mais produtos, consigo algum desconto ou frete grátis?' })
Question.create_with({ public: true, categories: [categories[0]] }).find_or_create_by({ description: 'Se não gostar posso devolver o produto?' })
Question.create_with({ public: true, categories: [categories[0]] }).find_or_create_by({ description: 'Vem com nota fiscal?' })

sites.each do |site|
  Question.all.each do |question|
    QuestionsSite.find_or_create_by({ question: question, site: site })
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rake db:seed pour démo
admin = User.create(pseudo: 'Corentin', nom: 'Flach', prenom: 'Corentin', email: 'corentin.flach@gmail.com', url_img: 'http://corentinflach.fr/img/profil_default.jpg', password: 'pouetpouet', king: true)
Post.create(url_img: 'http://aws.vdkimg.com/film/5/5/6/6/55660_backdrop_scale_1280xauto.jpg', url_film: 'http://www.allocine.fr/film/fichefilm_gen_cfilm=111835.html', user_id: admin.id, film_name: 'OSS 117 : Rio ne répond plus', clue: 'Une comédie hilarante avec Jean Dujardin')
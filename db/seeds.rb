# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Patients

User.delete_all

user = User.new
user.id = '1'
user.sex = 'M'
user.email = 'example@mail.com'
user.password = 'password'
user.password_confirmation = 'password'
user.first_name = 'John'
user.last_name = 'Smith'
user.pesel = '87111112345'
user.save!

user = User.new
user.id = '2'
user.sex = 'F'
user.email = 'example2@mail.com'
user.password = 'password'
user.password_confirmation = 'password'
user.first_name = 'Jenny'
user.last_name = 'Davis'
user.pesel = '76121212345'
user.save!

user = User.new
user.id = '3'
user.sex = 'M'
user.email = 'example3@mail.com'
user.password = 'password'
user.password_confirmation = 'password'
user.first_name = 'Carl'
user.last_name = 'Amsterdam'
user.pesel = '92052312345'
user.save!

Lab.delete_all

lab = Lab.new
lab.id = '1'
lab.email = 'lab@example.mail'
lab.password = 'password'
lab.password_confirmation = 'password'
lab.name = 'Introdus'
lab.description = 'description'
lab.save!

lab = Lab.new
lab.id = '2'
lab.email = 'lab2@example.mail'
lab.password = 'password'
lab.password_confirmation = 'password'
lab.name = 'Exodus'
lab.description = 'description2'
lab.save!

Worker.delete_all

worker = Worker.new
worker.id = '1'
worker.sex = 'M'
worker.email = 'example@mail.com'
worker.password = 'password'
worker.password_confirmation = 'password'
worker.first_name = 'Philip'
worker.last_name = 'Marker'
worker.pesel = '87111112345'
worker.lab_id = '1'
worker.save!

worker = Worker.new
worker.id = '2'
worker.sex = 'M'
worker.email = 'example2@mail.com'
worker.password = 'password'
worker.password_confirmation = 'password'
worker.first_name = 'George'
worker.last_name = 'Crusoe'
worker.pesel = '76121212345'
worker.lab_id = '1'
worker.save!

worker = Worker.new
worker.id = '3'
worker.sex = 'F'
worker.email = 'example3@mail.com'
worker.password = 'password'
worker.password_confirmation = 'password'
worker.first_name = 'Mary'
worker.last_name = 'Poppins'
worker.pesel = '76021212365'
worker.lab_id = '2'
worker.save!


TypeOfTissue.delete_all

TypeOfTissue.new(tissue: 'Haema', translation: 'Blood').save!
TypeOfTissue.new(tissue: 'Textus cartilagineus', translation: 'Cartilage').save!
TypeOfTissue.new(tissue: 'Textus osseus', translation: 'Bone').save!
TypeOfTissue.new(tissue: 'Textus muscularis', translation: 'Muscle').save!
TypeOfTissue.new(tissue: 'Thymus', translation: 'Thymus').save!
TypeOfTissue.new(tissue: 'Medulla ossium', translation: 'Bone marrow').save!
TypeOfTissue.new(tissue: 'Lymphonodus', translation: 'Lymphatic node').save!
TypeOfTissue.new(tissue: 'Lien', translation: 'Spleen').save!
TypeOfTissue.new(tissue: 'Hypophysis', translation: 'Pituitary gland').save!
TypeOfTissue.new(tissue: 'Glandula thyroidea', translation: 'Thyroid gland').save!
TypeOfTissue.new(tissue: 'Glandula paratheroidea', translation: 'Parathyroid gland').save!
TypeOfTissue.new(tissue: 'Glandula suprarenalis', translation: 'Adrenal gland').save!
TypeOfTissue.new(tissue: 'Lingua', translation: 'Tongue').save!
TypeOfTissue.new(tissue: 'Oesophagus', translation: 'Oesophagus').save!
TypeOfTissue.new(tissue: 'Ventriculus', translation: 'Stomach').save!
TypeOfTissue.new(tissue: 'Duodenum', translation: 'Duodenum').save!
TypeOfTissue.new(tissue: 'Jejunum', translation: 'Jejunum').save!
TypeOfTissue.new(tissue: 'Hepar', translation: 'Liver').save!
TypeOfTissue.new(tissue: 'Pancreas', translation: 'Pancreas').save!
TypeOfTissue.new(tissue: 'Ren', translation: 'Kidney').save!
TypeOfTissue.new(tissue: 'Ovarium', translation: 'Ovary').save!
TypeOfTissue.new(tissue: 'Uterus', translation: 'Uterus').save!
TypeOfTissue.new(tissue: 'Testis', translation: 'Testis').save!
TypeOfTissue.new(tissue: 'Cerebrum', translation: 'Brain').save!
TypeOfTissue.new(tissue: 'Cardia', translation: 'Heart').save!
TypeOfTissue.new(tissue: 'Mamma', translation: 'Mammary gland').save!

TypeOfExamination.delete_all

TypeOfExamination.new(examination: 'Analog microscophy').save!
TypeOfExamination.new(examination: 'Electron microscophy').save!
TypeOfExamination.new(examination: 'Transmition microscophy').save!

Result.delete_all

Result.new(description: 'description1', diagnosis: 'diagnosis1', type_of_tissue_id: '1', type_of_examination_id: '1').save!
Result.new(description: 'description2', diagnosis: 'diagnosis2', type_of_tissue_id: '2', type_of_examination_id: '2').save!
Result.new(description: 'description3', diagnosis: 'diagnosis3', type_of_tissue_id: '3', type_of_examination_id: '3').save!
Result.new(description: 'description4', diagnosis: '', type_of_tissue_id: '3', type_of_examination_id: '1').save!
Result.new(description: 'description5', diagnosis: '', type_of_tissue_id: '2', type_of_examination_id: '2').save!

ResultsForUser.delete_all

ResultsForUser.new(user_id: '1', worker_id: '1', result_id: '1').save!
ResultsForUser.new(user_id: '2', worker_id: '1', result_id: '2').save!
ResultsForUser.new(user_id: '2', worker_id: '2', result_id: '3').save!
ResultsForUser.new(user_id: '1', worker_id: '3', result_id: '4').save!
ResultsForUser.new(user_id: '3', worker_id: '1', result_id: '5').save!



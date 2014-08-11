require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Project.destroy_all
User.destroy_all
Task.destroy_all

100.times do |n|
	project = Project.create!(
		name: Faker::Company.name
	)
end

4.times do |u|
	user = User.create!(
		email: Faker::Internet.safe_email,
		projects: Project.all.sample(3)
	)
end

statuses = ["todo", "doing", "done"]
User.all.each do |u|
	u.projects.each do |p|
		3.times do
			task = Task.create!(
				name: Faker::Company.catch_phrase,
				status: statuses.sample(1)[0],
				project_id: p.id,
				user_id: u.id
			)
		end
	end
end

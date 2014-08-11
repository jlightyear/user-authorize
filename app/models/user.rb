class User < ActiveRecord::Base
has_and_belongs_to_many :projects
has_many :tasks

	validates :email,   presence: true, uniqueness: true
end
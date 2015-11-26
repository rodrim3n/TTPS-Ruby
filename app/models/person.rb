class Person < ActiveRecord::Base
  has_many :bills, :dependent => :nullify
  validates :cui, :uniqueness => true
end

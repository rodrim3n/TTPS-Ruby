class Person < ActiveRecord::Base
  has_many :bills, :dependent => :nullify
end

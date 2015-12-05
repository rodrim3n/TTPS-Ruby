class Client < ActiveRecord::Base
  has_many :contacts, :dependent => :destroy
  accepts_nested_attributes_for :contacts, allow_destroy: true,
                reject_if: lambda { |attr| attr['value'].blank? }

  has_many :bills, :dependent => :destroy

  validates :name, :surname, :gender, :dni, :birthdate, :cui, presence: true
  validates :cui, :dni, uniqueness: true
end

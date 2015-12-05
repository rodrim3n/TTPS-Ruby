class Bill < ActiveRecord::Base
  belongs_to :person
  belongs_to :client
  validates :description, :total, :emission_date, presence: true
  validates :total, numericality: true
end

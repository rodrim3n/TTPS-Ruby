class Bill < ActiveRecord::Base
  belongs_to :person
  belongs_to :client

  validates :description, :total, :emission_date, :person, :client, presence: true
  validates :total, numericality: true

  validates_associated :person, :client

  scope :most_sold, -> { group(:person_id).order("sum_total DESC").sum('total') }

  scope :total_per_year, lambda { group("strftime('%Y', emission_date)").sum('total') }

  scope :emitted_per_month, lambda {|year| where("strftime('%Y', emission_date) = ?", year).group("strftime('%m', emission_date)").count }
end

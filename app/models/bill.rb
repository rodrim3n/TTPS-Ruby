class Bill < ActiveRecord::Base
  belongs_to :person
  belongs_to :client
  validates :description, :total, :emission_date, presence: true
  validates :total, numericality: true

  scope :by_year, lambda {|date| where("emission_date >= ? and emission_date <= ?", "#{date.year}-01-01", "#{date.year}-12-31")}
  scope :per_month, lambda {|date| where("emission_date >= ? and emission_date <= ?", "#{date.year}-01-01", "#{date.year}-12-31").group("strftime('%m', emission_date)").count }
  scope :most_sold, -> { group(:person_id).order('count_id desc').count(:id) }

end

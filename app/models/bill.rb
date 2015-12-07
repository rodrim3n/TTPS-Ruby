class Bill < ActiveRecord::Base
  belongs_to :person
  belongs_to :client
  validates :description, :total, :emission_date, presence: true
  validates :total, numericality: true

  scope :by_date, lambda {|start_date, end_date| where("emission_date >= ? and emission_date <= ?", start_date, end_date)}
  scope :by_year, lambda {|year| by_date("#{year}-01-01", "#{year}-12-31")}
  scope :per_month, lambda {|year| by_year(year).group("strftime('%m', emission_date)").count }

  scope :most_sold, -> { group(:person_id).order("sum_total DESC").sum('total') }

end

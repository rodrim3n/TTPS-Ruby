module ClientsHelper
  def age(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.change(:year => now.year) > now ? 1 : 0)
  end
  def date(a_date)
    a_date.strftime("%d/%m/%Y")
  end
end

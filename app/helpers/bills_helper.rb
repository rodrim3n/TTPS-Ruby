module BillsHelper
  def date(a_date)
    a_date.strftime("%d/%m/%Y")
  end
end

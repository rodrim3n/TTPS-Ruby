require 'test_helper'

class BillTest < ActiveSupport::TestCase

  test "creacion CON errores de validacion" do
    bill = Bill.create(description: 'una descripcion',
                total: '',
                emission_date: '2015-09-09',
                person_id: 1,
                client_id: 1,
                )
    assert_predicate bill, :invalid?
  end

  test "creacion SIN errores de validacion" do
    client = Client.first
    person = Person.first
    bill = Bill.new(description: 'una descripcion',
                total: 100,
                emission_date: '2015-09-09',
                person_id: person,
                client_id: client,
                )
    assert bill.save, bill.errors.full_messages
  end
end

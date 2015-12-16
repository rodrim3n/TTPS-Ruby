require 'test_helper'

class BillTest < ActiveSupport::TestCase

  test "creacion CON errores de validacion" do
    bill = Bill.create(description: 'una descripcion',
                total: '',
                emission_date: '2015-09-09',
                person_id: 1,
                client_id: 1,
                )
    assert_not_empty bill.errors.full_messages
  end

  test "creacion SIN errores de validacion" do
    bill = Bill.new(description: 'una descripcion',
                total: 100,
                emission_date: '2015-09-09',
                person_id: 1,
                client_id: 1,
                )
    assert bill.save
  end
end

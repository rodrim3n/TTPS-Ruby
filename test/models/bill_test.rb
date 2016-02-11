require 'test_helper'

class BillTest < ActiveSupport::TestCase

  def setup
    @client = Client.create(name: 'Juan',
                        surname: 'Carlos',
                        gender: 'Hombre',
                        dni: 123456,
                        birthdate: '2015-09-09',
                        cui: 9999999,
                        contacts_attributes: [ source: 'skype', value: 'juan.carlos' ]
                        )

    @person = Person.create(name: 'Roberto', cui: 929292918231)
  end

  test "creacion CON errores de validacion" do
    bill = Bill.create(description: 'una descripcion',
                total: '',
                emission_date: '2015-09-09',
                person_id: @client.id,
                client_id: @person.id,
                )
    assert_predicate bill, :invalid?
  end

  test "creacion SIN errores de validacion" do
    bill = Bill.new(description: 'una descripcion',
                total: 100,
                emission_date: '2015-09-09',
                person_id: @client.id,
                client_id: @person.id,
                )
    assert bill.save, bill.errors.full_messages
  end
end

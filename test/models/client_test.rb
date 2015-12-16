require 'test_helper'

class ClientTest < ActiveSupport::TestCase

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

    @bill = Bill.create(description: 'una descripcion',
                total: 100,
                emission_date: '2015-09-09',
                person_id: @person.id,
                client_id: @client.id,
                )
  end

  def teardown
    @client = nil
  end

  test "creacion con DNI no valido" do
    cliente = Client.create(name: 'Juan',
                        surname: 'Carlos',
                        gender: 'Hombre',
                        birthdate: '2015-09-09',
                        cui: 98127364,
                        dni: 'un_string',
                        )

    assert_not_empty cliente.errors.full_messages
  end

  test "creacion SIN dato de contacto" do
    cliente = Client.create(name: 'Juan',
                        surname: 'Carlos',
                        gender: 'Hombre',
                        dni: 995599,
                        birthdate: '2015-09-09',
                        cui: 81249475,
                        )
    assert_empty cliente.contacts
  end

  test "creacion CON dato de contacto" do
    cliente = Client.create(name: 'Juan',
                        surname: 'Carlos',
                        gender: 'Hombre',
                        dni: 123456,
                        birthdate: '2015-09-09',
                        cui: 9999999,
                        contacts_attributes: [ source: 'skype', value: 'juan.carlos' ]
                        )

    assert_not_empty cliente.contacts
  end

  test "borrado CON facturas emitidas" do #deberian borrarse las facturas al eliminar el cliente
    @client.destroy
    assert_equal 0, @client.bills.count
  end

  test "borrado SIN facturas emitidas" do #deberian eliminarse los cntactos al eliminar el cliente
    @client.destroy
    assert_equal 0, @client.contacts.count
  end

end

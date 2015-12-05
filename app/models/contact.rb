class Contact < ActiveRecord::Base
  belongs_to :client
  validates :source, inclusion: { in: %w(whatsapp telefono mail) }
end

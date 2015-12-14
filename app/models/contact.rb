class Contact < ActiveRecord::Base
  belongs_to :client, :dependent => :destroy
  validates :source, inclusion: { in: %w(whatsapp telefono mail skype) }
end

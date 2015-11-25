class Bill < ActiveRecord::Base
  belongs_to :person
  belongs_to :client
end

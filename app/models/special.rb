class Special < ApplicationRecord
  belongs_to :comedian

  def self.get_by_id(id); Special.where(:comedian_id => id) end
end
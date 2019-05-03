class Special < ApplicationRecord
  belongs_to :comedian

  def self.get_by_id(id); return Special.where(:comedian_id => id) end

  def destroy_with_id(id); return Special.destroy_all(:comedian_id => id) end
end
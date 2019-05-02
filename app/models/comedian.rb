class Comedian < ApplicationRecord
  has_many :specials

  def self.get_cities; where.not(:home => "").distinct.pluck(:home) end

  def self.query_name(query); where(:name => query) end

  def self.query_age(query); where(:name => query) end

  def self.by_name; order(:name) end
end

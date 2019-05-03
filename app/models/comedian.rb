class Comedian < ApplicationRecord
  has_many :specials

  def self.get_cities; return where.not(:home => "").distinct.pluck(:home) end

  def self.query_name(query); return where(:name => query) end

  def self.query_age(query); return where(:name => query) end

  def self.by_name; return order(:name) end

  def self.prepare; return self.count, self.average(:age), self.get_cities end
end

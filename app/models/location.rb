class Location < ApplicationRecord
  belongs_to :toilet

  def initialize
    if @latitude.nil? || @longitude.nil? || @id.nil?
      raise 'Nil values'
    end
    super
  end
end

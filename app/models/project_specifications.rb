class ProjectSpecifications
  include Virtus.model

  attribute :area, Float
  attribute :budget, Float
  attribute :bod, Float
  attribute :cod, Float
  attribute :ph, Float

  def self.dump(preferences)
    preferences.to_hash
  end

  def self.load(preferences)
    new(preferences)
  end
end

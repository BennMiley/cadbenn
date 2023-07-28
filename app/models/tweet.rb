class Tweet < ApplicationRecord
  belongs_to :user
  acts_as_votable

def self.ransackable_attributes(auth_object = nil)
    super + %w[content created_at]
  end

  def self.ransackable_associations(auth_object = nil)
    ['user']
end
end
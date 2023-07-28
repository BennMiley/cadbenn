class Tweet < ApplicationRecord
  belongs_to :user
  acts_as_votable


    def self.ransackable_associations(auth_object = nil)
    []
end
end
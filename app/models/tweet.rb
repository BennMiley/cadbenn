class Tweet < ApplicationRecord
  belongs_to :user
def self.ransackable_attributes(auth_object = nil)
    super + %w[content created_at]
end
end
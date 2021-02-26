class Reason < ApplicationRecord
  validates :content, presence: true
  belongs_to :estimate
  belongs_to :user
end

class Reason < ApplicationRecord
  belongs_to :estimate
  belongs_to :user
end

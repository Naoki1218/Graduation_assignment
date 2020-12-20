class CustomerEstimate < ApplicationRecord
  belongs_to :estimate
  belongs_to :customer
end

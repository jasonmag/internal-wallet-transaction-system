class Stock < ApplicationRecord
  has_one :wallet, as: :model, dependent: :destroy
end

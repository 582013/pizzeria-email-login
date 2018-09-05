class Pizza < ApplicationRecord
	has_many :order_items  # no need dependent: :destroy since pizza can be outdated, but order item still exists.
end

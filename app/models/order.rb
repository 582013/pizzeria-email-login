class Order < ApplicationRecord
	has_many :order_items, dependent: :destroy

  attr_accessor :list
  # validates_presence_of :name, :email
  # validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/
  validate :email
end

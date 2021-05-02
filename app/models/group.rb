class Group < ApplicationRecord
  validates :code, presence: true, uniqueness: { case_sensitive: false }
end

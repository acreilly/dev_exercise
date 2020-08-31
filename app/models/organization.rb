class Organization < ApplicationRecord
  validates :name, presence: true

  def self.search(query)
    if query
      Organization.where('name LIKE ?', "%#{query}%")
    else
      Organization.all
    end
  end
end

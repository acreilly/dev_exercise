class Organization < ApplicationRecord
  validates :name, presence: true
  has_many :memberships
  has_many :users, through: :memberships


  def self.search(query)
    organizations = if query
      Organization.where('name LIKE ?', "%#{query}%")
    else
      Organization.all
    end

    organizations.sort_by(&:name)
  end
end

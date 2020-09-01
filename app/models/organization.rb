class Organization < ApplicationRecord
  validates :name, presence: true
  has_many :memberships
  has_many :members, through: :memberships, source: :user


  def self.search(query)
    organizations = if query
      Organization.where('name LIKE ?', "%#{query}%")
    else
      Organization.all
    end

    organizations.sort_by(&:name)
  end
end

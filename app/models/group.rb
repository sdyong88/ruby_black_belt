class Group < ActiveRecord::Base
  belongs_to :user
  has_many :joins, dependent: :destroy
  has_many :users_joined, through: :joins, source: :user
  validates :name, presence: true, length: { in: 5..20}
  validates :description, presence: true,  length: { in: 10..100}
end

class Course < ApplicationRecord
  validates_presence_of :title
  validates :description, presence: true, length: { minimum: 5 }

  belongs_to :user

  def to_s
    title
  end

  has_rich_text :description
end

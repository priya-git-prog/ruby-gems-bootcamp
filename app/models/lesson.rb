class Lesson < ApplicationRecord
  extend FriendlyId
  include PublicActivity::Model

  friendly_id :title, use: :slugged
  tracked owner: Proc.new { |controller, model| controller.current_user }

  belongs_to :course

  has_rich_text :content

  validates_presence_of :title, :content, :course

  def to_s
    title
  end

end

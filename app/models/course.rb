class Course < ApplicationRecord
  extend FriendlyId
  include PublicActivity::Model

  tracked owner: Proc.new { |controller, model| controller.current_user }
  friendly_id :title, use: :slugged
  # friendly_id :generated_slug, use: :slugged

  belongs_to :user
  has_many :lessons, dependent: :destroy
  has_rich_text :description

  validates_presence_of :title, :short_description, :language, :level, :price
  validates :description, presence: true, length: { minimum: 5 }

  # When we have sensitive info like transactions (http://localhost:3000/courses/eb3c097c)
  # def generated_slug
  #   require 'securerandom'
  #   @random_slug ||= persisted? ? friendly_id : SecureRandom.hex(4)
  # end

  def to_s
    title
  end

  # def to_s
  #   slug
  # end

  LANGUAGES = [:"English", :"French", :"Hindi"]
  def self.languages
    LANGUAGES.map{ |language| [language, language] }
  end

  LEVELS = [:"Beginner", :"Intermediate", :"Advanced"]
  def self.levels
    LEVELS.map{ |level| [level, level] }
  end
end

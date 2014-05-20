class Question < ActiveRecord::Base
  before_save :capitalize_title

  validates :title, presence: {message: "must be there"}, uniqueness: true
  validates :description, presence: {message: "must be present"}

  default_scope order("title ASC")

  scope :recent, ->(x) { order("created_at DESC").limit(x) }
  scope :recent_ten, -> { order("create_at DESC").limit(10) }

  private

  def capitalize_title
    self.title.capitalize!
  end

end
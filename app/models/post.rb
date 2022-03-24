class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }

  validate :title_is_clickbait

  private

  def title_is_clickbait
    if title.include? %w(Won't Believe Secret Top Guess)
      errors.add(:title, "isn't clickbaity enough")
    end
  end


end

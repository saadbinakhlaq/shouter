class TextShout < ActiveRecord::Base
  validates :body, presence: true
  has_many :shouts, as: :content, dependent: :destroy

  def index
    body
  end
end

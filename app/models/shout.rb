class Shout < ActiveRecord::Base
  belongs_to :user

  default_scope { order('created_at DESC') }
  belongs_to :content, polymorphic: true
  validates_associated :content

  def self.text_shouts
    where(content_type: 'TextShout')
  end

  def self.search(term)
    text_shouts = TextShout.where('body LIKE ?', "%#{term}%").select('id')
    where(content_type: 'TextShout', content: text_shouts.map(&:id))
  end
end

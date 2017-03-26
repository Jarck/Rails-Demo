class Topic < ApplicationRecord
  include MarkdownBody
  include SoftDelete

  belongs_to :user, inverse_of: :topics
  belongs_to :node, inverse_of: :topics

  validates :user_id, :title, :body, presence: true

  before_create :init_last_active_mark_on_create
  def init_last_active_mark_on_create
    self.last_active_mark = Time.now.to_i
  end

end

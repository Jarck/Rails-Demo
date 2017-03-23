module MarkdownBody
  extend ActiveSupport::Concern
  include ActionView::Helpers::SanitizeHelper
  include ApplicationHelper

  included do
    before_save :markdown_body
    scope :without_body, -> { without(:body) }
  end

  private

  # TODO
  def markdown_body
    if self.body_changed?
      markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
      self.body_html = sanitize_markdown(markdown.render(body))
    end
  end
end

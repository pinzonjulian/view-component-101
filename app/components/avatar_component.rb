class AvatarComponent < ViewComponent::Base
  def initialize(url:, initials: nil)
    @url = url
    @initials = initials
  end

  private

  attr_accessor :url, :initials

  def avatar_content
    if url.present?
      helpers.image_tag(url, class: 'w-20')
    else
      initials
    end
  end
end

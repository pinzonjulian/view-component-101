class InvitationComponent < ViewComponent::Base

  STATE_MODIFIERS = {
    busy_that_day: 'bg-orange-600',
    too_far_away: 'bg-orange-600',
    pending: 'bg-orange-600',
    arriving_late: 'bg-black',
    dying_to_go: 'bg-black',
    prepared_to_go: 'bg-orange-900'
  }.freeze

  def initialize(invitation:)
    @invitation = invitation
    @user = invitation.user
    @avatar_url = @user.avatar_url
    @initials = @user.name.present? ? @user.name.initials : 'NN'
    @name = @user.name.present? ? @user.name : 'Anonymous user'
    @state = invitation.state
  end

  private

  attr_reader :invitation, :user, :avatar_url,
              :initials, :name, :state

  def avatar
    render AvatarComponent.new(url: avatar_url, initials: initials)
  end

  def state_modifier_class
    STATE_MODIFIERS[state.to_sym]
  end

  def transit_predictions
    invitation.transit_predictions.map do |mode, time|
      content_tag :div, class: 'flex flex-col items-center p-4' do
        concat content_tag(:span, nil, class: "fas fa-#{mode} text-yellow-800 text-lg mb-2")
        concat content_tag(:time, time, class: 'text-body text-orange-900 text-lg')
      end
    end.join('').html_safe
  end
end

json.extract! invitation, :id, :state, :comment, :user_id, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)

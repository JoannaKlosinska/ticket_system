module RequestSpecHelper

  def json
    JSON.parse(response.body)
  end

  def auth_token(user)
    JsonWebToken.encode({ user_id: user.id })
  end
end
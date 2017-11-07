module BlogsHelper
  def gravatar_helper(user) #this is ti use gravatar, the user need to crate one in gravatar
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}", width: 60
  end
end
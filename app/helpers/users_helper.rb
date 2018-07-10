module UsersHelper
  def gravatar_for(user, size: 80)
    email_digest = Digest::MD5.hexdigest(user.email)
    url = "https://www.gravatar.com/avatar/#{email_digest}?s=#{size}"
    image_tag(url, alt: user.name, class: "gravatar")
  end

end

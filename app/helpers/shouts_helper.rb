require 'digest/md5'

module ShoutsHelper
  def gravatar user
    digest = Digest::MD5::hexdigest(user.email)
    image_tag("http://gravatar.com/avatar/#{digest}?s=48")
  end
end
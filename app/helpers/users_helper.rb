# encoding: utf-8
module UsersHelper

  def avatar_url(user)
    return '' if user.nil?
    return '' if current_account && current_account.hide_avatar?
    options = {
      :class  => "avatar",
      :alt    => "",
      :width  => AvatarUploader::AVATAR_SIZE,
      :height => AvatarUploader::AVATAR_SIZE
    }
    if user.avatar.present?
      url = user.avatar.url
    else
      url = AvatarUploader::DEFAULT_AVATAR_URL
    end
    image_tag(url, options)
  end

  def homesite_link(user)
    return if user.homesite.blank?
    attrs = {}
    attrs[:rel] = "nofollow" unless user.account.try(:karma).to_i > 0
    link_to("page perso", user.homesite, attrs)
  end

  def jabber_link(user)
    return if user.jabber_id.blank?
    link_to("jabber id", "xmpp:" + user.jabber_id)
  end

end

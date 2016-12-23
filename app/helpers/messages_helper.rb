module MessagesHelper
  def recipients_options
    s = ''
    User.all.each do |user|
      s << "<option value='#{user.id}'>#{user.profile.firstname}</option>"
    end
    s.html_safe
  end
end

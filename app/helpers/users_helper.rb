module UsersHelper
  # Returns the Gravatar (http://gravatar.com/) for the given user.

  def fsex(user)
    var = ""
    if user.sex
      var = "мужской"
    else
      var = "женский"
    end
    return var
  end

end

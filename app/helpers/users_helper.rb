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

  def get_adress(user)
    str = ""
    unless(user.postcode.to_s.strip.empty?); str = str + user.postcode + ", "; end
    unless(user.city.to_s.strip.empty?); str = str + user.city + ", "; end
    unless(user.street.to_s.strip.empty?); str = str + user.street + ", "; end
    unless(user.house_number.to_s.strip.empty?); str = str + "дом " + user.house_number + ", "; end
    unless(user.pavilion_number.to_s.strip.empty?); str = str + "подъезд " + user.pavilion_number + ", "; end
    unless(user.apartment_number.to_s.strip.empty?); str = str + "квартира " + user.apartment_number; end

    return str

  end

end

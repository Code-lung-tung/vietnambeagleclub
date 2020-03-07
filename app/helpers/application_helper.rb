module ApplicationHelper
  def setting(type)
    return nil if SiteSetting.setting_types[type].nil?
    return strip_tags(SiteSetting.send(type).first&.value) \
      if %i[site_title fanpage facebook twitter youtube pinterest instagram google_plus].include?(type)
    return SiteSetting.send(type).first.banners if type == :banner
    return SiteSetting.send(type).first.services if type == :service
    SiteSetting.send(type).first&.value&.html_safe
  end

  def integer_to_roman(number)
    [nil, 'I', 'II', 'III', 'IV', 'V', 'VI', 'VII', 'VIII', 'IX', 'X'][number]
  end
end

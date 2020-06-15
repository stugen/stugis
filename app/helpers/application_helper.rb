module ApplicationHelper
  def t_help(model, attr)
    capture_haml do
      haml_concat t("activerecord.attributes.#{model.to_s}.#{attr.to_s}")
      if I18n.exists?("activerecord.attributes.#{model.to_s}.#{attr.to_s}_help")
        haml_tag(:small, class: 'text-muted') do
          haml_concat Regexp.new(/\A<p>(.*)<\/p>\Z/m).match(Kramdown::Document.new(t("activerecord.attributes.#{model.to_s}.#{attr.to_s}_help")).to_html)[1].html_safe
        end
      end
    end
  end
end

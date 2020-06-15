module StugenHelper
  def wbr_slash(text)
      raw text.gsub('/', '/<wbr>').gsub('&', '&<wbr>')
  end
  def sm_title(url)
    if url =~ /.*\.tumblr\.com.*/
      url.gsub(/(.*\/\/)?(.*)\.tumblr\.com.*/, '\2')
    else
      url = url + '/' unless url =~ /\/$/
      url.gsub(/.*\/(.*)\/.*$/, '\1')
    end
  end
  def sm_entry(stuga, attr)
    capture_haml do
      url = stuga.try(attr)
      unless url.blank?
        title = sm_title url
        label = t("activerecord.attributes.stuga.#{attr}")
        haml_tag(:a, href: url, :title => "#{label}: #{title}") do
          haml_tag(:i, class: "fa fa-#{attr}") do
            haml_tag(:span) do
              succeed ': ' do
                haml_concat label
              end
            end
          end
          haml_tag(:span) do
            haml_concat title
          end
        end
      end
    end
  end
end

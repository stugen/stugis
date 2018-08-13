module StugenHelper
  def wbr_slash(text)
      raw text.gsub('/', '/<wbr>').gsub('&', '&<wbr>')
  end
  def sm_title(url)
      url.gsub(/.*\/(.*)\/.*$/, '\1')
  end
end

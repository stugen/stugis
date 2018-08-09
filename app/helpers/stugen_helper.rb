module StugenHelper
  def wbr_slash(text)
      raw text.gsub('/', '/<wbr>').gsub('&', '&<wbr>')
  end
end

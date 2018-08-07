module StugenHelper
  def wbr_slash(text)
    raw text.gsub '/', '/<wbr>'
  end
end

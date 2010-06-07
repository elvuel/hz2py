require File.join(File.dirname(__FILE__), '/elvuel/hz2py')
require File.join(File.dirname(__FILE__), '/elvuel/traditional_and_simplified')

include Elvuel

class String
  def to_pinyin
    Hz2Py.do(self)
  end

end
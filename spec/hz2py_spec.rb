# -*- encoding: utf-8 -*-
require 'spec_helper'

describe "Simplified Chinese(简体中文) characters into Chinese pinyin." do
  
  it "empty string or nil--空字符或nil" do
    Hz2py.do("").should == ""
    Hz2py.do(nil).should == ""
  end
  
  it "abcdefghijkl" do
    Hz2py.do("abcdefghijkl").should == "abcdefghijkl"
  end
  
  it "all Chinese characters--全中文字符串" do
    Hz2py.do("你好").should == "ni hao"
    Hz2py.do("黑空寻光").should == "hei kong xun guang"
    Hz2py.do("无赫赫之功").should == "wu he he zhi gong"
  end
  
  it "with 'mars*_*lang'--带'火星文'的中文字符串" do
    Hz2py.do("你好有火☆魰。").should == "ni hao you huo UNKNOWN UNKNOWN ."
    Hz2py.do("吙☆魰倌網攺坂溂").should == "UNKNOWN UNKNOWN UNKNOWN guan UNKNOWN UNKNOWN ban UNKNOWN"
    Hz2py.do("認識されない").should == "UNKNOWN UNKNOWN UNKNOWN UNKNOWN UNKNOWN UNKNOWN"
  end
  
  it "with SBC case symbol--带全角符号的中文字符串" do
    Hz2py.do("你好，火星没事！ＭＥＩ ＳＨＩ～．").should == "ni hao , huo xing mei shi !MEI SHI~."
  end
  
  it "mix--中英文混合" do
    Hz2py.do("Hello,中国China.").should == "Hello, zhong guo China."
    Hz2py.do("黑e空l寻v光u潜e伏l,popup!").should == "hei e kong l xun v guang u qian e fu l,popup!"
    Hz2py.do("Both Chinese And English,中英文双语小说,中英文对照文章,提供在线中英文双语小说、中英文双语床头灯系列、中英对照电子书、中英文双语对照新闻、中英文双语对照散文...").should == "Both Chinese And English, zhong ying wen shuang yu xiao shuo , zhong ying wen dui zhao wen zhang , ti gong zai xian zhong ying wen shuang yu xiao shuo , zhong ying wen shuang yu chuang tou deng xi lie , zhong ying dui zhao dian zi shu , zhong ying wen shuang yu dui zhao xin wen , zhong ying wen shuang yu dui zhao san wen ..."
  end
  
  it "mix all" do
    Hz2py.do("釹ｋelv魜瀦汉字,English有意义瀦綉＄").should == "UNKNOWN kelv UNKNOWN UNKNOWN han zi ,English you yi yi UNKNOWN UNKNOWN $"
  end

  it "with specify delimiter" do
    Hz2py.do("你好", :join_with => '-').should == "ni-hao"
    Hz2py.do("你好").should == "ni hao"
    Hz2py.do("黑空寻光", :join_with => '|').should == "hei|kong|xun|guang"
  end

  it "with Chinese Traditional to Simplified" do
    Hz2py.do("你好愛", :join_with => '-', :to_simplified => true).should == "ni-hao-ai"
    Hz2py.do("擔你檳好", :join_with => ' ', :to_simplified => true).should == "dan ni bing hao"
  end
  
end
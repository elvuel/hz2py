# -*- encoding: utf-8 -*-
require 'spec_helper'

describe "traditional and simplified conversion" do
  it "traditional to simplified" do
    TraditionalAndSimplified.conv_t2s("2010高考作文題公佈 北京作文：仰望星空與腳踏實地").should == "2010高考作文题公佈 北京作文：仰望星空与脚踏实地"
    TraditionalAndSimplified.conv_t2s("南京警方突襲高檔娛樂場所 端掉“最安全”夜總會--鳳凰網").should == "南京警方突袭高档娱乐场所 端掉“最安全”夜总会--凤凰网"
  end
  
  it "simplified to traditional" do
    TraditionalAndSimplified.conv_s2t("著名作家冰心老人说：“周恩来总理是十亿中国人民心目中的第一位完人。”").should == "著名作家冰心老人說：“周恩來總理是十億中國人民心目中的第一位完人。”"
    TraditionalAndSimplified.conv_s2t("黑空寻光").should == "黑空尋光"
  end
  
  it "veri..." do
    simp = TraditionalAndSimplified.conv_t2s("無心插柳柳成陰")
    simp.should == "无心插柳柳成阴"
    TraditionalAndSimplified.conv_s2t(simp).should == "無心插柳柳成陰"
  end
end
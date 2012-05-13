# encoding:utf-8

class Contact < ActiveRecord::Base
  attr_accessible :email, :first_name, :group_id, :last_name, :mobile_phone, :phone

  module Group
    WEIFENZU = 0 # 未分组
    FAMILY = 1 # 家庭
    FRIEND = 2 # 朋友
    WORKER=3 # 同事
  end

  def group_type
    s = case self.group_id.to_s
    when /#{Group::WEIFENZU}/ then "未分组"
    when /#{Group::FAMILY}/ then "家庭"
    when /#{Group::FRIEND}/ then "朋友"
    when /#{Group::WORKER}/ then "同事"
    end
    s
  end
end

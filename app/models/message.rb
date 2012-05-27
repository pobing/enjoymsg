# encoding:utf-8
class Message < ActiveRecord::Base
  attr_accessible :content, :from_id, :message_type, :send_id, :send_time
  
    # module Type
    # WEIFENZU = 0 # 未分组
    # FAMILY = 1 # 家庭
    # FRIEND = 2 # 朋友
    # WORKER=3 # 同事
  # end
  
  module Type
    DUANXIN = 0 # 短信
    CAIXIN = 1 # 彩信
  end
  
  def msg_type
    s = case self.message_type.to_s
    when /#{Type::DUANXIN}/ then "短信"
    when /#{Type::CAIXIN}/ then "彩信"
    end
    s
  end
  
  def send_time_formats
    self.send_time.to_formatted_s(:db) 
  end
  
  def little_content
  end
  
  def sender
  self.from_id.nil? ? "未知" : "jdd"
  end
  
end

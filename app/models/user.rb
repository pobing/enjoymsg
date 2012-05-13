class User < ActiveRecord::Base
  attr_accessible :company, :email, :group_id, :job_title, :name, :phone
end

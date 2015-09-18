class User < ActiveRecord::Base
  serialize :used_editing_apps, Array
  has_many :pictures
end

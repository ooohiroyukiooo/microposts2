class Frelationship < ActiveRecord::Base
  belongs_to :fmicropost, class_name: "Micropost"
  belongs_to :fuser, class_name: "User"
end

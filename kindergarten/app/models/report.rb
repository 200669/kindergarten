class Report < ActiveRecord::Base
  belongs_to :child
  belongs_to :user
end

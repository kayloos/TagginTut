class Image < ActiveRecord::Base
  acts_as_taggable_on :pets
end

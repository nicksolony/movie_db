class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.recently_added
        all.last(3).reverse
  end
  
end

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.recently_added
        last(3).reverse.uniq
  end

  def person_find_by(attributes)
      if person = Person.find_by(attributes)
        else person = Person.where(dob: nil).find_by(name: attributes[:name])
      end
  end
  
end

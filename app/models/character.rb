class Character < ApplicationRecord
  belongs_to :movie
  belongs_to :actor, class_name:"Person"
  validates :actor_id, uniqueness: { scope: [:movie_id,:name]}
  accepts_nested_attributes_for :actor

  def actor_attributes=(actor_attribute)
    if actor_attribute[:name].present?
      if person=person_find_by(actor_attribute)
        self.actor=person
      else
       self.build_actor(actor_attribute)
      end
    end
  end

end

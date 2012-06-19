class Road
  include Mongoid::Document
  field :name, :type => String
  field :direction, :type => String
  field :from, :type => String
  field :to, :type => String
  
  embeds_many :pois
end

class Poi
  include Mongoid::Document
  field :ref, :type => String
  field :ref_type, :type => String
  field :X, :type => String
  field :Y, :type => String

  embedded_in :road
end

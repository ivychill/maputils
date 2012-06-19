#encoding: utf-8
require 'spec_helper'

describe Road do
  before(:each) do
    @attr = { 
      :name => "上川路",
      :direction => "东西",
      :from => "115.11, 23.22",
      :to => "115.13,23.26"
    }
    
    @poi_attr = { 
      :ref => "新安三路",
      :ref_type => "路口",
      :X => "115.11",
      :Y => "23.26"
    }
  end
  it "should create a new instance given a valid attribute" do
    road = Road.create!(@attr)
  end
  it "should create a new instance with one poi" do
    road = Road.create!(@attr)
    road.pois.create!(@poi_attr)
  end
end

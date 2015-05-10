class Order < ActiveRecord::Base

  has_and_belongs_to_many :menu_items
  belongs_to :user

  after_create :convert_pickup_time

  validates_presence_of :user

  #validates :pickup_time, on_or_after: lambda { Date.current }
  #PATCHING with validator from 'date_validator' with a quick fix for validation message

  validates :pickup_time, date: { after: Proc.new { Time.now }, message: '%{value} didn\'t pass validation'}

  def convert_pickup_time
    self.pickup_time.to_time
    self.save!
  end
end

class Product < ActiveRecord::Base
	has_many :line_items
	has_many :comments, :dependent => :destroy

  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent
  validates_uniqueness_of :title
  validates_length_of :title, :minimum => 2,
                      :message => 'too short, should be 2 letters or more =)'

  has_attached_file :photo, :styles => { :thumb=> "100x100#", :small  => "150x150>" }

  validates_attachment_presence :photo
  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

protected
  def price_must_be_at_least_a_cent
    errors.add(:price, 'should be at least 0.01') if price.nil? ||
    price < 0.01
  end

  def self.find_products_for_sale
    find(:all, :order => "title")
  end
end

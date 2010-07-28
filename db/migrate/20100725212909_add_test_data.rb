class AddTestData < ActiveRecord::Migration
  def self.up
    Product.delete_all
    Product.create(:title => 'Pistol',
    :description =>
      %{<p>
      This is a very good pistol for those who only studying how to kill.
      just try it out.
      </p>},
    :image_url => 'C:\pics\foto_34182.jpg',
    :price => 200.50)

    Product.create(:title => 'Something',
    :description =>
      %{<p>
      I don't know what it is. Maybe u should buy it and than write me.
      </p>},
    :image_url => 'C:\pics\foto_29964.jpg',
    :price => 99.99)
    # . . .
  end

  def self.down
    Product.delete_all
  end
end

class CreateShowcaseHomes < ActiveRecord::Migration

  def self.up
    create_table :showcase_homes do |t|
      t.string :address
      t.text :custom_teaser
      t.text :description
      t.integer :price
      t.date :sale_date
      t.text :specifics
      t.integer :position

      t.timestamps
    end

    add_index :showcase_homes, :id
    
    create_table :image_showcase_homes, :id => false do |t|
      t.integer :image_id
      t.integer :showcase_home_id
      t.integer :position
      t.string :category
      t.string :caption
    end

    add_index :image_showcase_homes, :image_id
    add_index :image_showcase_homes, :showcase_home_id
    

    load(Rails.root.join('db', 'seeds', 'showcase_homes.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "showcase_homes"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/showcase_homes"})
    end

    drop_table :showcase_homes
  end

end

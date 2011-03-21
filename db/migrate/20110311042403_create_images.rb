class CreateImages < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :filename

      t.timestamps
    end
    %w[1 2 3 4].each {|filename| Image.new(:filename => filename).save and puts "Image #{filename} added"}
  end

  def self.down
    drop_table :images
  end
end

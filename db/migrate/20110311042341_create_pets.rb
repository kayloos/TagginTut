class CreatePets < ActiveRecord::Migration
  def self.up
    create_table :pets do |t|
      t.string :name

      t.timestamps
    end

    %w[Skittles Puba Mongoloid Pooface Charles Bumper Diamond Dove Everything Flower Frixie Frou-frou Gold Golden Goldie Goobers Gorgeous Handsome Hero]
    .each {|name| Pet.new(:name => name).save and puts "#{name} added"}
  end

  def self.down
    drop_table :pets
  end
end

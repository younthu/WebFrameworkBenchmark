class CreateTimeProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :time_providers do |t|
      t.string :stamp
      t.string :short_string

      t.timestamps
    end
  end
end

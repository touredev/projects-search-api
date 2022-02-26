class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name, null: false
      t.text :description
      t.text :tech_stack, array: true, default: []
      t.string :link
      t.string :version, limit: 25, default: '1.0.0'

      t.timestamps
    end
  end
end

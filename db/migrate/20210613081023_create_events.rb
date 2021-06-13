class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|

      t.string :title
      t.text :description
      t.datetime :date
      t.string :place
      t.boolean :can_comment, default: true
      t.boolean :is_quick_event, default: false
      t.integer :host_id

      t.timestamps
    end
  end
end
class CreateGrades < ActiveRecord::Migration[5.2]
  def change
    create_table :grades do |t|
      t.string :code
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end

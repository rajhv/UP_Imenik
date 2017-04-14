class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table "departments", force: :cascade do |t|
      t.integer "member_id"
      t.string   "name"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end

    add_index :departments, :member_id
  end
end

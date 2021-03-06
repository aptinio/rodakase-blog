ROM::SQL.migration do
  change do
    create_table :posts do
      primary_key :id
      foreign_key :user_id, :users, null: false, on_delete: :cascade
      column :title, String, null: false
      column :body, String, null: false
    end
  end
end

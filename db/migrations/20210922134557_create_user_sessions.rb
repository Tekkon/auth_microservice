Sequel.migration do
  change do
    create_table(:user_sessions) do
      primary_key :id, type: :Bignum
      foreign_key :user_id, :users

      Uuid :uuid, null: false
      Bignum :user_id, null: false

      index [:uuid], name: :index_user_sessions_on_uuid
      index [:user_id], name: :index_user_sessions_on_user_id
    end
  end
end

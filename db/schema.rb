Sequel.migration do
  change do
    create_table(:ar_internal_metadata) do
      String :key, null: false
      String :value
      DateTime :created_at, size: 6, null: false
      DateTime :updated_at, size: 6, null: false

      primary_key [:key]
    end

    create_table(:schema_migrations) do
      String :version, null: false

      primary_key [:version]
    end

    create_table(:users) do
      primary_key :id, type: :Bignum

      String :name, null: false
      String :email, null: false
      String :password_digest, null: false
      DateTime :created_at, size: 6, null: false
      DateTime :updated_at, size: 6, null: false

      index [:email], name: :index_users_on_email, unique: true
    end

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

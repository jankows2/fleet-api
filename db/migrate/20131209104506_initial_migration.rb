class InitialMigration < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :phone_no
      t.string :password
      t.string :salt
      t.boolean :admin

      t.timestamps
    end

    create_table :groups do |t|
      t.string :name

      t.timestamps
    end

    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :registration

      t.timestamps
    end

    create_table :group_user_joins do |t|
      t.integer :group_id
      t.integer :user_id

      t.timestamps
    end

    create_table :group_car_joins do |t|
      t.integer :group_id
      t.integer :car_id

      t.timestamps
    end

    create_table :user_car_joins do |t|
      t.integer :user_id
      t.integer :car_id

      t.timestamps
    end
  end
end

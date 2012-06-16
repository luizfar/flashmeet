class CreateMeetups < ActiveRecord::Migration
  def up
    create_table 'meetups' do |t|
      t.column :location, :string
      t.column :active, :boolean
      t.column :category_id, :integer
      t.datetime :created_at, :null => false
      t.datetime :updated_at, :null => false
    end

    create_table 'meetups_users', :id => false do |t|
      t.column :user_id, :integer
      t.column :meetup_id, :integer
    end
  end

  def down
    drop_table :meetups
    drop_table :users_meetups
  end
end

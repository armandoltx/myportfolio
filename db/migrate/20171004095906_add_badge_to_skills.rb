class AddBadgeToSkills < ActiveRecord::Migration[5.1]
  def change
    add_column :skills, :bdge, :text
  end
end

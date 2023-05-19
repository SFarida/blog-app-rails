class FixColumnName < ActiveRecord::Migration[7.0]
  def change
    change_table :posts do |t|
      t.rename :user_id, :author_id
    end
  end
end

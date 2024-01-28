class ChangeAccountRefInUsers < ActiveRecord::Migration[7.1]
  def change
    remove_reference :users, :account
    add_reference :users, :account, foreign_key: true, type: :uuid
  end
end

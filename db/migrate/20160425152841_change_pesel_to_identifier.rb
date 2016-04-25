class ChangePeselToIdentifier < ActiveRecord::Migration
  def change
    rename_column 'users', 'pesel', 'identifier'
    rename_column 'workers', 'pesel', 'identifier'
  end
end

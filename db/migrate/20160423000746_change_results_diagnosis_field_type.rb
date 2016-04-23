class ChangeResultsDiagnosisFieldType < ActiveRecord::Migration
  def up
    change_column 'results', 'diagnosis', 'text'
  end

  def down
    change_column 'results', 'diagnosis', 'string'
  end
end

class AddSearchVectorToTexts < ActiveRecord::Migration
  def change
    add_column :texts, :text_idx, 'tsvector'

    execute <<-SQL
      CREATE INDEX text_idx ON texts USING gin(to_tsvector('simple', body));
    SQL

    execute <<-SQL
      CREATE TRIGGER tsvectorupdate BEFORE INSERT OR UPDATE
      ON texts FOR EACH ROW EXECUTE PROCEDURE
      tsvector_update_trigger(text_idx, 'pg_catalog.simple', body);
    SQL
  end
end

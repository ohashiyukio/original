class ChangeBirthdayAndFamilyDayInPets < ActiveRecord::Migration[7.0]
  def up
    # 一時カラムを作成してデータを移行する
    add_column :pets, :birthday_tmp, :date
    add_column :pets, :family_day_tmp, :date

    # 既存のデータを日付型に変換して一時カラムにコピー
    execute <<-SQL
      UPDATE pets
      SET birthday_tmp = CASE
        WHEN birthday_id ~ '^\d{4}-\d{2}-\d{2}$' THEN birthday_id::date
        ELSE NULL
      END,
      family_day_tmp = CASE
        WHEN family_day_id ~ '^\d{4}-\d{2}-\d{2}$' THEN family_day_id::date
        ELSE NULL
      END;
    SQL

    # 元のカラムを削除
    remove_column :pets, :birthday_id
    remove_column :pets, :family_day_id

    # 一時カラムをリネームして新しいカラムにする
    rename_column :pets, :birthday_tmp, :birthday_id
    rename_column :pets, :family_day_tmp, :family_day_id
  end

  def down
    # 元のカラムに戻す手順
    add_column :pets, :birthday_tmp, :string
    add_column :pets, :family_day_tmp, :string

    execute <<-SQL
      UPDATE pets
      SET birthday_tmp = birthday_id::text,
          family_day_tmp = family_day_id::text;
    SQL

    remove_column :pets, :birthday_id
    remove_column :pets, :family_day_id

    rename_column :pets, :birthday_tmp, :birthday_id
    rename_column :pets, :family_day_tmp, :family_day_id
  end
end

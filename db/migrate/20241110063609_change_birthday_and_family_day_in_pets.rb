class ChangeBirthdayAndFamilyDayInPets < ActiveRecord::Migration[7.0]
  def change
    change_column :pets, :birthday_id, :date
    change_column :pets, :family_day_id, :date
  end
end

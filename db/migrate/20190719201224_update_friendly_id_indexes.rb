MIGRATION_CLASS =
  if ActiveRecord::VERSION::MAJOR >= 5
    ActiveRecord::Migration["#{ActiveRecord::VERSION::MAJOR}.#{ActiveRecord::VERSION::MINOR}"]
  else
    ActiveRecord::Migration
  end

class UpdateFriendlyIdIndexes < MIGRATION_CLASS
  def change
    remove_index :friendly_id_slugs, :sluggable_id
    remove_index :friendly_id_slugs, [:slug, :sluggable_type]
    remove_index :friendly_id_slugs, [:slug, :sluggable_type, :scope]
    remove_index :friendly_id_slugs, :sluggable_type

    add_index :friendly_id_slugs, [:sluggable_type, :sluggable_id]
    add_index :friendly_id_slugs, [:slug, :sluggable_type], length: { slug: 140, sluggable_type: 50 }
    add_index :friendly_id_slugs, [:slug, :sluggable_type, :scope], length: { slug: 70, sluggable_type: 50, scope: 70 }, unique: true
  end
end

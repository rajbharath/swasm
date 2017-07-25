class EnableExtensionHstore < ActiveRecord::Migration[5.1]
  def up
    enable_extension 'hstore' unless extension_enabled?('hstore')
  end

  def down
    disable_extension "hstore" if extension_enabled?('hstore')
  end
end

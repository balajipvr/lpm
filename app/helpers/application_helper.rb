module ApplicationHelper


  def javascript_exists?(script)
    extensions = [".erb", ""]
    extensions.inject(false) do |truth, extension|
      truth || asset_exists?('javascripts', "#{script}.js#{extension}")
    end
  end


  def asset_exists?(subdirectory, filename)
    File.exists?(File.join(Rails.root, 'app', 'assets', subdirectory, filename))
  end

  def stylesheet_exists?(stylesheet)
    extensions = %w(.scss .erb .scss.erb) + [""]
    extensions.inject(false) do |truth, extension|
      truth || asset_exists?('stylesheets', "#{stylesheet}.css#{extension}")
    end
  end


end

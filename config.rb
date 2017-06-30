set :source, "source"
set :css_dir, "stylesheets"
set :js_dir, "javascripts"
set :images_dir, "images"
set :fonts_dir,  "fonts"
sprockets.append_path File.join "#{root}", "vendor/bower_components"
ignore "partials/*"
ignore "snippets/*"

page "/custom_pages/landing.*", layout: "landing"
page "/custom_pages/polygons.*", layout: "polygons"
set :index_file, "/custom_pages/landing.html"

configure :development do
  activate :livereload, { host: "127.0.0.1" }
  activate :bootstrap_navbar
end

activate :blog do |blog|
  blog.layout    = "blog-post"
  blog.prefix    = "blog"
  blog.permalink = "/{title}.html"
end


configure :build do
  set :debug_assets, true
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash, :ignore => ["bower_components"]
  activate :bootstrap_navbar
end

Spree::AppConfiguration.class_eval do
  preference :blog_alias, :string, default: 'blog'
end
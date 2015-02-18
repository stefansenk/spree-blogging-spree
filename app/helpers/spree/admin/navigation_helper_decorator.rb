Spree::Admin::NavigationHelper.class_eval do
  def link_to_blog_in_store(resource, options={})
    url = options[:url] || blog_entry_permalink(resource)
    name = options[:name] || Spree.t('admin.view_in_store')
    #options[:data] = {:action => 'show'}
    options[:class] = "btn btn-primary btn-sm"
    link_to_with_icon('eye-open', name, url, options)
  end
end
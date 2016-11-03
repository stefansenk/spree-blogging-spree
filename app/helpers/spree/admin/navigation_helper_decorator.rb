Spree::Admin::NavigationHelper.class_eval do
  def link_to_blog_in_store(resource, options={})
    url = options[:url] || blog_entry_permalink(resource)
    #options[:data] = {:action => 'show'}
    link_to(Spree.t(:view_in_store), url, options)
  end
end

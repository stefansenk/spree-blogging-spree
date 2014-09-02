Deface::Override.new(:virtual_path => "spree/admin/shared/_menu",
                     :name => "blog_admin_tabs",
                     :insert_bottom => "[data-hook='admin_tabs'], #admin_tabs[data-hook]",
                     :text => "<%= tab(:blog_entries, :label => 'Blog', :url => spree.admin_blog_entries_path, :icon => 'file') if can? :manage, Spree::BlogEntry %>",
                     :disabled => false)

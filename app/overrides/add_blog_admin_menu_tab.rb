Deface::Override.new(:virtual_path => "spree/layouts/admin",
                     :name => "blog_admin_tabs",
                     :insert_bottom => "#main-sidebar",
                     :text => "<% if can? :admin, Spree::BlogEntry %><ul class=\"nav nav-sidebar\"><%= tab *[:blog_entries], icon: 'tags'  %></ul><% end %>",
                     :disabled => false)
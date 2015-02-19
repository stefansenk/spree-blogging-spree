Deface::Override.new(:virtual_path => "spree/admin/users/_form",
                     :name => "admin_author_info_fields",
                     :insert_after => "[data-hook='admin_user_form_fields']",
                     :partial => "spree/admin/users/author_info_fields",
                     :disabled => false)
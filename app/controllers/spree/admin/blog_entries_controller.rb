class Spree::Admin::BlogEntriesController < Spree::Admin::ResourceController
  helper 'spree/blog_entries'


  private

    def location_after_save
      edit_admin_blog_entry_url(@blog_entry)
    end

    def collection
      page = params[:page].to_i > 0 ? params[:page].to_i : 1
      per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 20
      model_class.page(page).per(per_page)
    end

end

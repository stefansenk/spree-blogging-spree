module Spree
  module BlogEntriesHelper
    def post_link_list
     link = Struct.new(:name,:url)
     BlogEntry.recent.collect { |post| link.new( post.title, blog_entry_permalink(post)) }
    end

    def blog_entry_permalink(e)
      unless e.published_at.nil?
        blog_entry_permalink_path :year => e.published_at.strftime("%Y"), :month => e.published_at.strftime("%m"), :day => e.published_at.strftime("%d"), :slug => e.permalink
      else
        blog_entry_permalink_path :year => "na", :month => "na", :day => "na", :slug => e.permalink
      end
    end

    def blog_entry_url_permalink(e)
      unless e.published_at.nil?
         blog_entry_permalink_url :year => e.published_at.strftime("%Y"), :month => e.published_at.strftime("%m"), :day => e.published_at.strftime("%d"), :slug => e.permalink
       else
        blog_entry_permalink_url :year => "na", :month => "na", :day => "na", :slug => e.permalink
      end
    end

    def blog_full_article_html(blog_entry)
      "<br><br>Read the full article #{link_to blog_entry.title, blog_entry_url_permalink(blog_entry)} at #{link_to "#{Spree::Store.current.name} Blog", blog_url}."
    end

    def blog_first_appeared_html(blog_entry)
      "<br><br>The article #{link_to blog_entry.title, blog_entry_url_permalink(blog_entry)} first appeared on #{link_to "#{Spree::Store.current.name} Blog", blog_url}."
    end

    def blog_entry_tag_list_html blog_entry
      blog_entry.tag_list.map {|tag| link_to tag, blog_tag_path(tag) }.join(", ").html_safe
    end

    def blog_entry_category_list_html blog_entry
      blog_entry.category_list.map {|category| link_to category, blog_category_path(category) }.join(", ").html_safe
    end

    def tag_cloud(tags, classes)
      return [] if tags.blank?
      max_count = tags.sort_by(&:count).last.count.to_f
      tags.each do |tag|
        index = ((tag.count / max_count) * (classes.size - 1))
        yield tag, classes[index.nan? ? 0 : index.round]
      end
    end
  end
end

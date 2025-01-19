module Components::PaginationHelper
  def render_pagination(pagination)
    content_tag(:nav, class: "flex justify-center mt-4 space-x-2") do
      # Preserve current URL parameters
      current_params = params.to_unsafe_h.except(:page)

      # Previous Page Button
      concat(
        render_button("Previous", variant: :secondary, disabled: pagination[:prev_page].nil?,
                      as: :link, href: pagination[:prev_page] ? url_for(current_params.merge(page: pagination[:prev_page])) : "#") do
          concat(fa_icon("angle-double-left ", class: "mt-1 mr-1"))
          concat(content_tag(:span, "Previous"))
        end
      )

      # Page Links
      pagination[:pages_to_display].each do |page|
        if page == :ellipsis
          concat(content_tag(:span, "...", class: "px-3 py-2 text-muted-foreground"))
        else
          concat(
            render_button(page, variant: page == pagination[:current_page] ? :default : :outline,
                          as: :link, href: url_for(current_params.merge(page: page)))
          )
        end
      end

      # Next Page Button
      concat(
        render_button("Next", variant: :secondary, disabled: pagination[:next_page].nil?,
                      as: :link, href: pagination[:next_page] ? url_for(current_params.merge(page: pagination[:next_page])) : "#") do
          concat(content_tag(:span, "Next"))
          concat(fa_icon("angle-double-right ", class: "mt-1 ml-1"))
        end
      )
    end
  end

  def pagination_with_ellipsis(current_page, total_pages)
    window = 2 # Number of pages to show around the current page
    pages = []

    # Always show the first page
    pages << 1 if current_page > 1

    # Add ellipsis if there's a gap between the first page and the current window
    pages << :ellipsis if current_page > window + 2

    # Add the window of pages around the current page
    ((current_page - window)..(current_page + window)).each do |page|
      pages << page if page > 1 && page < total_pages
    end

    # Add ellipsis if there's a gap between the current window and the last page
    pages << :ellipsis if current_page < total_pages - window - 1

    # Always show the last page
    pages << total_pages if total_pages > 1 && current_page != total_pages

    pages
  end
end

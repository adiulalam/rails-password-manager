module Components::CardHelper
  def render_card(title: nil, subtitle: nil, body: nil, footer: nil, link: nil, icon_link: nil, **options, &block)
    title_content = link.present? ? link_to(title, link, class: "hover:underline hover:text-primary/80") : title

    render "components/ui/card",
                   title: title_content,
                   subtitle: subtitle,
                   footer: footer,
                   icon_link: icon_link,
                   body: (block ? capture(&block) : body),
                   block:,
                   options: options
  end
end

module Components::TypographyHelper
  def render_typography(tag:, content: nil, **options, &block)
    # Define the default classes for each tag
    styles = {
      h1: "scroll-m-20 text-4xl font-extrabold tracking-tight lg:text-5xl",
      h2: "scroll-m-20 text-3xl font-semibold tracking-tight transition-colors first:mt-0",
      h3: "scroll-m-20 text-2xl font-semibold tracking-tight",
      p: "leading-7"
    }

    # Fetch the default class for the given tag
    default_classes = styles[tag.to_sym]
    raise ArgumentError, "Unsupported tag: #{tag}" unless default_classes

    # Merge the default classes with any custom classes passed via options
    classes = [ default_classes, options[:class] ].compact.join(" ")

    # Use content or the block provided
    content ||= capture(&block) if block_given?

    # Render the tag with the appropriate content and classes
    content_tag(tag, content, **options.except(:class).merge(class: classes))
  end
end

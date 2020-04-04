module ApplicationHelper
  def displayed_svg(file_name, options={})
    file = File.read(Rails.root.join('app', 'frontend', 'images', file_name))
    doc = Nokogiri::HTML::DocumentFragment.parse file
    svg = doc.at_css 'svg'
    if options[:class].present?
      svg['class'] = options[:class]
    end
    doc.to_html.html_safe
  end
end

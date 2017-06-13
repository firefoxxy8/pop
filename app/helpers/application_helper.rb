module ApplicationHelper
	def markdown(text)

		if @@markdown.nil?
			options = {
				filter_html:     true,
				hard_wrap:       true,
				link_attributes: { rel: 'nofollow', target: "_blank" },
				space_after_headers: true,
				fenced_code_blocks: true
			}

			extensions = {
				autolink:           true,
				superscript:        true,
				disable_indented_code_blocks: true
			}

			renderer = Redcarpet::Render::HTML.new(options)
			@@markdown = Redcarpet::Markdown.new(renderer, extensions)

		end

		@@markdown.render(text).html_safe
	end

	@@markdown = nil
end

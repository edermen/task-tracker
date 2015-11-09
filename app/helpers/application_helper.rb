module ApplicationHelper

  # Page title
	def full_title(page_title)
		if page_title.empty?
      "Task tracker"
		else
			page_title
		end
	end

  # collection_select
  def collection_to_model(object, method, collection, value_method, text_method, options = {}, html_options = {})

    collection_select(:"#{object}", :"#{method}", "#{collection}".all, "#{value_method}", :"#{text_method}", { include_blank: true, prompt: "#{options}" }, {class: 'form-control'})
  collection.all.map
  end

	# Simple form no labels
	require "minimal_form_builder"
		def minimal_form_for(object, *args, &block)
			options = args.extract_options!
			simple_form_for(object, *(args << options.merge(:builder => MinimalFormBuilder)), &block)
		end

		def minimal_fields_for(*args, &block)
			options = args.extract_options!
			simple_fields_for(*(args << options.merge(:builder => MinimalFormBuilder)), &block)
		end

end

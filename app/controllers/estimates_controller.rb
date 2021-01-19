class EstimatesController < ApplicationController
		before_action :logged_in_user
		def index

    end

		def show
      respond_to do |format|
        format.html
        format.pdf do
          render pdf: '見積書',
            layout: 'pdf.html',
            encording: 'UTF-8',
            template: 'estimates/show.html.erb'
        end
      end
    end

end

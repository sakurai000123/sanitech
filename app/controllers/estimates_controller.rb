class EstimatesController < ApplicationController
    def index
        
    end

    def test_pdf
		  respond_to do |format|
		    format.html
		    format.pdf do
		      render pdf: '見積書',
		             layout: 'pdf',
		             encording: 'UTF-8',
		             template: 'estimates/test_pdf.html.erb'
		    end
		  end
    end
    
end

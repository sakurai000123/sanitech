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

    # PDF
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

    # チャート
    def test_chart
      @charts = { "A社" => 80000, "B社" => 50000, "C社" => 55000, "D社" => 10000, "E社" => 54000, "F社" => 30000 }
    end

end

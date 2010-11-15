class LineChartController < ApplicationController
  def basic
    chart_data = [{
			name: 'Tokyo',
			data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		}, {
			name: 'New York',
			data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
		}, {
			name: 'Berlin',
			data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
		}, {
			name: 'London',
			data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
		}]
		
		tooltip_formatter = '
      function() {return "<b>"+ this.series.name +"</b><br/>"+this.x +":"+ this.y +"\u00B0C";}'
      
    @chart = Highchart.line({
      :chart => {
				:renderTo => "container",		
				:marginRight =>  130,
				:marginBottom => 25
			},
			:title => {
				:text => "Monthly Average Temperature",
				:x => -20 
			},
			:subtitle => {
				:text => 'Source: WorldClimate.com',
				:x => -20
			},
			:x_axis => {
				:categories => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
					'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			},
			:y_axis => {
				:title => {
					:text => "Temperature (\u00B0C)"
				},
			  :plotLines => [{
					:value => 0,
					:width => 1,
					:color => '#808080'
				}]
			},
			:tooltip => {
				:formatter => tooltip_formatter
			},
			:legend => {
				:layout=> 'vertical',
				:align=> 'right',
				:verticalAlign=> 'top',
				:x=> -10,
				:y=> 100,
				:borderWidth=> 0
			},
			:series => chart_data
			  

  })
  end

  def ajax
  end

  def data_labels
  end

  def time_zoom
  end

  def spline_inverted
  end

  def spline_symbols
  end

  def spline_plots
  end

  def scatter_plot
  end

end

class DynamicChartController < ApplicationController
  def spline_updating
    chart_data = [{
			name: 'Random data',
			data: "(function() {
				// generate an array of random data
				var data = [],
					time = (new Date()).getTime(),
					i;
				for (i = -19; i <= 0; i++) {
					data.push({
						x: time + i * 1000,
						y: Math.random()
					});
				}
				return data;
			})()"
		}]
    @chart = Highchart.spline({
        :chart => {
    			:renderTo => 'container',
    			:marginRight => 10,
					:events => {
						:load => "function() {
			
							// set up the updating of the chart each second
							var series = this.series[0];
							setInterval(function() {
								var x = (new Date()).getTime(), // current time
									y = Math.random();
								series.addPoint([x, y], true, true);
							}, 1000);
						}"
					}
				},
				:title => {
					:text => 'Live random data',
					:style => {
						:margin => '10px 100px 0 0' 
					}
				},
				:x_axis => {
					:type => 'datetime',
					:tickPixelInterval => 150
				},
				:y_axis => {
					:title => {
						:text => 'Value'
					},
					:plotLines => [{
						:value => 0,
						:width => 1,
						:color => '#808080'
					}]
				},
				:tooltip => {
					:formatter => "function() {
			                return '<b>'+ this.series.name +'</b><br/>'+
							Highcharts.dateFormat('%Y-%m-%d %H:%M:%S', this.x) +'<br/>'+ 
							Highcharts.numberFormat(this.y, 2);
					}"
				},
				:legend => {
					:enabled => false
				},
				:exporting => {
					:enabled => false
				},
				:series => chart_data
    		})
  end

  def click_to_add
    @chart = Highchart.scatter({
      :chart => {
				:renderTo => 'container',
			  :defaultSeriesType => 'scatter',
				:margin => [70, 50, 60, 80],
				:events => {
					:click => "function(e) {
						// find the clicked values and the series
						var x = e.xAxis[0].value,
							y = e.yAxis[0].value,
							series = this.series[0];
							
						// Add it
						series.addPoint([x, y]);
		
					}"
				}
			},
			:title => {
				:text => 'User supplied data'
			},
			:subtitle => {
				:text => 'Click the plot area to add a point. Click a point to remove it.'
			},
			:x_axis => {
				:minPadding => 0.2,
				:maxPadding => 0.2,
				:maxZoom => 60
			},
			:y_axis => {
				:title => {
					:text => 'Value'
				},
				:minPadding => 0.2,
				:maxPadding => 0.2,
				:maxZoom => 60,
				:plotLines => [{
					:value => 0,
					:width => 1,
					:color => '#808080'
				}]
			},
			:legend => {
				:enabled => false
			},
			:exporting => {
				:enabled => false
			},
			:plotOptions => {
				:series => {
					:lineWidth => 1,
					:point => {
						:events => {
							:click => "function() {
								if (this.series.data.length > 1) this.remove();
							}"
						}
					}
				}
			},
			:series => [{
				data: [[20, 20], [80, 80]]
			}]
  })
  end

  def master_detail
  end

end

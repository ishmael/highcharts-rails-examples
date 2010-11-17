class CombinationChartController < ApplicationController
  def column_line_pie
    @chart = Highchart.combo({
      :chart =>  {
				:renderTo =>  'container'
			},
			:title =>  {
				:text =>  'Combination chart'
			},
			:x_axis =>  {
				:categories =>  ['Apples', 'Oranges', 'Pears', 'Bananas', 'Plums']
			},
			:y_axis => {
			  :title => {
			    :text => 'Y-values'
			  }
			},
			:tooltip =>  {
				:formatter =>  "function() {
					var s;
					if (this.point.name) { // the pie chart
						s = ''+
							this.point.name +': '+ this.y +' fruits';
					} else {
						s = ''+
							this.x  +': '+ this.y;
					}
					return s;
				}"
			},
			:labels =>  {
				:items =>  [{
					:html =>  'Total fruit consumption',
					:style =>  {
						:left =>  '40px',
						:top =>  '8px',
						:color =>  'black'				
					}
				}]
			},
			:series =>  [{
				type: 'column',
				name: 'Jane',
				data: [3, 2, 1, 3, 4]
			}, {
				type: 'column',
				name: 'John',
				data: [2, 3, 5, 7, 6]
			}, {
				type: 'column',
				name: 'Joe',
				data: [4, 3, 3, 9, 0]
			}, {
				type: 'spline',
				name: 'Average',
				data: [3, 2.67, 3, 6.33, 3.33]
			}, {
				type: 'pie',
				name: 'Total consumption',
				data: [{
					name: 'Jane',
					y: 13,
					color: '#4572A7' 
				}, {
					name: 'John',
					y: 23,
					color: '#AA4643' 
				}, {
					name: 'Joe',
					y: 19,
					color: '#89A54E' 
				}],
				center: [100, 80],
				size: 100,
				showInLegend: false
			}]
  })
  end

  def dual_axes_line_column
    categories = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
			'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    @chart = Highchart.combo({
      :chart =>  {
				:renderTo =>  'container',
				:margin =>  [80, 100, 60, 100],
				:zoomType =>  'xy'
			},
			:title =>  {
				:text =>  'Average Monthly Temperature and Rainfall in Tokyo',
				:style =>  {
					:margin =>  '10px 0 0 0' 
				}
			},
			:subtitle =>  {
				:text =>  'Source: WorldClimate.com',
				:style =>  {
					:margin =>  '0 0 0 0' 
				}
			},
			:x_axis =>  [{
				:categories =>  categories
			}],
			:y_axis =>  [{ 
				:labels =>  {
					:formatter =>  "function() {return this.value +'\u00B0C';}",
					:style =>  {
						:color =>  '#89A54E'
					}
				},
				:title =>  {
					:text =>  'Temperature',
					:style =>  {
						:color =>  '#89A54E'
					},
					:margin =>  60
				}
			}, { 
				:title =>  {
					:text =>  'Rainfall',
					:margin =>  70,
					:style =>  {
						:color =>  '#4572A7'
					}
				},
				:labels =>  {
					:formatter =>  "function() {return this.value +' mm';}",
					:style =>  {
						:color =>  '#4572A7'
					}
				},
				:opposite =>  true
			}],
			:tooltip =>  {
				:formatter =>  "function() {return ''+this.x +': '+ this.y +(this.series.name == 'Rainfall' ? ' mm' : '\u00B0C');}"
			},
			:legend =>  {
				:layout =>  'vertical',
				:style =>  {
					:left =>  '120px',
					:bottom =>  'auto',
					:right =>  'auto',
					:top =>  '100px'
				},
				:backgroundColor =>  '#FFFFFF'
			},
			:series =>  [{
				name: 'Rainfall',
				color: '#4572A7',
				type: 'column',
				yAxis: 1,
				data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4]		
			
			}, {
				name: 'Temperature',
				color: '#89A54E',
				type: 'spline',
				data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
			}]
    })
  end

  def multiple_axes
    @chart = Highchart.combo({
      
    })
  end

  def scatter_regression_line
    @chart = Highchart.combo({
      
    })
  end

end

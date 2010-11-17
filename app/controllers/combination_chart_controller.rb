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
  end

  def multiple_axes
  end

  def scatter_regression_line
  end

end

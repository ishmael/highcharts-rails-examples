class ColumnBarChartController < ApplicationController
  def basic_bar
     @chart = Highchart.bar({
      :chart => {
  			:renderTo => 'container',
  		},
  		:title => {
				:text => 'Historic World Population by Region'
			},
			:subtitle => {
				:text => 'Source: Wikipedia.org'
			},
			:x_axis => {
				:categories => ['Africa', 'America', 'Asia', 'Europe', 'Oceania'],
				:title => {
					:text => ''
				}
			},
			:y_axis => {
				:min => 0,
				:title => {
					:text => 'Population (millions)',
					:align => 'high'
				}
			},
			:tooltip => {
				:formatter => "function() {
					return ''+
						 this.series.name +': '+ this.y +' millions';
				}"
			},
			:plotOptions => {
				:bar => {
					:dataLabels => {
						:enabled => true
					}
				}
			},
			:legend => {
				:layout => 'vertical',
				:align => 'right',
				:verticalAlign => 'top',
				:x => -100,
				:y => 100,
				:borderWidth => 1,
				:backgroundColor => '#FFFFFF'
			},
		  :series => [{
				name: 'Year 1800',
				data: [107, 31, 635, 203, 2]
			}, {
				name: 'Year 1900',
				data: [133, 156, 947, 408, 6]
			}, {
				name: 'Year 2008',
				data: [973, 914, 4054, 732, 34]
			}]
  		})
  end

  def stacked_bar
     @chart = Highchart.bar({
      :chart => {
  			:renderTo => 'container',
  		},
  		:title => {
				:text => 'Stacked bar chart'
			},
			:x_axis => {
				:categories => ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
			},
			:y_axis => {
				:min => 0,
				:title => {
					:text => 'Total fruit consumption'
				}
			},
			:legend => {
				:backgroundColor => '#FFFFFF',
				:reversed => true
			},
			:tooltip => {
				:formatter => "function() {
					return ''+
						 this.series.name +': '+ this.y +'';
				}"
			},
			:plotOptions => {
				:series => {
					:stacking => 'normal'
				}
			},
		  :series => [{
				name: 'John',
				data: [5, 3, 4, 7, 2]
			}, {
				name: 'Jane',
				data: [2, 2, 3, 2, 1]
			}, {
				name: 'Joe',
				data: [3, 4, 4, 2, 5]
			}]
  		})
  end

  def basic_column
  end

  def column_negative
  end

  def stack_column
  end

  def stack_perc_column
  end

  def column_rotated_labels
  end

  def column_data_html
  end

end

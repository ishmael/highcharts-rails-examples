class AreaChartController < ApplicationController
  def basic
    chart_data =  [{
			name: 'USA',
			data: ['null', 'null', 'null', 'null', 'null', 6 , 11, 32, 110, 235, 369, 640, 
				1005, 1436, 2063, 3057, 4618, 6444, 9822, 15468, 20434, 24126, 
				27387, 29459, 31056, 31982, 32040, 31233, 29224, 27342, 26662, 
				26956, 27912, 28999, 28965, 27826, 25579, 25722, 24826, 24605, 
				24304, 23464, 23708, 24099, 24357, 24237, 24401, 24344, 23586, 
				22380, 21004, 17287, 14747, 13076, 12555, 12144, 11009, 10950, 
				10871, 10824, 10577, 10527, 10475, 10421, 10358, 10295, 10104 ]
		}, {
			name: 'USSR/Russia',
			data: ['null', 'null', 'null', 'null', 'null', 'null', 'null' , 'null' , 'null' ,'null', 
			5, 25, 50, 120, 150, 200, 426, 660, 869, 1060, 1605, 2471, 3322, 
			4238, 5221, 6129, 7089, 8339, 9399, 10538, 11643, 13092, 14478, 
			15915, 17385, 19055, 21205, 23044, 25393, 27935, 30062, 32049, 
			33952, 35804, 37431, 39197, 45000, 43000, 41000, 39000, 37000, 
			35000, 33000, 31000, 29000, 27000, 25000, 24000, 23000, 22000, 
			21000, 20000, 19000, 18000, 18000, 17000, 16000]}]
		

      
    @chart = Highchart.area({
      :chart => {
				:renderTo => 'container', 
			},
			:title => {
				:text => 'US and USSR nuclear stockpiles'
			},
			:subtitle => {
				:text => 'Source: <a href="http://thebulletin.metapress.com/content/c4120650912x74k7/fulltext.pdf">'+
					'thebulletin.metapress.com</a>'
			},
			:y_axis => {
				:title => {
					:text => 'Nuclear weapon states'
				},
				:labels => {
					:formatter => "function() {
						return this.value / 1000 +'k';
					}"
				}
			},
			:tooltip => {
				:formatter => "function() {
					return this.series.name +' produced <b>'+
						Highcharts.numberFormat(this.y, 0, null, ' ') +'</b><br/>warheads in '+ this.x;
				}"
			},
			:plotOptions => {
				:area => {
					:pointStart => 1940,
					:marker => {
						:enabled => false,
						:symbol => 'circle',
						:radius => 2,
						:states => {
							:hover => {
								:enabled => true
							}
						}
					}
				}
			},
			:series => chart_data
			  

  })
  end

  def area_negative
    @chart = Highchart.area({
      :chart => {
				:renderTo => 'container',
			},
			:title => {
				:text => 'Area chart with negative values'
			},
			:x_axis => {
				:categories => ['Apples', 'Oranges', 'Pears', 'Grapes', 'Bananas']
			},
			:y_axis => {
			  :title => {
			    :text => 'Y-values'
			  }
			},
			:tooltip => {
				:formatter => "function() {
					return ''+
						 this.series.name +': '+ this.y +'';
				}"
			},
			:series => [{
				name: 'John',
				data: [5, 3, 4, 7, 2]
			}, {
				name: 'Jane',
				data: [2, -2, -3, 2, 1]
			}, {
				name: 'Joe',
				data: [3, 4, 4, -2, 5]
			}]
  })
  end

  def stacked_area
   @chart = Highchart.area({
    :chart => {
			:renderTo => 'container',
		},
		:title => {
			:text => 'Historic and Estimated Worldwide Population Growth by Region'
		},
		:subtitle => {
			:text => 'Source: Wikipedia.org'
		},
		:x_axis => {
			:categories => ['1750', '1800', '1850', '1900', '1950', '1999', '2050'],
			:tickmarkPlacement => 'on',
			:title => {
				:enabled => false
			}
		},
		:y_axis => {
			:title => {
				:text => 'Billions'
			},
			:labels => {
				:formatter => "function() {
					return this.value / 1000;
				}"
			}
		},
		:tooltip => {
			:formatter => "function() {
				return ''+
					 this.x +': '+ Highcharts.numberFormat(this.y, 0, ',') +' millions';
			}"
		},
		:plotOptions => {
			:area => {
				:stacking => 'normal',
				:lineColor => '#666666',
				:lineWidth => 1,
				:marker => {
					:lineWidth => 1,
					:lineColor => '#666666'
				}
			}
		},
		:series => [{
			name: 'Asia',
			data: [502, 635, 809, 947, 1402, 3634, 5268]
		}, {
			name: 'Africa',
			data: [106, 107, 111, 133, 221, 767, 1766]
		}, {
			name: 'Europe',
			data: [163, 203, 276, 408, 547, 729, 628]
		}, {
			name: 'America',
			data: [18, 31, 54, 156, 339, 818, 1201]
		}, {
			name: 'Oceania',
			data: [2, 2, 2, 6, 13, 30, 46]
		}]
		})
  end

  def percentage_area
     @chart = Highchart.area({
      :chart => {
  			:renderTo => 'container',
  		},
  		:title => {
  			:text => 'Historic and Estimated Worldwide Population Distribution by Region'
  		},
  		:subtitle => {
  			:text => 'Source: Wikipedia.org'
  		},
  		:x_axis => {
  			:categories => ['1750', '1800', '1850', '1900', '1950', '1999', '2050'],
  			:tickmarkPlacement => 'on',
  			:title => {
  				:enabled => false
  			}
  		},
  		:y_axis => {
  			:title => {
  				:text => 'Percent'
  			}
  		},
  		:tooltip => {
  			:formatter => "function() {
		                return ''+
						 this.x +': '+ Highcharts.numberFormat(this.percentage, 1) +'% ('+
						 Highcharts.numberFormat(this.y, 0, ',') +' millions)';
				}"
  		},
  		:plotOptions => {
  			:area => {
  				:stacking => 'percent',
  				:lineColor => '#ffffff',
  				:lineWidth => 1,
  				:marker => {
  					:lineWidth => 1,
  					:lineColor => '#ffffff'
  				}
  			}
  		},
  		:series => [{
  			name: 'Asia',
  			data: [502, 635, 809, 947, 1402, 3634, 5268]
  		}, {
  			name: 'Africa',
  			data: [106, 107, 111, 133, 221, 767, 1766]
  		}, {
  			name: 'Europe',
  			data: [163, 203, 276, 408, 547, 729, 628]
  		}, {
  			name: 'America',
  			data: [18, 31, 54, 156, 339, 818, 1201]
  		}, {
  			name: 'Oceania',
  			data: [2, 2, 2, 6, 13, 30, 46]
  		}]
  		})
  end

  def area_missing_points
     @chart = Highchart.area({
       :chart => {
					:renderTo => 'container',
					:marginBottom => 60
				},
				:title => {
					:text => 'Fruit consumption *'
				},
				:subtitle => {
					:text => '* Jane\'s banana consumption is unknown',
					:align => 'right',
					:x => -10,
					:y => 400
				},
				:legend => {
					:layout => 'vertical',
					:align => 'left',
					:verticalAlign => 'top',
					:x => 150,
					:y => 100,
					:borderWidth => 1,
					:backgroundColor => '#FFFFFF'
				},
				:x_axis => {
					:categories => ['Apples', 'Pears', 'Oranges', 'Bananas', 'Grapes', 'Plums', 'Strawberries', 'Raspberries']
				},
				:y_axis => {
					:title => {
						:text => 'Y-Axis'
					},
					:labels => {
						:formatter => "function() {
							return this.value;
						}"
					}
				},
				:tooltip => {
					:formatter => "function() {
			                return ''+
							this.x +': '+ this.y;
					}"
				},
				:plotOptions => {
					:area => {
						:fillOpacity => 0.5
					}
				},
				:series => [{
					name: 'John',
					data: [0, 1, 4, 4, 5, 2, 3, 7]
				}, {
					name: 'Jane',
					data: [1, 0, 3, 'null', 3, 1, 2, 1]
				}]
  		})
  end

  def inverted_axes
    @chart = Highchart.area({
       :chart => {
					:renderTo => 'container',
					:inverted => true
				},
				:title => {
					:text => 'Average fruit consumption during one week'
				},
				:subtitle => {
					:style => {
						:position => 'absolute',
						:right => '0px',
						:bottom => '10px'
					}
				},
				:legend => {
					:layout => 'vertical',
					:align => 'right',
					:verticalAlign => 'top',
					:x => -150,
					:y => 100,
					:borderWidth => 1,
					:backgroundColor => '#FFFFFF'
				},
				:x_axis => {
					:categories => [
						'Monday', 
						'Tuesday', 
						'Wednesday', 
						'Thursday', 
						'Friday', 
						'Saturday', 
						'Sunday'
					]
				},
				:y_axis => {
					:title => {
						:text => 'Number of units'
					},
					:labels => {
						:formatter => "function() {
							return this.value;
						}"
					},
					:min => 0
				},
				:tooltip => {
					:formatter => "function() {
			                return ''+
							this.x +': '+ this.y;
					}"
				},
				:plotOptions => {
					:area => {
						:fillOpacity => 0.5
					}
				},
				:series => [{
					name: 'John',
					data: [3, 4, 3, 5, 4, 10, 12]
				}, {
					name: 'Jane',
					data: [1, 3, 4, 3, 3, 5, 4]
				}]
  		})
  end

  def area_spline
    @chart = Highchart.areaspline({
       :chart => {
					:renderTo => 'container'
				},
				:title => {
					:text => 'Average fruit consumption during one week'
				},
				:legend => {
					:layout => 'vertical',
					:align => 'left',
					:verticalAlign => 'top',
					:x => 150,
					:y => 100,
					:borderWidth => 1,
					:backgroundColor => '#FFFFFF'
				},
				:x_axis => {
					:categories => [
						'Monday', 
						'Tuesday', 
						'Wednesday', 
						'Thursday', 
						'Friday', 
						'Saturday', 
						'Sunday'
					],
					:plotBands => [{ 
						:from => 4.5,
						:to => 6.5,
						:color => 'rgba(68, 170, 213, .2)'
					}]
				},
				:y_axis => {
					:title => {
						:text => 'Fruit units'
					}
				},
				:tooltip => {
					:formatter => "function() {
			                return ''+
							this.x +': '+ this.y +' units';
					}"
				},
				:plotOptions => {
					:areaspline => {
						:fillOpacity => 0.5
					}
				},
				:series => [{
					name: 'John',
					data: [3, 4, 3, 5, 4, 10, 12]
				}, {
					name: 'Jane',
					data: [1, 3, 4, 3, 3, 5, 4]
				}]
  		})
  end

end

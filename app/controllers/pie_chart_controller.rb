class PieChartController < ApplicationController
  def pie
    @chart = Highchart.pie({
        :chart => {
    			:renderTo => 'container',
    		  :margin => [50, 200, 60, 170]
				},
				:title => {
					:text => 'Browser market shares at a specific website, 2010'
				},
				:plotArea => {
					:shadow => '',
					:borderWidth => '',
					:backgroundColor => ''
				},
				:tooltip => {
					:formatter => "function() {
						return '<b>'+ this.point.name +'</b>: '+ this.y +' %';
					}"
				},
				:plotOptions => {
					:pie => {
						:allowPointSelect => true,
						:cursor => 'pointer',
						:dataLabels => {
							:enabled => true,
							:formatter => "function() {
								if (this.y > 5) return this.point.name;
							}",
							:color => 'white',
							:style => {
								:font => '13px Trebuchet MS, Verdana, sans-serif'
							}
						}
					}
				},
				:legend => {
					:layout => 'vertical',
					:style => {
						:left => 'auto',
						:bottom => 'auto',
						:right => '50px',
						:top => '100px'
					}
				},
			    :series => [{
					type: 'pie',
					name: 'Browser share',
					data: [
						['Firefox',   45.0],
						['IE',       26.8],
						{
							name: 'Chrome',    
							y: 12.8,
							sliced: true,
							selected: true
						},
						['Safari',    8.5],
						['Opera',     6.2],
						['Others',   0.7]
					]
				}]
    		})
  end

  def donut
    @chart = Highchart.pie({
        :chart => {
    			:renderTo => 'container',
    			:margin => [50, 0, 0, 0],
    		  :plotBackgroundColor => 'none',
					:plotBorderWidth => 0,
					:plotShadow => false				
				},
				:title => {
					:text => 'Browser market shares at a specific website'
				},
				:subtitle => {
					:text => 'Inner circle: 2008, outer circle: 2010'
				},
				:plotArea => {
					:shadow => '',
					:borderWidth => '',
					:backgroundColor => ''
				},
				:tooltip => {
					:formatter => "function() {
						return '<b>'+ this.series.name +'</b><br/>'+ 
							this.point.name +': '+ this.y +' %';
					}"
				},
				:legend => {
					:enabled => false
				},
			  :series => [{
					type: 'pie',
					name: '2008',
					size: '45%',
					innerSize: '20%',
					data: [
						{ name: 'Firefox', y: 44.2, color: '#4572A7' },
						{ name: 'IE', y: 46.6, color: '#AA4643' },
						{ name: 'Chrome', y: 3.1, color: '#89A54E' },
						{ name: 'Safari', y: 2.7, color: '#80699B' },
						{ name: 'Opera', y: 2.3, color: '#3D96AE' },
						{ name: 'Mozilla', y: 0.4, color: '#DB843D' }
					]
				}, {
					type: 'pie',
					name: '2010',
					innerSize: '45%',
					data: [
						{ name: 'Firefox', y: 45.0, color: '#4572A7' },
						{ name: 'IE', y: 26.8, color: '#AA4643' },
						{ name: 'Chrome', y: 12.8, color: '#89A54E' },
						{ name: 'Safari', y: 8.5, color: '#80699B' },
						{ name: 'Opera', y: 6.2, color: '#3D96AE' },
						{ name: 'Mozilla', y: 0.2, color: '#DB843D' }
					],
					dataLabels: {
						enabled: true,
						formatter: "function() {
							if (this.y > 5) return this.point.name;
						}",
						color: 'white',
						style: {
							font: '13px Trebuchet MS, Verdana, sans-serif'
						}
					}
				}]
    		})
  end

end

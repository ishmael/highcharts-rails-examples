class LineChartController < ApplicationController
  def basic
    chart_data = [{
			:name  => 'Tokyo',
			:data  => [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		}, {
			:name  => 'New York',
			:data  => [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
		}, {
			:name  => 'Berlin',
			:data  => [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
		}, {
			:name  => 'London',
			:data  => [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
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
		
		tooltip_formatter = '
      function() {return "<b>"+ this.series.name +"</b><br/>"+this.x +": "+ this.y +"\u00B0C";}'
      
    @chart = Highchart.spline({
      :chart => {
				:renderTo => "container"		
			},
			:title => {
				:text => "Monthly Average Temperature in Tokyo"
			},
			:subtitle => {
				:text => 'Source: WorldClimate.com'
			},
			:x_axis => {
				:categories => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
					'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			},
			:y_axis => {
				:title => {
					:text => "Temperature (\u00B0C)"
				}
			},
			:legend => {
			  :enabled => false
			},
			:tooltip => {
				:formatter => tooltip_formatter
			},
			:plotOptions => {
				:spline => {
				  :cursor => 'pointer',
					:point => {
						:events => {
							:click => "function() {
								hs.htmlExpand(null, {
									pageOrigin: {
										x: this.pageX, 
										y: this.pageY
									},
									headingText: this.series.name,
									maincontentText: 'this.category: '+ this.category +
										'<br/>this.y: '+ this.y,
									width: 200
								});
							}"
						}
					}
				}
			},
			:series => [],
			:format =>'options'
  } )
  end
  
  def get_ajax
    chart_data = [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
		
		render :json => chart_data
  end

  def data_labels
    chart_data = [{
				:name  => 'Tokyo',
				:data  => [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
			}, {
				:name  => 'London',
				:data  => [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
		}]
		
		tooltip_formatter = '
      function() {return "<b>"+ this.series.name +"</b><br/>"+this.x +":"+ this.y +"\u00B0C";}'
      
    @chart = Highchart.line({
      :chart => {
				:renderTo => "container"		
			},
			:title => {
				:text => "Monthly Average Temperature"
			},
			:subtitle => {
				:text => 'Source: WorldClimate.com'
			},
			:x_axis => {
				:categories => ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
					'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
			},
			:y_axis => {
				:title => {
					:text => "Temperature (\u00B0C)"
				}
			},
			:tooltip => {
			  :enable => false,
				:formatter => tooltip_formatter
			},
			:plotOptions => {
				:line => {
					:dataLabels => {
						:enabled => true
					},
					:enableMouseTracking => false
				}
			},
			:series => chart_data
  })
  end

  def time_zoom
     chart_data = [
				0.8446, 0.8445, 0.8444, 0.8451,	0.8418, 0.8264,	0.8258, 0.8232,	0.8233, 0.8258, 
				0.8283, 0.8278, 0.8256, 0.8292,	0.8239, 0.8239,	0.8245, 0.8265,	0.8261, 0.8269, 
				0.8273, 0.8244, 0.8244, 0.8172,	0.8139, 0.8146,	0.8164, 0.82,	0.8269, 0.8269, 
				0.8269, 0.8258, 0.8247, 0.8286,	0.8289, 0.8316,	0.832, 0.8333,	0.8352, 0.8357, 
				0.8355, 0.8354, 0.8403, 0.8403,	0.8406, 0.8403,	0.8396, 0.8418,	0.8409, 0.8384, 
				0.8386, 0.8372, 0.839, 0.84, 0.8389, 0.84, 0.8423, 0.8423, 0.8435, 0.8422, 
				0.838, 0.8373, 0.8316, 0.8303,	0.8303, 0.8302,	0.8369, 0.84, 0.8385, 0.84, 
				0.8401, 0.8402, 0.8381, 0.8351,	0.8314, 0.8273,	0.8213, 0.8207,	0.8207, 0.8215, 
				0.8242, 0.8273, 0.8301, 0.8346,	0.8312, 0.8312,	0.8312, 0.8306,	0.8327, 0.8282, 
				0.824, 0.8255, 0.8256, 0.8273, 0.8209, 0.8151, 0.8149, 0.8213, 0.8273, 0.8273, 
				0.8261, 0.8252, 0.824, 0.8262, 0.8258, 0.8261, 0.826, 0.8199, 0.8153, 0.8097, 
				0.8101, 0.8119, 0.8107, 0.8105,	0.8084, 0.8069,	0.8047, 0.8023,	0.7965, 0.7919, 
				0.7921, 0.7922, 0.7934, 0.7918,	0.7915, 0.787, 0.7861, 0.7861, 0.7853, 0.7867, 
				0.7827, 0.7834, 0.7766, 0.7751, 0.7739, 0.7767, 0.7802, 0.7788, 0.7828, 0.7816, 
				0.7829, 0.783, 0.7829, 0.7781, 0.7811, 0.7831, 0.7826, 0.7855, 0.7855, 0.7845, 
				0.7798, 0.7777, 0.7822, 0.7785, 0.7744, 0.7743, 0.7726, 0.7766, 0.7806, 0.785, 
				0.7907, 0.7912, 0.7913, 0.7931, 0.7952, 0.7951, 0.7928, 0.791, 0.7913, 0.7912, 
				0.7941, 0.7953, 0.7921, 0.7919, 0.7968, 0.7999, 0.7999, 0.7974, 0.7942, 0.796, 
				0.7969, 0.7862, 0.7821, 0.7821, 0.7821, 0.7811, 0.7833, 0.7849, 0.7819, 0.7809, 
				0.7809, 0.7827, 0.7848, 0.785, 0.7873, 0.7894, 0.7907, 0.7909, 0.7947, 0.7987, 
				0.799, 0.7927, 0.79, 0.7878, 0.7878, 0.7907, 0.7922, 0.7937, 0.786, 0.787, 
				0.7838, 0.7838, 0.7837, 0.7836, 0.7806, 0.7825, 0.7798, 0.777, 0.777, 0.7772, 
				0.7793, 0.7788, 0.7785, 0.7832, 0.7865, 0.7865, 0.7853, 0.7847, 0.7809, 0.778, 
				0.7799, 0.78, 0.7801, 0.7765, 0.7785, 0.7811, 0.782, 0.7835, 0.7845, 0.7844, 
				0.782, 0.7811, 0.7795, 0.7794, 0.7806, 0.7794, 0.7794, 0.7778, 0.7793, 0.7808, 
				0.7824, 0.787, 0.7894, 0.7893, 0.7882, 0.7871, 0.7882, 0.7871, 0.7878, 0.79, 
				0.7901, 0.7898, 0.7879, 0.7886, 0.7858, 0.7814, 0.7825, 0.7826, 0.7826, 0.786, 
				0.7878, 0.7868, 0.7883, 0.7893, 0.7892, 0.7876, 0.785, 0.787, 0.7873, 0.7901, 
				0.7936, 0.7939, 0.7938, 0.7956, 0.7975, 0.7978, 0.7972, 0.7995, 0.7995, 0.7994, 
				0.7976, 0.7977, 0.796, 0.7922, 0.7928, 0.7929, 0.7948, 0.797, 0.7953, 0.7907, 
				0.7872, 0.7852, 0.7852, 0.786, 0.7862, 0.7836, 0.7837, 0.784, 0.7867, 0.7867, 
				0.7869, 0.7837, 0.7827, 0.7825, 0.7779, 0.7791, 0.779, 0.7787, 0.78, 0.7807, 
				0.7803, 0.7817, 0.7799, 0.7799, 0.7795, 0.7801, 0.7765, 0.7725, 0.7683, 0.7641, 
				0.7639, 0.7616, 0.7608, 0.759, 0.7582, 0.7539, 0.75, 0.75, 0.7507, 0.7505, 
				0.7516, 0.7522, 0.7531, 0.7577, 0.7577, 0.7582, 0.755, 0.7542, 0.7576, 0.7616, 
				0.7648, 0.7648, 0.7641, 0.7614, 0.757, 0.7587, 0.7588, 0.762, 0.762, 0.7617, 
				0.7618, 0.7615, 0.7612, 0.7596, 0.758, 0.758, 0.758, 0.7547, 0.7549, 0.7613, 
				0.7655, 0.7693, 0.7694, 0.7688, 0.7678, 0.7708, 0.7727, 0.7749, 0.7741, 0.7741, 
				0.7732, 0.7727, 0.7737, 0.7724, 0.7712, 0.772, 0.7721, 0.7717, 0.7704, 0.769, 
				0.7711, 0.774, 0.7745, 0.7745, 0.774, 0.7716, 0.7713, 0.7678, 0.7688, 0.7718, 
				0.7718, 0.7728, 0.7729, 0.7698, 0.7685, 0.7681, 0.769, 0.769, 0.7698, 0.7699, 
				0.7651, 0.7613, 0.7616, 0.7614, 0.7614, 0.7607, 0.7602, 0.7611, 0.7622, 0.7615, 
				0.7598, 0.7598, 0.7592, 0.7573, 0.7566, 0.7567, 0.7591, 0.7582, 0.7585, 0.7613, 
				0.7631, 0.7615, 0.76, 0.7613, 0.7627, 0.7627, 0.7608, 0.7583, 0.7575, 0.7562, 
				0.752, 0.7512, 0.7512, 0.7517, 0.752, 0.7511, 0.748, 0.7509, 0.7531, 0.7531, 
				0.7527, 0.7498, 0.7493, 0.7504, 0.75, 0.7491, 0.7491, 0.7485, 0.7484, 0.7492, 
				0.7471, 0.7459, 0.7477, 0.7477, 0.7483, 0.7458, 0.7448, 0.743, 0.7399, 0.7395, 
				0.7395, 0.7378, 0.7382, 0.7362, 0.7355, 0.7348, 0.7361, 0.7361, 0.7365, 0.7362, 
				0.7331, 0.7339, 0.7344, 0.7327, 0.7327, 0.7336, 0.7333, 0.7359, 0.7359, 0.7372, 
				0.736, 0.736, 0.735, 0.7365, 0.7384, 0.7395, 0.7413, 0.7397, 0.7396, 0.7385, 
				0.7378, 0.7366, 0.74, 0.7411, 0.7406, 0.7405, 0.7414, 0.7431, 0.7431, 0.7438, 
				0.7443, 0.7443, 0.7443, 0.7434, 0.7429, 0.7442, 0.744, 0.7439, 0.7437, 0.7437, 
				0.7429, 0.7403, 0.7399, 0.7418, 0.7468, 0.748, 0.748, 0.749, 0.7494, 0.7522, 
				0.7515, 0.7502, 0.7472, 0.7472, 0.7462, 0.7455, 0.7449, 0.7467, 0.7458, 0.7427, 
				0.7427, 0.743, 0.7429, 0.744, 0.743, 0.7422, 0.7388, 0.7388, 0.7369, 0.7345, 
				0.7345, 0.7345, 0.7352, 0.7341, 0.7341, 0.734, 0.7324, 0.7272, 0.7264, 0.7255, 
				0.7258, 0.7258, 0.7256, 0.7257, 0.7247, 0.7243, 0.7244, 0.7235, 0.7235, 0.7235, 
				0.7235, 0.7262, 0.7288, 0.7301, 0.7337, 0.7337, 0.7324, 0.7297, 0.7317, 0.7315, 
				0.7288, 0.7263, 0.7263, 0.7242, 0.7253, 0.7264, 0.727, 0.7312, 0.7305, 0.7305, 
				0.7318, 0.7358, 0.7409, 0.7454, 0.7437, 0.7424, 0.7424, 0.7415, 0.7419, 0.7414, 
				0.7377, 0.7355, 0.7315, 0.7315, 0.732, 0.7332, 0.7346, 0.7328, 0.7323, 0.734, 
				0.734, 0.7336, 0.7351, 0.7346, 0.7321, 0.7294, 0.7266, 0.7266, 0.7254, 0.7242, 
				0.7213, 0.7197, 0.7209, 0.721, 0.721, 0.721, 0.7209, 0.7159, 0.7133, 0.7105, 
				0.7099, 0.7099, 0.7093, 0.7093, 0.7076, 0.707, 0.7049, 0.7012, 0.7011, 0.7019, 
				0.7046, 0.7063, 0.7089, 0.7077, 0.7077, 0.7077, 0.7091, 0.7118, 0.7079, 0.7053, 
				0.705, 0.7055, 0.7055, 0.7045, 0.7051, 0.7051, 0.7017, 0.7, 0.6995, 0.6994, 
				0.7014, 0.7036, 0.7021, 0.7002, 0.6967, 0.695, 0.695, 0.6939, 0.694, 0.6922, 
				0.6919, 0.6914, 0.6894, 0.6891, 0.6904, 0.689, 0.6834, 0.6823, 0.6807, 0.6815, 
				0.6815, 0.6847, 0.6859, 0.6822, 0.6827, 0.6837, 0.6823, 0.6822, 0.6822, 0.6792, 
				0.6746, 0.6735, 0.6731, 0.6742, 0.6744, 0.6739, 0.6731, 0.6761, 0.6761, 0.6785,
				0.6818, 0.6836, 0.6823, 0.6805, 0.6793, 0.6849, 0.6833, 0.6825, 0.6825, 0.6816, 
				0.6799, 0.6813, 0.6809, 0.6868, 0.6933, 0.6933, 0.6945, 0.6944, 0.6946, 0.6964, 
				0.6965, 0.6956, 0.6956, 0.695, 0.6948, 0.6928, 0.6887, 0.6824, 0.6794, 0.6794, 
				0.6803, 0.6855, 0.6824, 0.6791, 0.6783, 0.6785, 0.6785, 0.6797, 0.68, 0.6803, 
				0.6805, 0.676, 0.677, 0.677, 0.6736, 0.6726, 0.6764, 0.6821, 0.6831, 0.6842, 
				0.6842, 0.6887, 0.6903, 0.6848, 0.6824, 0.6788, 0.6814, 0.6814, 0.6797, 0.6769, 
				0.6765, 0.6733, 0.6729, 0.6758, 0.6758, 0.675, 0.678, 0.6833, 0.6856, 0.6903, 
				0.6896, 0.6896, 0.6882, 0.6879, 0.6862, 0.6852, 0.6823, 0.6813, 0.6813, 0.6822, 
				0.6802, 0.6802, 0.6784, 0.6748, 0.6747, 0.6747, 0.6748, 0.6733, 0.665, 0.6611, 
				0.6583, 0.659, 0.659, 0.6581, 0.6578, 0.6574, 0.6532, 0.6502, 0.6514, 0.6514, 
				0.6507, 0.651, 0.6489, 0.6424, 0.6406, 0.6382, 0.6382, 0.6341, 0.6344, 0.6378, 
				0.6439, 0.6478, 0.6481, 0.6481, 0.6494, 0.6438, 0.6377, 0.6329, 0.6336, 0.6333, 
				0.6333, 0.633, 0.6371, 0.6403, 0.6396, 0.6364, 0.6356, 0.6356, 0.6368, 0.6357, 
				0.6354, 0.632, 0.6332, 0.6328, 0.6331, 0.6342, 0.6321, 0.6302, 0.6278, 0.6308, 
				0.6324, 0.6324, 0.6307, 0.6277, 0.6269, 0.6335, 0.6392, 0.64, 0.6401, 0.6396, 
				0.6407, 0.6423, 0.6429, 0.6472, 0.6485, 0.6486, 0.6467, 0.6444, 0.6467, 0.6509, 
				0.6478, 0.6461, 0.6461, 0.6468, 0.6449, 0.647, 0.6461, 0.6452, 0.6422, 0.6422, 
				0.6425, 0.6414, 0.6366, 0.6346, 0.635, 0.6346, 0.6346, 0.6343, 0.6346, 0.6379, 
				0.6416, 0.6442, 0.6431, 0.6431, 0.6435, 0.644, 0.6473, 0.6469, 0.6386, 0.6356, 
				0.634, 0.6346, 0.643, 0.6452, 0.6467, 0.6506, 0.6504, 0.6503, 0.6481, 0.6451, 
				0.645, 0.6441, 0.6414, 0.6409, 0.6409, 0.6428, 0.6431, 0.6418, 0.6371, 0.6349, 
				0.6333, 0.6334, 0.6338, 0.6342, 0.632, 0.6318, 0.637, 0.6368, 0.6368, 0.6383, 
				0.6371, 0.6371, 0.6355, 0.632, 0.6277, 0.6276, 0.6291, 0.6274, 0.6293, 0.6311, 
				0.631, 0.6312, 0.6312, 0.6304, 0.6294, 0.6348, 0.6378, 0.6368, 0.6368, 0.6368, 
				0.636, 0.637, 0.6418, 0.6411, 0.6435, 0.6427, 0.6427, 0.6419, 0.6446, 0.6468, 
				0.6487, 0.6594, 0.6666, 0.6666, 0.6678, 0.6712, 0.6705, 0.6718, 0.6784, 0.6811, 
				0.6811, 0.6794, 0.6804, 0.6781, 0.6756, 0.6735, 0.6763, 0.6762, 0.6777, 0.6815, 
				0.6802, 0.678, 0.6796, 0.6817, 0.6817, 0.6832, 0.6877, 0.6912, 0.6914, 0.7009, 
				0.7012, 0.701, 0.7005, 0.7076, 0.7087, 0.717, 0.7105, 0.7031, 0.7029, 0.7006, 
				0.7035, 0.7045, 0.6956, 0.6988, 0.6915, 0.6914, 0.6859, 0.6778, 0.6815, 0.6815, 
				0.6843, 0.6846, 0.6846, 0.6923, 0.6997, 0.7098, 0.7188, 0.7232, 0.7262, 0.7266, 
				0.7359, 0.7368, 0.7337, 0.7317, 0.7387, 0.7467, 0.7461, 0.7366, 0.7319, 0.7361, 
				0.7437, 0.7432, 0.7461, 0.7461, 0.7454, 0.7549, 0.7742, 0.7801, 0.7903, 0.7876, 
				0.7928, 0.7991, 0.8007, 0.7823, 0.7661, 0.785, 0.7863, 0.7862, 0.7821, 0.7858, 
				0.7731, 0.7779, 0.7844, 0.7866, 0.7864, 0.7788, 0.7875, 0.7971, 0.8004, 0.7857, 
				0.7932, 0.7938, 0.7927, 0.7918, 0.7919, 0.7989, 0.7988, 0.7949, 0.7948, 0.7882, 
				0.7745, 0.771, 0.775, 0.7791, 0.7882, 0.7882, 0.7899, 0.7905, 0.7889, 0.7879, 
				0.7855, 0.7866, 0.7865, 0.7795, 0.7758, 0.7717, 0.761, 0.7497, 0.7471, 0.7473, 
				0.7407, 0.7288, 0.7074, 0.6927, 0.7083, 0.7191, 0.719, 0.7153, 0.7156, 0.7158, 
				0.714, 0.7119, 0.7129, 0.7129, 0.7049, 0.7095
			]

  		tooltip_formatter = 'function() {return  Highcharts.dateFormat("%A %B %e %Y", this.x) + ":"+	"1 USD = "+ Highcharts.numberFormat(this.y, 2) +" EUR";}'

      @chart = Highchart.area({
        :chart => {
  				:renderTo => "container",
  				:zoomType => 'x'
  			},
  			:title => {
  				:text => "USD to EUR exchange rate from 2006 through 2008"
  			},
  			:subtitle => {
  				:text => 'Click and drag in the plot area to zoom in'
  			},
  			:x_axis => {
          :type => 'datetime',
					:maxZoom => 14 * 24 * 3600000,
					:title => {
						:text=> ''
					}
  			},
  			:y_axis => {
  				:title => {
						:text => 'Exchange rate'
					},
					:min=> 0.6,
					:startOnTick => false,
					:showFirstLabel => false
  			},
  			:tooltip => {
  				:formatter => tooltip_formatter
  			},
        
  			:plotOptions => {
  				:area => {
  					:fillColor => {
							:linearGradient => [0, 0, 0, 300],
							:stops => [
								[0, '#4572A7'],
								[1, 'rgba(2,0,0,0)']
							]
						},
						:lineWidth => 1,
						:marker => {
							:enabled => false,
							:states => {
								:hover => {
									:enabled => true,
									:radius => 5
								}
							}
						},
						:shadow => false,
						:states => {
							:hover => {
								:lineWidth => 1						
							}
						}
  				}
  			},
  			:legend => {
  			  :enabled => false
  			},
  			:series => [{
					:name => 'USD to EUR',
					:pointInterval => 24 * 3600 * 1000,
					:pointStart => Date.parse('2006/01/01').strftime('%s').to_i * 1000,  			 
  			  :data => chart_data
        }]

    })
  end

  def spline_inverted
    chart_data = [{
				:name  => 'Temperature',
				:data  => [[0, 15], [10, -50], [20, -56.5], [30, -46.5], [40, -22.1], 
					[50, -2.5], [60, -27.7], [70, -55.7], [80, -76.5]]
			}]
		
		tooltip_formatter = '
      function() {return ""+this.x +" km: "+ this.y +"\u00B0C";}'
      
    @chart = Highchart.spline({
      :chart => {
				:renderTo => "container",	
				:inverted => true,	
				:width => 500,
				:style => {
				  :margin => '0 auto'
				}
			},
			:title => {
				:text => "Atmosphere Temperature by Altitude"
			},
			:subtitle => {
				:text => 'According to the Standard Atmosphere Model'
			},
			:x_axis => {
			  :reversed => false,
        :title => {
          :enabled =>true,
          :text => 'Altitude',
          :margin => 50
        },
        :labels => {
          :formatter => "function() { return this.value + 'km';}"
        },
        :maxPadding => 0.05,
        :showLastLabel => true
			},
			:y_axis => {
				:title => {
					:text => "Temperature"
				},
				:labels => {
          :formatter => "function() { return this.value + '\u00B0';}"
        },
        :lineWidth => 2
			},
			:legend => {
			  :enabled => false
			},
			:tooltip => {
				:formatter => tooltip_formatter
			},
			:plotOptions => {
				:spline => {
					:marker => {
						:enabled => true
					}
				}
			},
			:series => chart_data
			  

  })
  end

  def spline_symbols
     chart_data = [{
  			:name  =>   'Tokyo',
  			:marker => {
  			  :symbol => 'square'
  			},
  			:data  =>  [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, {
					:y => 26.5,
					:marker => {
						:symbol => 'url(/images/sun.png)'
					}
				}, 23.3, 18.3, 13.9, 9.6]

  		}, {
  			:name  => 'London',
				:marker => {
					:symbol => 'diamond'
				},
				:data  => [{
					:y => 3.9,
					:marker => {
						:symbol => 'url(/images/snow.png)'
					}
				}, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
  		}]

      @chart = Highchart.spline({
        	:chart => {
						:renderTo =>  'container',
						:ignoreHiddenSeries =>  false
					},
					:title =>  {
						:text =>  'Monthly Average Temperature'
					},
					:subtitle =>  {
						:text =>  'Source: WorldClimate.com'
					},
					:x_axis =>  {
						:categories =>  ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 
							'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
					},
					:y_axis =>  {
						:title =>  {
							:text =>  'Temperature'
						},
						:labels =>  {
							:formatter =>  "function() {
								return this.value +'\u00B0'
							}"
						}
					},
					:tooltip =>  {
						:formatter =>  "function() {
							return ''+
								this.x +': '+ this.y +'\u00B0C';
						}"
					},
					:plotOptions =>  {
						:spline =>  {
							:marker =>  {
								:radius =>  4,
								:lineColor =>  '#666666',
								:lineWidth =>  1
							}
						}
					},
  				:series => chart_data 
          })
  end

  def spline_plots
    chart_data = [{
			:name  =>   'Hestavollane',
			:data  =>   [4.3, 5.1, 4.3, 5.2, 5.4, 4.7, 3.5, 4.1, 5.6, 7.4, 6.9, 7.1, 
				7.9, 7.9, 7.5, 6.7, 7.7, 7.7, 7.4, 7.0, 7.1, 5.8, 5.9, 7.4, 
				8.2, 8.5, 9.4, 8.1, 10.9, 10.4, 10.9, 12.4, 12.1, 9.5, 7.5, 
				7.1, 7.5, 8.1, 6.8, 3.4, 2.1, 1.9, 2.8, 2.9, 1.3, 4.4, 4.2, 
				3.0, 3.0]
	
		}, {
			:name  =>   'Voll',
			:data  =>   [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 0.3, 0.0, 
				0.0, 0.4, 0.0, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 
				0.0, 0.6, 1.2, 1.7, 0.7, 2.9, 4.1, 2.6, 3.7, 3.9, 1.7, 2.3, 
				3.0, 4.3, 6.8, 6.0, 7.0, 6.0, 3.2, 2.0, 0.9, 0.4, 0.3, 0.5, 0.4]
		}]
		
    @chart = Highchart.spline({
      	:chart => {
					:renderTo =>  'container',
					:ignoreHiddenSeries =>  false
				},
				:title =>  {
					:text =>  'Wind speed during two days'
				},
				:subtitle  =>  {
					:text  =>  'October 6th and 7th 2009 at two locations in Vik i Sogn, Norway'
				},
				:x_axis  =>  {
					:type =>  'datetime'
				},
				:y_axis =>  {
					:title =>  {
						:text =>  'Wind speed (m/s)'
					},
					:min =>  0,
					:minorGridLineWidth =>  0, 
					:gridLineWidth =>  0,
					:alternateGridColor =>  '',
					:plotBands  =>  [{ 
						:from =>  0.3,
						:to =>  1.5,
						:color =>  'rgba(68, 170, 213, 0.1)'
					}, { 
						:from =>  3.3,
						:to =>  5.5,
						:color =>  'rgba(68, 170, 213, 0.1)'
					}, { 
						:from =>  8,
						:to =>  11,
						:color =>  'rgba(68, 170, 213, 0.1)'
					}, { 
						:from =>  14,
						:to =>  15,
						:color =>  'rgba(68, 170, 213, 0.1)'
					}]
				},
				:labels =>  {
					:items =>  [{
						:html =>  'Light air',
						:style =>  {
							:left =>  '10px',
							:top =>  '250px'
						}		
					}, {
						:html =>  'Light breeze',
						:style =>  {
							:left =>  '10px',
							:top =>  '220px'
						}		
					}, {
						:html =>  'Moderate breeze',
						:style =>  {
							:left =>  '10px',
							:top =>  '180px'
						}		
					}, {
						:html =>  'Fresh breeze',
						:style =>  {
							:left =>  '10px',
							:top =>  '135px'
						}		
					}, {
						:html =>  'Strong breeze',
						:style =>  {
							:left =>  '10px',
							:top =>  '90px'
						}		
					}, {
						:html =>  'High wind',
						:style =>  {
							:left =>  '10px',
							:top =>  '35px'
						}		
					}]
				},
				:tooltip =>  {
					:formatter =>  "function() {
			                return ''+
							Highcharts.dateFormat('%e. %b %Y, %H:00', this.x) +': '+ this.y +' m/s';
					}"
				},
				:plotOptions =>  {
					:spline =>  {
						:lineWidth =>  4,
						:states =>  {
							:hover =>  {
								:lineWidth =>  5
							}
						},
						:marker =>  {
							:enabled =>  false,
							:states =>  {
								:hover =>  {
									:enabled =>  true,
									:symbol =>  'circle',
									:radius =>  5,
									:lineWidth =>  1
								}
							}	
						},
						:pointInterval =>  3600000,
						:pointStart =>  Date.parse('2009/10/06').strftime('%s').to_i * 1000
					}
				},
				:series => chart_data ,
				:navigation =>  {
					:menuItemStyle =>  {
						:fontSize =>  '10px'
					}
				}
        })
  end

  def scatter_plot
      chart_data = [{
    			:name  => 'Female',
					:color => 'rgba(223, 83, 83, .5)',
					:data  => [[161.2, 51.6], [167.5, 59.0], [159.5, 49.2], [157.0, 63.0], [155.8, 53.6], 
						[170.0, 59.0], [159.1, 47.6], [166.0, 69.8], [176.2, 66.8], [160.2, 75.2], 
						[172.5, 55.2], [170.9, 54.2], [172.9, 62.5], [153.4, 42.0], [160.0, 50.0], 
						[147.2, 49.8], [168.2, 49.2], [175.0, 73.2], [157.0, 47.8], [167.6, 68.8], 
						[159.5, 50.6], [175.0, 82.5], [166.8, 57.2], [176.5, 87.8], [170.2, 72.8], 
						[174.0, 54.5], [173.0, 59.8], [179.9, 67.3], [170.5, 67.8], [160.0, 47.0], 
						[154.4, 46.2], [162.0, 55.0], [176.5, 83.0], [160.0, 54.4], [152.0, 45.8], 
						[162.1, 53.6], [170.0, 73.2], [160.2, 52.1], [161.3, 67.9], [166.4, 56.6], 
						[168.9, 62.3], [163.8, 58.5], [167.6, 54.5], [160.0, 50.2], [161.3, 60.3], 
						[167.6, 58.3], [165.1, 56.2], [160.0, 50.2], [170.0, 72.9], [157.5, 59.8], 
						[167.6, 61.0], [160.7, 69.1], [163.2, 55.9], [152.4, 46.5], [157.5, 54.3], 
						[168.3, 54.8], [180.3, 60.7], [165.5, 60.0], [165.0, 62.0], [164.5, 60.3], 
						[156.0, 52.7], [160.0, 74.3], [163.0, 62.0], [165.7, 73.1], [161.0, 80.0], 
						[162.0, 54.7], [166.0, 53.2], [174.0, 75.7], [172.7, 61.1], [167.6, 55.7], 
						[151.1, 48.7], [164.5, 52.3], [163.5, 50.0], [152.0, 59.3], [169.0, 62.5], 
						[164.0, 55.7], [161.2, 54.8], [155.0, 45.9], [170.0, 70.6], [176.2, 67.2], 
						[170.0, 69.4], [162.5, 58.2], [170.3, 64.8], [164.1, 71.6], [169.5, 52.8], 
						[163.2, 59.8], [154.5, 49.0], [159.8, 50.0], [173.2, 69.2], [170.0, 55.9], 
						[161.4, 63.4], [169.0, 58.2], [166.2, 58.6], [159.4, 45.7], [162.5, 52.2], 
						[159.0, 48.6], [162.8, 57.8], [159.0, 55.6], [179.8, 66.8], [162.9, 59.4], 
						[161.0, 53.6], [151.1, 73.2], [168.2, 53.4], [168.9, 69.0], [173.2, 58.4], 
						[171.8, 56.2], [178.0, 70.6], [164.3, 59.8], [163.0, 72.0], [168.5, 65.2], 
						[166.8, 56.6], [172.7, 105.2], [163.5, 51.8], [169.4, 63.4], [167.8, 59.0], 
						[159.5, 47.6], [167.6, 63.0], [161.2, 55.2], [160.0, 45.0], [163.2, 54.0], 
						[162.2, 50.2], [161.3, 60.2], [149.5, 44.8], [157.5, 58.8], [163.2, 56.4], 
						[172.7, 62.0], [155.0, 49.2], [156.5, 67.2], [164.0, 53.8], [160.9, 54.4], 
						[162.8, 58.0], [167.0, 59.8], [160.0, 54.8], [160.0, 43.2], [168.9, 60.5], 
						[158.2, 46.4], [156.0, 64.4], [160.0, 48.8], [167.1, 62.2], [158.0, 55.5], 
						[167.6, 57.8], [156.0, 54.6], [162.1, 59.2], [173.4, 52.7], [159.8, 53.2], 
						[170.5, 64.5], [159.2, 51.8], [157.5, 56.0], [161.3, 63.6], [162.6, 63.2], 
						[160.0, 59.5], [168.9, 56.8], [165.1, 64.1], [162.6, 50.0], [165.1, 72.3], 
						[166.4, 55.0], [160.0, 55.9], [152.4, 60.4], [170.2, 69.1], [162.6, 84.5], 
						[170.2, 55.9], [158.8, 55.5], [172.7, 69.5], [167.6, 76.4], [162.6, 61.4], 
						[167.6, 65.9], [156.2, 58.6], [175.2, 66.8], [172.1, 56.6], [162.6, 58.6], 
						[160.0, 55.9], [165.1, 59.1], [182.9, 81.8], [166.4, 70.7], [165.1, 56.8], 
						[177.8, 60.0], [165.1, 58.2], [175.3, 72.7], [154.9, 54.1], [158.8, 49.1], 
						[172.7, 75.9], [168.9, 55.0], [161.3, 57.3], [167.6, 55.0], [165.1, 65.5], 
						[175.3, 65.5], [157.5, 48.6], [163.8, 58.6], [167.6, 63.6], [165.1, 55.2], 
						[165.1, 62.7], [168.9, 56.6], [162.6, 53.9], [164.5, 63.2], [176.5, 73.6], 
						[168.9, 62.0], [175.3, 63.6], [159.4, 53.2], [160.0, 53.4], [170.2, 55.0], 
						[162.6, 70.5], [167.6, 54.5], [162.6, 54.5], [160.7, 55.9], [160.0, 59.0], 
						[157.5, 63.6], [162.6, 54.5], [152.4, 47.3], [170.2, 67.7], [165.1, 80.9], 
						[172.7, 70.5], [165.1, 60.9], [170.2, 63.6], [170.2, 54.5], [170.2, 59.1], 
						[161.3, 70.5], [167.6, 52.7], [167.6, 62.7], [165.1, 86.3], [162.6, 66.4], 
						[152.4, 67.3], [168.9, 63.0], [170.2, 73.6], [175.2, 62.3], [175.2, 57.7], 
						[160.0, 55.4], [165.1, 104.1], [174.0, 55.5], [170.2, 77.3], [160.0, 80.5], 
						[167.6, 64.5], [167.6, 72.3], [167.6, 61.4], [154.9, 58.2], [162.6, 81.8], 
						[175.3, 63.6], [171.4, 53.4], [157.5, 54.5], [165.1, 53.6], [160.0, 60.0], 
						[174.0, 73.6], [162.6, 61.4], [174.0, 55.5], [162.6, 63.6], [161.3, 60.9], 
						[156.2, 60.0], [149.9, 46.8], [169.5, 57.3], [160.0, 64.1], [175.3, 63.6], 
						[169.5, 67.3], [160.0, 75.5], [172.7, 68.2], [162.6, 61.4], [157.5, 76.8], 
						[176.5, 71.8], [164.4, 55.5], [160.7, 48.6], [174.0, 66.4], [163.8, 67.3]]
			
				}, {
					:name  => 'Male',
					:color => 'rgba(119, 152, 191, .5)',
					:data  => [[174.0, 65.6], [175.3, 71.8], [193.5, 80.7], [186.5, 72.6], [187.2, 78.8], 
						[181.5, 74.8], [184.0, 86.4], [184.5, 78.4], [175.0, 62.0], [184.0, 81.6], 
						[180.0, 76.6], [177.8, 83.6], [192.0, 90.0], [176.0, 74.6], [174.0, 71.0], 
						[184.0, 79.6], [192.7, 93.8], [171.5, 70.0], [173.0, 72.4], [176.0, 85.9], 
						[176.0, 78.8], [180.5, 77.8], [172.7, 66.2], [176.0, 86.4], [173.5, 81.8], 
						[178.0, 89.6], [180.3, 82.8], [180.3, 76.4], [164.5, 63.2], [173.0, 60.9], 
						[183.5, 74.8], [175.5, 70.0], [188.0, 72.4], [189.2, 84.1], [172.8, 69.1], 
						[170.0, 59.5], [182.0, 67.2], [170.0, 61.3], [177.8, 68.6], [184.2, 80.1], 
						[186.7, 87.8], [171.4, 84.7], [172.7, 73.4], [175.3, 72.1], [180.3, 82.6], 
						[182.9, 88.7], [188.0, 84.1], [177.2, 94.1], [172.1, 74.9], [167.0, 59.1], 
						[169.5, 75.6], [174.0, 86.2], [172.7, 75.3], [182.2, 87.1], [164.1, 55.2], 
						[163.0, 57.0], [171.5, 61.4], [184.2, 76.8], [174.0, 86.8], [174.0, 72.2], 
						[177.0, 71.6], [186.0, 84.8], [167.0, 68.2], [171.8, 66.1], [182.0, 72.0], 
						[167.0, 64.6], [177.8, 74.8], [164.5, 70.0], [192.0, 101.6], [175.5, 63.2], 
						[171.2, 79.1], [181.6, 78.9], [167.4, 67.7], [181.1, 66.0], [177.0, 68.2], 
						[174.5, 63.9], [177.5, 72.0], [170.5, 56.8], [182.4, 74.5], [197.1, 90.9], 
						[180.1, 93.0], [175.5, 80.9], [180.6, 72.7], [184.4, 68.0], [175.5, 70.9], 
						[180.6, 72.5], [177.0, 72.5], [177.1, 83.4], [181.6, 75.5], [176.5, 73.0], 
						[175.0, 70.2], [174.0, 73.4], [165.1, 70.5], [177.0, 68.9], [192.0, 102.3], 
						[176.5, 68.4], [169.4, 65.9], [182.1, 75.7], [179.8, 84.5], [175.3, 87.7], 
						[184.9, 86.4], [177.3, 73.2], [167.4, 53.9], [178.1, 72.0], [168.9, 55.5], 
						[157.2, 58.4], [180.3, 83.2], [170.2, 72.7], [177.8, 64.1], [172.7, 72.3], 
						[165.1, 65.0], [186.7, 86.4], [165.1, 65.0], [174.0, 88.6], [175.3, 84.1], 
						[185.4, 66.8], [177.8, 75.5], [180.3, 93.2], [180.3, 82.7], [177.8, 58.0], 
						[177.8, 79.5], [177.8, 78.6], [177.8, 71.8], [177.8, 116.4], [163.8, 72.2], 
						[188.0, 83.6], [198.1, 85.5], [175.3, 90.9], [166.4, 85.9], [190.5, 89.1], 
						[166.4, 75.0], [177.8, 77.7], [179.7, 86.4], [172.7, 90.9], [190.5, 73.6], 
						[185.4, 76.4], [168.9, 69.1], [167.6, 84.5], [175.3, 64.5], [170.2, 69.1], 
						[190.5, 108.6], [177.8, 86.4], [190.5, 80.9], [177.8, 87.7], [184.2, 94.5], 
						[176.5, 80.2], [177.8, 72.0], [180.3, 71.4], [171.4, 72.7], [172.7, 84.1], 
						[172.7, 76.8], [177.8, 63.6], [177.8, 80.9], [182.9, 80.9], [170.2, 85.5], 
						[167.6, 68.6], [175.3, 67.7], [165.1, 66.4], [185.4, 102.3], [181.6, 70.5], 
						[172.7, 95.9], [190.5, 84.1], [179.1, 87.3], [175.3, 71.8], [170.2, 65.9], 
						[193.0, 95.9], [171.4, 91.4], [177.8, 81.8], [177.8, 96.8], [167.6, 69.1], 
						[167.6, 82.7], [180.3, 75.5], [182.9, 79.5], [176.5, 73.6], [186.7, 91.8], 
						[188.0, 84.1], [188.0, 85.9], [177.8, 81.8], [174.0, 82.5], [177.8, 80.5], 
						[171.4, 70.0], [185.4, 81.8], [185.4, 84.1], [188.0, 90.5], [188.0, 91.4], 
						[182.9, 89.1], [176.5, 85.0], [175.3, 69.1], [175.3, 73.6], [188.0, 80.5], 
						[188.0, 82.7], [175.3, 86.4], [170.5, 67.7], [179.1, 92.7], [177.8, 93.6], 
						[175.3, 70.9], [182.9, 75.0], [170.8, 93.2], [188.0, 93.2], [180.3, 77.7], 
						[177.8, 61.4], [185.4, 94.1], [168.9, 75.0], [185.4, 83.6], [180.3, 85.5], 
						[174.0, 73.9], [167.6, 66.8], [182.9, 87.3], [160.0, 72.3], [180.3, 88.6], 
						[167.6, 75.5], [186.7, 101.4], [175.3, 91.1], [175.3, 67.3], [175.9, 77.7], 
						[175.3, 81.8], [179.1, 75.5], [181.6, 84.5], [177.8, 76.6], [182.9, 85.0], 
						[177.8, 102.5], [184.2, 77.3], [179.1, 71.8], [176.5, 87.9], [188.0, 94.3], 
						[174.0, 70.9], [167.6, 64.5], [170.2, 77.3], [167.6, 72.3], [188.0, 87.3], 
						[174.0, 80.0], [176.5, 82.3], [180.3, 73.6], [167.6, 74.1], [188.0, 85.9], 
						[180.3, 73.2], [167.6, 76.3], [183.0, 65.9], [183.0, 90.9], [179.1, 89.1], 
						[170.2, 62.3], [177.8, 82.7], [179.1, 79.1], [190.5, 98.2], [177.8, 84.1], 
						[180.3, 83.2], [180.3, 83.2]]
    		}]

        @chart = Highchart.scatter({
          	:chart => {
  						:renderTo =>  'container', 
  						:zoomType =>  'xy'
  					},
  					:title =>  {
  						:text =>  'Height Versus Weight of 507 Individuals by Gender'
  					},
  					:subtitle =>  {
  						:text =>  'Source: Heinz  2003'
  					},
  					:x_axis =>  {
  						:title =>  {
  							:enabled =>  true,
  							:text =>  'Height (cm)'
  						},
  						:startOnTick =>  true,
  						:endOnTick =>  true,
  						:showLastLabel =>  true
  					},
  					:y_axis  =>  {
  						:title =>  {
  							:text =>  'Weight (kg)'
  						}
  					},
  					:tooltip =>  {
  						:formatter =>  "function() {
  				                return ''+
  								this.x +' cm, '+ this.y +' kg';
  						}"
  					},
  					:legend =>  {
  						:layout =>  'vertical',
  						:align =>  'left',
  						:verticalAlign =>  'top',
  						:x =>  100,
  						:y =>  70,
  						:backgroundColor =>  '#FFFFFF',
  						:borderWidth =>  1
  					},
  					:plotOptions =>{
  						:scatter =>  {
  							:marker =>  {
  								:radius =>  5,
  								:states =>  {
  									:hover =>  {
  										:enabled =>  true,
  										:lineColor =>  'rgb(100,100,100)'
  									}
  								}
  							},
  							:states =>  {
  								:hover =>  {
  									:marker =>  {
  										:enabled =>  false
  									}
  								}
  							}
  						}
  					},
    				:series => chart_data 
            })
  end

end

import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	id: control
		
	property string label
	property string key
	
	Text { text: "X angle" }
	Slider {
		from: parseFloat(vsh.config("Limits/" + control.key.split('/')[0] + "_" + control.key.split('/')[1] + "Min"))
		to: parseFloat(vsh.config("Limits/" + control.key.split('/')[0] + "_" + control.key.split('/')[1] + "Max"))
	
		onValueChanged: {
			console.log("Limits/" + control.key.split('/')[0] + "_" + control.key.split('/')[1] + "Min")
			vsh.setConfig(control.key, value);
		}
		
		Text { 
			width: parent.width; 
			text: Math.round(parent.value)
			horizontalAlignment: Qt.AlignHCenter
		}
	}
}

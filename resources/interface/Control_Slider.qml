import QtQuick 2.15
import QtQuick.Controls 2.15

Row {
	id: control
	spacing: 10

	property string label
	property string key

	Text { text: control.label }
	Slider {
		id: slider
		from: parseFloat(vsh.config("Limits/" + control.key.split('/')[0] + "_" + control.key.split('/')[1] + "Min"))
		to: parseFloat(vsh.config("Limits/" + control.key.split('/')[0] + "_" + control.key.split('/')[1] + "Max"))

		onValueChanged: vsh.setConfig(control.key, value)
	}
	Text {
		width: parent.width
		text: Math.round(slider.value)
	}
}

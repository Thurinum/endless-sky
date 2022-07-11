import QtQuick 2.15
import QtQuick.Controls 2.15

Row {
	id: control
	spacing: 10

	property string label
	property string key
	property point range: vsh.getRange(key)

	Text { text: control.label }
	Slider {
		id: slider
		from: range.x
		to: range.y
		stepSize: 1
		value: slider.value = parseInt(vsh.config(control.key));

		onValueChanged: vsh.setConfig(control.key, value)
	}
	Text {
		width: parent.width
		text: Math.round(slider.value)
	}
}

import QtQuick 2.15
import QtQuick.Controls 2.15

CheckBox {
	id: checkbox

	property string label
	property string key

	text: label
	checked: vsh.config(key)

	onCheckStateChanged: vsh.setConfig(key, checked);
}


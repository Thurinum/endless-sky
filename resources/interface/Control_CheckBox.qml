import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
	id: control
	
	property string label
	property string key
	
	CheckBox {
		text: control.label
		// checked: vsh.config(control.key);
		
		onCheckStateChanged: {
			vsh.setConfig(control.key, checked);
		}
	}
}		

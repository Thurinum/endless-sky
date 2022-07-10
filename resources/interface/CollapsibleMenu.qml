import QtQuick 2.15
import Qt5Compat.GraphicalEffects


import "./" as Visihaut

Rectangle {
	id: hud
	color: Qt.rgba(0.6, 0.6, 0.6, 0.6)
	width: hudLayout.width
	height: hudLayout.height
	radius: 5
	
	Column {
		id: hudLayout
		spacing: 10
		padding: 10
		
		width: 200
		height: 1024
		
		Visihaut.Control_Slider {
			width: 100
			height: 100
			label: "Max clouds"
			key: "Main/iMaxClouds"
		}
		
		Visihaut.Control_CheckBox {
			width: 100
			height: 100
			label: "Hide clouds"
			key: "Main/bHideClouds"
		}
	}
}

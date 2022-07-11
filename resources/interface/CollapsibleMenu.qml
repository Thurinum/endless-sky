import QtQuick 2.15
import Qt5Compat.GraphicalEffects


import "./" as Visihaut

Rectangle {
	id: hud
	color: "white"
	width: 200
	height: hudLayout.implicitHeight
	radius: 5
	
	Column {
		id: hudLayout
		spacing: 10
		padding: 10
		
		Visihaut.Control_Slider {
			width: hud.width
			label: "Max clouds"
			key: "Main/iMaxClouds"
		}
		
		Visihaut.Control_CheckBox {
			width: hud.width
			label: "Show clouds"
			key: "Main/bShowClouds"
		}
	}
}

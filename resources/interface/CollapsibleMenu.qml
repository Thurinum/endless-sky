import QtQuick 2.15
import Qt5Compat.GraphicalEffects


import "./" as Visihaut

Rectangle {
	id: hud
	color: "white"
	width: 250
	height: hudLayout.implicitHeight
	radius: 5
	
	Column {
		id: hudLayout
		spacing: 10
		padding: 10
		
		Visihaut.Control_Slider {
			width: hud.width
			label: "Min cloud speed"
			key: "Clouds/iMinSpeed"
		}

		Visihaut.Control_Slider {
			width: hud.width
			label: "Max cloud speed"
			key: "Clouds/iMaxSpeed"
		}

		Visihaut.Control_Slider {
			width: hud.width
			label: "Min clouds"
			key: "Clouds/iMinSpawn"
		}

		Visihaut.Control_Slider {
			width: hud.width
			label: "Max clouds"
			key: "Clouds/iMaxSpawn"
		}
		
		Visihaut.Control_CheckBox {
			width: hud.width
			label: "Spawn clouds"
			key: "Clouds/bSpawn"
		}
	}
}

import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import Qt5Compat.GraphicalEffects
import Qt.labs.settings 1.0
import "./" as Visihaut

Flickable {
	id: root
	
	property int numClouds: 0
	property real lightness: sun.getLightness()
	scale: 1.1
	
	Rectangle {
		id: sky
		
		z: 0
		
		width: vsh_viewSize
		height: vsh_viewSize

		color: Qt.hsla(0.55, 1, parent.lightness, 1.0);
	}
	
	Visihaut.Terrain {
		start: Qt.point(0, 100)
		
		width: sky.width
		height: sky.height / 2
		x: 0
		y: 1024
	}
	
	Image {
		id: sun
		x: -100
		y: 200
		z: 1
		
		width: parseInt(vsh.config("Main/iAstralDiameter"))
		height: parseInt(vsh.config("Main/iAstralDiameter"))
		source: "../graphics/soleilz.png"
		
		property double sunangle: 0
		Timer {
			id: daytime
			running: true
			repeat: true
			interval: parseInt(vsh.config("Main/iSunSpeed"))
			
			// Taken from MDN docs
			function rand(min, max) {
				min = Math.ceil(min);
				max = Math.floor(max);
				return Math.floor(Math.random() * (max - min) + min);
			}
			
			onTriggered: {
				parent.sunangle++;
				
				// Shall we spawn a cloud?
				let rando = Math.random();
				if (sun.sunangle == 360) {
					parent.sunangle = 0;
				}
				
				if (sun.sunangle > 180) {
					sun.x = -100
				} else if (sun.sunangle > 45) {
					if (sun.x < 100)
						sun.x = sun.x + sun.sunangle / 100
				}
				
				let min = parseInt(vsh.config("Main/iMinClouds"));
				let max = parseInt(vsh.config("Main/iMaxClouds"));

				if (vsh.config("Main/bSpawnClouds") && (root.numClouds < min || (root.numClouds <= rando * max))) {
					createCloud();
					root.numClouds++;
				}
			}
			
		}

		transform: Rotation {
			id: sunrotation
			
			angle: sun.sunangle
			origin.x: vsh_viewSize / 2
			origin.y: vsh_viewSize / 2
			
		}
		
		// transitions: Transition {
		// 	NumberAnimation {
		// 		properties: "x"
		// 		duration: 1000
		// 		easing.type: Easing.InOutQuad
		// 	}
		// }
		//
		
		function getLightness() {
			let lightness;
			
			if (sun.sunangle <= 45)
				lightness = (0.01 * sun.sunangle)
			else if (sun.sunangle > 45 && sun.sunangle <= 90) {
				lightness = 1 - (0.01 * sun.sunangle);
				
			}
			else if (sun.sunangle > 90 && sun.sunangle <= 180)
				lightness = 0.1
			else
				lightness = 0.1


			return lightness;
		}
	}
	
	Image {
		id: moon
		x: -100
		y: 200
		z: 1
		
		width: parseInt(vsh.config("Main/iAstralDiameter"))
		height: parseInt(vsh.config("Main/iAstralDiameter"))
		source: "../graphics/moonz.png"
		
		Timer {
			id: nighttime
			running: true
			repeat: true
			interval: parseInt(vsh.config("Main/iSunSpeed"))
			
			onTriggered: {
				moonrotation.moonangle++;
				if (moonrotation.moonangle >= 360) {
					moonrotation.moonangle = 0;
				}
				
				if ( moonrotation.moonangle > 180) {
					// console.log(moonrotation.moonangle)
					moon.x = -100
				} else if (moonrotation.moonangle > 45) {
					if (moon.x < 100)
						moon.x = moon.x + moonrotation.moonangle / 100
				}
				// Shall we spawn a cloud?
				// let rand = Math.random();
				//
				// if (rand < 0.5 && root.numClouds <= parseInt(settings.value("Main/iMaxClouds"))) {
				// 	let cloud = createCloud();
				// 	root.numClouds++;
				// }
			}
		}
		
		transform: Rotation {
			id: moonrotation
			
			property double moonangle: 180
			
			angle: moonangle
			origin.x: vsh_viewSize / 2
			origin.y: vsh_viewSize / 2
			
		}
	}
	
	Visihaut.CollapsibleMenu {
		z: 10
	}
	
	// Instantiates a cloud from component
	function createCloud() {
		let obj;
		let component = Qt.createComponent("Cloud.qml");
		
		if (component.status === Component.Ready) {
			obj = component.createObject(root);
			
			if (obj === null)
				console.warn("Could not create cloud :(");
		} else if (component.status === Component.Error) {
			console.warn("Could not create cloud :(:\n"
					 + component.errorString());
		}
		
		return obj;
	}
	
}

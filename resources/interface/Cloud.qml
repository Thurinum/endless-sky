import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import Qt.labs.settings 1.0

// im running out of time so this code is a huge mess lol
Image {
	id: cloud
	
	property bool disabled: false;
	
	x: if (vsh_viewSize) vsh_viewSize
	y: rand(-height / 2, vsh_viewSize / 2 - height / 2)
	
	width: 300
	opacity: rand(0.5, 1.5)
	height: 200
	scale: rand(0.5, 1.3)
	source: "../graphics/nuagez.png"
	
	
	

	
	// transform: Translate {id: layoutParallax; x: -parent.parallax.x; y: -parent.parallax.y}
	
	Timer {
		id: movement
		running: true
		repeat: true
		interval: Math.ceil(rand(1, 100) / rand(parseInt(vsh.config("Main/iMinCloudSpeed")),
				   parseInt(vsh.config("Main/iMaxCloudSpeed"))))
		
		onTriggered: {
			if (cloud.x < -300 && !cloud.disabled) {
				cloud.parent.numClouds--;
				cloud.disabled = true;
			}
			
			cloud.x--;
		}
	}
	
	transitions: Transition {
		NumberAnimation {
			property: "x"
			duration: parseInt(vsh.config("Main/iRefreshInterval"))
			easing.type: Easing.InOutQuad
		}
	}
	
	// Taken from MDN docs
	function rand(min, max) {
		min = Math.ceil(min);
		max = Math.floor(max);
		return Math.floor(Math.random() * (max - min) + min);
	}
	
	Component.onCompleted: {
		z = Math.random() < 0.5 ? 0 : 2;
		rotation = Math.random() < 0.5 ? 0 : 180;
	}
}

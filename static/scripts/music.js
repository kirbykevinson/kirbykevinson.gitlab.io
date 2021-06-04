window.music = {
	toggle: function() {
		const
			container = document.querySelector(".music"),
			audio = container.querySelector("audio"),
			button = container.querySelector("button");
		
		if (audio.paused) {
			audio.play();
			
			button.querySelector(".play").hidden = true;
			button.querySelector(".pause").hidden = false;
			
			this.update();
		} else {
			audio.pause();
			
			button.querySelector(".play").hidden = false;
			button.querySelector(".pause").hidden = true;
		}
	},
	
	update: function() {
		const
			container = document.querySelector(".music"),
			audio = container.querySelector("audio");
		
		if (!audio.paused) {
			window.requestAnimationFrame(music.update);
		}
		
		container.style.setProperty("--progress",
			audio.currentTime / audio.duration * 100 + "%"
		);
	}
};

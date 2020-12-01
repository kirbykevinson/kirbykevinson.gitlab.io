const
	switcher = document.createElement("select"),
	
	stylesheets = document.querySelectorAll("link[rel=stylesheet]");

switcher.className = "theme-switcher";

for (const stylesheet of stylesheets) {
	const option = document.createElement("option");
	
	option.innerText = stylesheet.title;
	
	if (stylesheet.title == localStorage.getItem("theme")) {
		option.selected = true;
	}
	
	switcher.appendChild(option);
}

switcher.addEventListener("change", () => {
	for (const stylesheet of stylesheets) {
		if (stylesheet.title == switcher.value) {
			localStorage.setItem("theme", switcher.value);
			
			stylesheet.disabled = false;
		} else {
			stylesheet.disabled = true;
		}
	}
});

switcher.dispatchEvent(new Event("change"));

document.body.appendChild(switcher);

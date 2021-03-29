const
	switcher = document.createElement("select"),
	
	stylesheets = document.querySelectorAll("link[rel=stylesheet]");

switcher.className = "theme-switcher";

let
	savedStyleExists = false,
	
	defaultStyle = null,
	savedStyle = localStorage.getItem("theme");

for (const stylesheet of stylesheets) {
	const option = document.createElement("option");
	
	option.innerText = stylesheet.title;
	
	switcher.appendChild(option);
	
	if (!stylesheet.disabled) {
		defaultStyle = stylesheet.title;
	}
	
	if (stylesheet.title == savedStyle) {
		savedStyleExists = true;
	}
}

if (!savedStyleExists) {
	savedStyle = null;
}

if (savedStyle) {
	switcher.value = savedStyle;
} else {
	switcher.value = defaultStyle;
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

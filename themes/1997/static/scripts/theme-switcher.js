const
	themes = [
		"1991",
		"1997",
		"2019"
	],
	
	defaultTheme = "1997",
	savedTheme = localStorage.getItem("theme"),
	
	stylesheet = document.querySelector(`#main-stylesheet`),
	switcher = document.createElement("select");

switcher.className = "theme-switcher";

for (const theme of themes) {
	const option = document.createElement("option");
	
	option.innerText = theme;
	
	switcher.appendChild(option);
}

if (themes.includes(savedTheme)) {
	switcher.value = savedTheme;
} else {
	switcher.value = defaultTheme;
}

switcher.addEventListener("change", () => {
	stylesheet.href = `/styles/${switcher.value}.css`;
	
	localStorage.setItem("theme", switcher.value);
});

switcher.dispatchEvent(new Event("change"));

document.body.appendChild(switcher);

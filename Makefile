all: public/generated/all.css public/generated/all.js

public/generated/all.js: elm/*.elm
	elm-make elm/main.elm --yes --output public/generated/all.js

public/generated/all.css: sass/*.sass
	sass sass/main.sass public/generated/all.css

clean:
	rm -f public/generated/*
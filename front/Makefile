build:
	flutter build web --release

deploy: build
	sudo rm -rf /var/www/*
	sudo cp -r build/web/* /var/www/
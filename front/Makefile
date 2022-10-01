comp:
	#rm -rf build/web
	flutter build web --release

deploy: comp
	sudo rm -rf /var/www/*
	sudo cp -r build/web/* /var/www/
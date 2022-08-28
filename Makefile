invoice_init:
	 flutter pub get packages  && flutter pub run build_runner build --delete-conflicting-outputs && cd packages/pax_api_client && flutter pub get packages && flutter pub run build_runner build --delete-conflicting-outputs

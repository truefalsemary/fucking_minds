# Get all the dependencies
deps:
	flutter pub get

# For fast fixes of formatting/linter
fix:
	dart fix --apply

# For build model automation 
build_models:
	dart run build_runner build --delete-conflicting-outputs

# For fast generating l10n
l10n:
	flutter gen-l10n

# Start fixing and building everything
all:
	make deps
	make fix
	make build_models
	make l10n
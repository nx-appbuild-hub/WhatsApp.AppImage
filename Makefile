SOURCE="https://zerkc.gitlab.io/whatsdesk/whatsdesk_0.3.3_amd64.deb"
DESTINATION="build.deb"
OUTPUT="WhatsApp.AppImage"

# https://zerkc.gitlab.io/whatsdesk/

all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)

	dpkg -x $(DESTINATION) build
	rm -rf AppDir/opt

	mkdir --parents AppDir/opt/application
	cp -r build/opt/whatsdesk/* AppDir/opt/application

	chmod +x AppDir/AppRun

	export ARCH=x86_64 && bin/appimagetool.AppImage AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf build

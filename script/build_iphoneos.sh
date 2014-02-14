PROJECT_NAME=${PROJECT_NAME:-your_project}
TARGET_SDK=iphoneos
RELEASE_BUILDDIR=build/Release-iphoneos
APPLICATION_NAME=${PROJECT_NAME}
DEVELOPER_NAME=${DEVELOPER_NAME:-invalid_signature}
PROVISONING_PROFILE=${RELEASE_BUILDDIR}/${APPLICATION_NAME}.app/embedded.mobileprovision

xcodebuild -target "${PROJECT_NAME}" -sdk "${TARGET_SDK}" -configuration Release
/usr/bin/xcrun -sdk "${TARGET_SDK}" PackageApplication -v "${RELEASE_BUILDDIR}/${APPLICATION_NAME}.app" -o "`pwd`/ipas/${APPLICATION_NAME}.ipa" --sign "${DEVELOPER_NAME}" --embed "${PROVISONING_PROFILE}"

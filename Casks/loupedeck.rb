cask 'loupedeck' do
  version '3.2'
  sha256 '28b525df08e61f24e52900fd514043a8e0b6ae05dcac8e43a1e5a2d5c69f6bc0'

  # loupedeck-software-release.s3.amazonaws.com was verified as official when first introduced to the cask
  url "https://loupedeck-software-release.s3.amazonaws.com/Loupedeck+Software+version+#{version}/Loupedeck+#{version}.dmg"
  name 'Loupdeck'
  homepage 'https://loupedeck.com/'

  depends_on macos: '>= :sierra'

  pkg "Loupedeck Installer #{version}.pkg"

  uninstall signal:  [
                       ['TERM', 'com.loupedeck.Loupedeck2'],
                       ['QUIT', 'com.loupedeck.Loupedeck2'],
                       ['INT', 'com.loupedeck.Loupedeck2'],
                       ['HUP', 'com.loupedeck.Loupedeck2'],
                       ['KILL', 'com.loupedeck.Loupedeck2'],
                     ],
            pkgutil: [
                       'com.loupedeck.PluginPackageInstaller',
                       'com.loupedeck.ImageLibraryInstaller',
                       'com.loupedeck.LoupedeckPackageInstaller',
                     ],
            delete:  [
                       '~/Library/Application Support/Capture One/KeyboardShortcuts/Loupedeck_beta.plist',
                       '~/Library/Application Support/Adobe/CameraRaw/Settings/Loupedeck - Loke Roos',
                       '~/Library/Application Support/Adobe/CameraRaw/Settings/Loupedeck - Karo Holmberg',
                       '~/Library/Application Support/Adobe/Lightroom/Export Presets/Loupedeck Exports',
                       '~/Library/Application Support/Adobe/Lightroom/Modules/loupedeck2.lrplugin',
                       '~/Library/Application Support/LoupedeckConfig',
                       '~/Library/Logs/LoupedeckConfig',
                     ]
end

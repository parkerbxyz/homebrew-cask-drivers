cask 'behringer-x32-edit' do
  # note: "32" is not a version number, but an intrinsic part of the product name
  version '4.1'
  sha256 'a4eb8aa7c45a1266f928d3b2ab44ef274e1750e91754fe6eada122ccd0f5f093'

  # downloads.musictribe.com was verified as official when first introduced to the cask
  url "https://downloads.musictribe.com/software/behringer/X32/X32-Edit_MAC_#{version}.zip"
  appcast 'https://www.behringer.com/Categories/Behringer/Mixers/Digital/X32/p/P0ASF/Downloads'
  name 'Behringer X32-Edit'
  homepage 'https://www.behringer.com/Categories/Behringer/Mixers/Digital/X32/p/P0ASF/'

  app 'X32-Edit.app'

  uninstall quit:   'com.music-group.X32-Edit',
            delete: '/Library/Logs/DiagnosticReports/X32-Edit_*.wakeups_resource.diag'

  zap trash: [
               '~/Library/Application Support/CrashReporter/X32-Edit_*.plist',
               '~/Library/Saved Application State/com.music-group.X32-Edit.savedState',
             ]
end

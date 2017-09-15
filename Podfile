# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

def my_pods
    pod 'SnapKit'
    pod 'ObjectMapper'
    pod 'Reusable'
end

target 'INGTodayWidget' do
    use_frameworks!
    my_pods
end

target 'INGVVL' do
  use_frameworks!
  my_pods

  abstract_target 'Tests' do
      target "INGVVLTests"
      pod 'Quick'
      pod 'Nimble'
  end

end

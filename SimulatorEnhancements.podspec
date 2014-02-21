Pod::Spec.new do |s|
  s.name         = 'SimulatorEnhancements'
  s.version      = '0.0.0'
  s.summary      = 'Does awesome stuff'
  s.author = {
    'Colin Eberhardt' => 'colin.eberhardt@gmail.com'
  }
  s.source = {
    :git => 'https://github.com/ColinEberhardt/LinqToObjectiveC.git',
    :tag => '0.0.0'
  }
  s.license      = {
    :type => 'MIT',
    :file => 'MIT-LICENSE.txt'
  }
  s.source_files = '*.{h,m}'
  s.homepage = 'https://github.com/ColinEberhardt/LinqToObjectiveC'
  s.requires_arc = true
end

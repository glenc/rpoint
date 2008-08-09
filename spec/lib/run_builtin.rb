require 'Find'

ARGV.each do |type|
  Find.find "core/#{type}" do |path|
    if ( /_svn/ =~ path )
      Find.prune
    end
    if ( /_spec\.rb/ =~ path ) then
      print path, '(ruby): '
      system("ruby #{path}")
      puts
      print path, '(ir): '
      system("..\\..\\..\\..\\Bin\\Debug\\ir.cmd #{path}")
      puts
    end
  end
end

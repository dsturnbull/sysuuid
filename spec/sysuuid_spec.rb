require 'rubygems'
require 'should_be_faster'
require 'tempfile'
require 'ext/sysuuid'

describe SysUUID do
  it 'should create a uuid' do
    sysuuid.should be_instance_of String
  end

  it 'should create unique uuids' do
    sysuuid.should_not == sysuuid
  end

  it 'should not repeat for reasonable counts' do
    1000.times.map { sysuuid }.uniq.length.should == 1000
  end

  it 'should be faster than `uuidgen`' do
    shell = lambda { `uuidgen` }
    ext   = lambda { sysuuid }
    ext.should be_at_least(2000).times.faster_than(shell)
  end
end

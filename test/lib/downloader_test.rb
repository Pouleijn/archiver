require 'test_helper'

describe Archiver::Downloader do
  subject { Archiver::Downloader.new }
  
  describe "#download" do
    let(:remote_file) { 'http://example.com/10mb.bin.zip' }
    let(:save_to) { '10mb.bin.zip' }

    before do
      stub_request(:get, "http://example.com/10mb.bin.zip?").
        with(:headers => 
          { 'Accept'=>'*/*', 
            'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 
            'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => "", :headers => {})
      
      @response = subject.download(remote_file, save_to)
    end
    
    it "should be saved to the given directory" do
      assert FileTest.exists?(save_to)
    end
    
    it "should return true when file is successfully downloaded and saved" do
      assert_equal true, @response
    end
  end  
end
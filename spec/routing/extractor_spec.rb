describe LieutenantGovernor::Routing::Extractor do

  describe '.extract' do

    subject { LieutenantGovernor::Routing::Extractor }
    let(:mock) { double(Object) }

    it 'creates an instance of an extractor' do
      expect(subject).to receive(:new).and_return(mock)
      expect(mock).to receive(:extract)
      subject.extract({})
    end

  end

  describe '#extract' do

    let(:routes) { { mockRoutes: 'path/to/somewhere' } }

    context 'when there are blank strings as keys' do

      subject { LieutenantGovernor::Routing::Extractor.new routes }

      before do
        expect(subject).to receive(:get_path).and_return('')
        expect(subject).to receive(:get_name).and_return('mockRoutes')
      end

      it 'skips the blank key' do
        resp = subject.extract
        expect(resp.keys.count).to eql(0)
      end
    end

    context 'when there are no blank strings as keys' do

      let(:routes) { { mockRoutes: 'path/to/somewhere' } }

      subject { LieutenantGovernor::Routing::Extractor.new routes }

      before do
        expect(subject).to receive(:get_path).and_return('/path/to/route')
        expect(subject).to receive(:get_name).and_return('mockRoutes')
      end

      it 'skips the blank key' do
        resp = subject.extract
        expect(resp.keys.count).to eql(1)
      end
    end
  end
end

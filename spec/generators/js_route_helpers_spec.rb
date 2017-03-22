require "spec_helper"

describe LieutenantGovernor::Generators::JsRouteHelpers do

  subject { LieutenantGovernor::Generators::JsRouteHelpers }

  context 'when there are invalid arguments' do

    it 'raises an error' do
      expect {
        subject.generate_paths_file(0)
      }.to raise_error(TypeError)
    end
  end

  context 'when the arguments are valid' do

    let(:args) { '/path/to/nowhere' }

    context 'when Rails is available' do

      let(:rails_mock) {
        o = double(Object)
        o.stub_chain(:application, :routes, :routes).and_return({})
        o
      }

      before do
        subject.const_set('Rails', rails_mock)
        expect(File).to receive(:open).with(args, 'w')
      end

      it 'opens a file in write mode' do
        subject.generate_paths_file(args)
      end
    end
  end

end

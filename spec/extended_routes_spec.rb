require 'spec_helper'

describe ExtendedRoutes do
  let(:routes) { Mocks::Routes.new }
  let(:base_url) { 'http://www.moogle.moo/' }
  before {
    ExtendedRoutes.init(routes)
    ExtendedRoutes.base_urls = { my_application: base_url }
  }

  describe '#base_urls=' do
    context 'When the base url does not have a trailing forward slash' do
      let(:base_url) { 'http://www.moogle.moo' }
      it 'does nothing to it' do
        expect(ExtendedRoutes.base_url(:my_application)).to eq 'http://www.moogle.moo'
      end
    end

    context 'When the base url has a trailing forward slash' do
      it 'strips the slash off the end' do
        expect(ExtendedRoutes.base_url(:my_application)).to eq 'http://www.moogle.moo'
      end
    end
  end

  describe '#get' do
    let(:path) { 'my_path' }
    let(:options) { { as: :my_things } }
    it 'sends #get to routes' do
      routes.should_receive(:get).with(path, options.merge(to: 'http://www.moogle.moo/my_path/'))

      ExtendedRoutes.get(:my_application, path, options)
    end

    it 'send #redirect to routes' do
      routes.should_receive(:redirect)

      ExtendedRoutes.get(:my_application, path, options)
    end

    context 'When the path is a root path' do
      let(:path) { '/' }
      it 'only has one trailing slash' do
        routes.should_receive(:get).with(path, to: 'http://www.moogle.moo/')

        ExtendedRoutes.get(:my_application, path)
      end
    end
  end

end

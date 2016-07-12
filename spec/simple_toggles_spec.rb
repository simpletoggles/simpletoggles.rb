require 'spec_helper'

describe SimpleToggles do
  it 'has a version number' do
    expect(SimpleToggles::VERSION).not_to be nil
  end

  describe '.enabled?' do
    context 'when ENABLED_TOGGLES is not set' do
      before(:each) do
        ENV['ENABLED_TOGGLES'] = nil
      end

      it 'returns false for any toggle' do
        expect(SimpleToggles.enabled? 'FOO').to eq(false)
        expect(SimpleToggles.enabled? 'BAR').to eq(false)
        expect(SimpleToggles.enabled? 'BAZ').to eq(false)
      end
    end

    context 'when ENABLED_TOGGLES are set' do
      before(:each) do
        ENV['ENABLED_TOGGLES'] = %w(FOO BAR).join(',')
      end

      it 'returns true for toggles that are in the ENABLED_TOGGLES list' do
        expect(SimpleToggles.enabled? 'FOO').to eq(true)
        expect(SimpleToggles.enabled? 'BAR').to eq(true)
        expect(SimpleToggles.enabled? 'BAZ').to eq(false)
      end
    end
  end
end

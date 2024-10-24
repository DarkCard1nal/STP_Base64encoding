# frozen_string_literal: true

require 'securerandom'
require 'base64'

RSpec.describe Base64encoding do # rubocop:disable Metrics/BlockLength
	it 'has a version number' do
		expect(Base64encoding::VERSION).not_to be nil
	end

	describe '.encode_base64' do
		it 'correctly encodes a string to Base64' do
			expect(Base64encoding.encode_base64('Hello, World!')).to eq('SGVsbG8sIFdvcmxkIQ==')
		end

		it 'correctly encodes a random string to Base64' do
			rstring = SecureRandom.alphanumeric(20)
			expect("#{Base64encoding.encode_base64(rstring)}\n").to eq(Base64.encode64(rstring).force_encoding('UTF-8'))
		end

		it 'handles empty strings' do
			expect(Base64encoding.encode_base64('')).to eq('')
		end
	end

	describe '.decode_base64' do
		it 'correctly decodes a Base64 string' do
			expect(Base64encoding.decode_base64('SGVsbG8sIFdvcmxkIQ==')).to eq('Hello, World!')
		end

		it 'correctly decodes a random Base64 string' do
			rstring = SecureRandom.base64(20)
			expect(Base64encoding.decode_base64(rstring)).to eq(Base64.decode64(rstring).force_encoding('UTF-8'))
		end

		it 'handles empty strings' do
			expect(Base64encoding.decode_base64('')).to eq('')
		end
	end
end

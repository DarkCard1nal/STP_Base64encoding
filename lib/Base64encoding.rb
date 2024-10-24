# frozen_string_literal: true

require_relative 'Base64encoding/version'
require_relative 'Base64encoding/constants'

# module Base64encoding
module Base64encoding
	class Error < StandardError; end

	# The method encodes the input string in base64, returns the result in UTF-8
	def self.encode_base64(input) # rubocop:disable Metrics/AbcSize
		return '' if input.empty?

		binary_string = input.bytes.map { |b| b.to_s(2).rjust(8, '0') }.join
		six_bit_groups = binary_string.scan(/.{1,6}/)
		six_bit_groups[-1] = six_bit_groups[-1].ljust(6, '0') if six_bit_groups[-1].size < 6
		encoded = six_bit_groups.map { |bits| Constants::BASE64_ALPHABET[bits.to_i(2)] }
		padding = 3 - (input.size % 3)
		encoded.join + (Constants::COMPLEMENTARY_CHARACTER * padding)
	end

	# The method decodes the encoded string from base64, returns the result in UTF-8
	def self.decode_base64(encoded)
		return '' if encoded.empty?

		encoded = encoded.gsub(Constants::COMPLEMENTARY_CHARACTER, '')
		binary_string = encoded.chars.map { |char| Constants::BASE64_ALPHABET.index(char).to_s(2).rjust(6, '0') }.join
		eight_bit_groups = binary_string.scan(/.{8}/)
		decoded_bytes = eight_bit_groups.map { |bits| bits.to_i(2) }
		decoded_bytes.pack('C*').force_encoding('UTF-8')
	end
end

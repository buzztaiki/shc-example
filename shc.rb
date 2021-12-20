# frozen_string_literal: true

require 'health_cards'
require 'yaml'

qr_text = ARGF.read.strip
jws_str = HealthCards::ChunkingUtils.qr_chunks_to_jws([qr_text])
jws = HealthCards::JWS.from_jws(jws_str)
payload = HealthCards::Payload.from_payload(jws.payload)
print payload.to_hash.to_yaml

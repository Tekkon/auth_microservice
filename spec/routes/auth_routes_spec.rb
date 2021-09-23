RSpec.describe AuthRoutes, type: :routes do
  describe 'POST /' do
    context 'missing token' do
      it 'returns an error' do
        post '/'

        expect(last_response.status).to eq 403
      end
    end

    context 'valid token' do
      let(:token) { 'jwt_token' }
      let(:user) { create(:user) }
      let(:user_session) { create(:user_session, user: user) }

      it 'returns status OK' do
        allow(JwtEncoder).to receive(:decode).and_return('uuid' => user_session.uuid)

        post '/', nil, { 'HTTP_AUTHORIZATION' => "Bearer #{token}" }

        expect(last_response.status).to eq 200
        expect(response_body['meta']).to include('user_id' => user.id)
      end
    end
  end
end

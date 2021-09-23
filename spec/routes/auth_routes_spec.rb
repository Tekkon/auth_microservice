RSpec.describe AuthRoutes, type: :routes do
  describe 'POST /v1/auth' do
    context 'missing token' do
      it 'returns an error' do
        post '/v1/auth'

        expect(last_response.status).to eq 403
      end
    end

    context 'valid token' do
      let(:token) { 'jwt_token' }
      let(:user) { create(:user) }
      let(:user_session) { create(:user_session, user: user) }

      it 'returns status OK' do
        allow(JwtEncoder).to receive(:decode).and_return('uuid' => user_session.uuid)

        post '/v1/auth', nil, { 'HTTP_AUTHORIZATION' => "Bearer #{token}" }

        expect(last_response.status).to eq 200
        expect(response_body['meta']).to include('user_id' => user.id)
      end
    end
  end

  describe 'POST /v1/signup' do
    context 'missing parameters' do
      it 'returns an error' do
        post '/v1/signup', name: 'bob', email: 'bob@example.com', password: ''

        expect(last_response.status).to eq 422
      end
    end

    context 'invalid parameters' do
      it 'returns an error' do
        post '/v1/signup', name: 'b.o.b', email: 'bob@example.com', password: 'givemeatoken'

        expect(last_response.status).to eq 422
      end
    end

    context 'valid parameters' do
      it 'returns created status' do
        post '/v1/signup', name: 'Bob', email: 'bob@example.com', password: 'givemeatoken'

        expect(last_response.status).to eq 201
      end
    end
  end

  describe 'POST /v1/login' do
    context 'missing parameters' do
      it 'returns an error' do
        post '/v1/login'

        expect(last_response.status).to eq 422
      end
    end

    context 'invalid parameters' do
      it 'returns an error' do
        post '/v1/login', email: 'bob@example.com', password: ''

        expect(last_response.status).to eq 422
        expect(response_body['errors']).to include('detail' => 'В запросе отсутствуют необходимые параметры')
      end
    end

    context 'valid parameters' do
      let(:token) { 'jwt_token' }

      before do
        create(:user, email: 'bob@example.com', password: 'givemeatoken')

        allow(JWT).to receive(:encode).and_return(token)
      end

      it 'returns created status' do
        post '/v1/login', email: 'bob@example.com', password: 'givemeatoken'

        expect(last_response.status).to eq 201
        expect(response_body['meta']).to eq('token' => token)
      end
    end
  end
end

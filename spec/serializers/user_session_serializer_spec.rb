RSpec.describe UserSessionSerializer do
  subject { described_class.new([user_session], links: links) }

  let(:user_session) { create(:user_session) }

  let(:links) do
    {
      first: '/path/to/first/page',
      last: '/path/to/last/page',
      next: '/path/to/next/page'
    }
  end

  let(:attributes) do
    user_session.values.select do |attr|
      %i[
        uuid
        user_id
      ].include?(attr)
    end
  end

  it 'returns user_session representation' do
    expect(subject.serializable_hash).to a_hash_including(
      data: [
        {
          id: user_session.id.to_s,
          type: :user_session,
          attributes: attributes
        }
      ],
      links: links
    )
  end
end

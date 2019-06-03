require 'account'

describe Account do

  describe '#initalize' do
    it 'has a balance of zero' do
      account = Account.new
      expect(account.balance).to eq 0
    end
  end
end

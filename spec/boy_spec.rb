# coding: utf-8
require File.expand_path(File.dirname(__FILE__) + '/../bonus_drink')

describe Boy do
  let(:boy) { Boy.new }

  describe '#can_drink?' do
    context 'when he have no drink' do
      it 'he cannot drink' do
        expect(boy.can_drink?).to eq false
      end
    end
    context 'when he has drink' do
      before { boy.buy_drinks(1) }
      it 'he can drink' do
        expect(boy.can_drink?).to eq true
      end
    end
  end

  describe '#drink' do
    context 'when he has no drink' do
      it 'raise error' do
        expect { boy.drink }.to raise_error
      end
    end

    context 'when he has dirnk' do
      before { boy.buy_drinks(4) }

      it 'get 1 empty bottle' do
        expect { boy.drink }.to change(boy, :empty_bottle_count).by(1)
      end

      it 'loss 1 drink' do
        expect { boy.drink }.to change(boy, :drink_count).by(-1)
      end

      it 'up count that he drunk' do
        expect { boy.drink }.to change(boy, :drunk_count).by(1)
      end
    end
  end

  describe '#can_exchange' do
    before { boy.buy_drinks(4) }

    context 'when he has no empty bottle' do
      it 'he cannot exchange bottle to drink' do
        expect(boy.can_exchange?).to eq false
      end
    end
    context 'when he has a empty bottle' do
      before { boy.drink }

      it 'he cannot exchange bottle to drink' do
        expect(boy.can_exchange?).to eq false
      end
    end
    context 'when he has 2 empty bottles' do
      before do
        2.times { boy.drink }
      end

      it 'he cannot exchange bottle to drink' do
        expect(boy.can_exchange?).to eq false
      end
    end

    context 'when he has 3 empty bottles' do
      before do
        3.times { boy.drink }
      end

      it 'he can exchange bottle to drink' do
        expect(boy.can_exchange?).to eq true
      end
    end

    context 'when he has over 3 empty bottles' do
      before do
        4.times { boy.drink }
      end

      it 'he can exchange bottle to drink' do
        expect(boy.can_exchange?).to eq true
      end
    end
  end

  describe '#exchange' do
    before { boy.buy_drinks(4) }

    context 'when he has under 3 empty bottle' do
      before do
        2.times { boy.drink }
      end

      it 'raise error' do
        expect { boy.exchange }.to raise_error
      end
    end

    context 'when he has over 3 empty bottle' do
      before do
        4.times { boy.drink }
      end


      it 'get 1 drink' do
        expect { boy.exchange }.to change(boy, :drink_count).by(1)
      end

      it 'loss 3 empty bottles' do
        expect { boy.exchange }.to change(boy, :empty_bottle_count).by(-3)
      end
    end
  end
end


require 'spec_helper'

RSpec.describe PricingRule do
  let(:price) { 50 }
  let(:special) { Special.new(amount: 3, total_price: 130) }

  describe '#price_for' do
    context 'when there is special defined' do
      subject { described_class.new(unit_price: price, special: special).price_for(amount) }

      context 'when amount is zero' do
        let(:amount) { 0 }

        it 'calculates price correctly' do
          expect(subject).to eq(0)
        end
      end

      context 'when amount is less than special' do
        let(:amount) { 2 }

        it 'calculates price correctly' do
          expect(subject).to eq(100)
        end
      end

      context 'when amount is same as special' do
        let(:amount) { 3 }

        it 'calculates price correctly' do
          expect(subject).to eq(130)
        end
      end

      context 'when amount is higher than special' do
        let(:amount) { 4 }

        it 'calculates price correctly' do
          expect(subject).to eq(180)
        end
      end
    end

    context 'when there is no special defined' do
      subject { described_class.new(unit_price: price).price_for(amount) }

      context 'when amount is zero' do
        let(:amount) { 0 }

        it 'calculates price correctly' do
          expect(subject).to eq(0)
        end
      end

      context 'when amount is less than special' do
        let(:amount) { 2 }

        it 'calculates price correctly' do
          expect(subject).to eq(100)
        end
      end

      context 'when amount is same as special' do
        let(:amount) { 3 }

        it 'calculates price correctly' do
          expect(subject).to eq(150)
        end
      end

      context 'when amount is higher than special' do
        let(:amount) { 4 }

        it 'calculates price correctly' do
          expect(subject).to eq(200)
        end
      end
    end
  end
end

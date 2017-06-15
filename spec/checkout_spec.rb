require 'spec_helper'

RSpec.describe Checkout do
  describe '#total' do
    let(:rules) do
      {
        'A' => PricingRule.new(50, Special.new(amount: 3, total_price: 130)),
        'B' => PricingRule.new(30, Special.new(amount: 2, total_price: 45)),
        'C' => PricingRule.new(20),
        'D' => PricingRule.new(15),
      }
    end

    subject { described_class.new(rules) }

    context 'when there are no items' do
      it 'returns 0' do
        expect(subject.total).to eq(0)
      end
    end

    context 'when there are items' do
      context 'when dealing with same item' do
        before do
          amount.times do
            subject.scan('A')
          end
        end

        context 'when discount should not be applied' do
          context 'when there is one item' do
            let(:amount) { 1 }

            it 'calculates total correctly' do
              expect(subject.total).to eq(50)
            end
          end

          context 'when there are two items' do
            let(:amount) { 2 }

            it 'calculates total correctly' do
              expect(subject.total).to eq(100)
            end
          end
        end

        context 'when discount should be applied' do
          context 'when there are three items' do
            let(:amount) { 3 }

            it 'calculates total correctly' do
              expect(subject.total).to eq(130)
            end
          end

          context 'when there are four items' do
            let(:amount) { 4 }

            it 'calculates total correctly' do
              expect(subject.total).to eq(180)
            end
          end

          context 'when there are five items' do
            let(:amount) { 5 }

            it 'calculates total correctly' do
              expect(subject.total).to eq(230)
            end
          end

          context 'when there are six items' do
            let(:amount) { 6 }

            it 'calculates total correctly' do
              expect(subject.total).to eq(260)
            end
          end

        end
      end

      context 'when dealing with different items' do
        it 'calculates total correctly' do
          items = 'AAAB'
          items.split(//).each { |item| subject.scan(item) }
          expect(subject.total).to eq(160)
        end

        it 'calculates total correctly' do
          items = 'AAABB'
          items.split(//).each { |item| subject.scan(item) }
          expect(subject.total).to eq(175)
        end

        it 'calculates total correctly' do
          items = 'AAABBD'
          items.split(//).each { |item| subject.scan(item) }
          expect(subject.total).to eq(190)
        end

        it 'calculates total correctly' do
          items = 'DABABA'
          items.split(//).each { |item| subject.scan(item) }
          expect(subject.total).to eq(190)
        end
      end

      context 'when adding items incrementaly' do
        it 'calculates total correctly' do
          expect(subject.total).to eq(0)

          subject.scan('A')
          expect(subject.total).to eq(50)

          subject.scan('B')
          expect(subject.total).to eq(80)

          subject.scan('A')
          expect(subject.total).to eq(130)

          subject.scan('A')
          expect(subject.total).to eq(160)

          subject.scan('B')
          expect(subject.total).to eq(175)
        end
      end
    end
  end
end

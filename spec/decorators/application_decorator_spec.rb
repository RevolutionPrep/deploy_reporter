require 'spec_helper'

describe ApplicationDecorator do
  let(:model) { Object.new }

  describe '#id' do

    it 'returns the id of the decorated model' do
      model.stub(:id).and_return(1)
      @decorator = ApplicationDecorator.new(model)
      @decorator.id.should eql(model.id)
    end

  end

  describe '#to_view_id' do

    it 'returns the view id representation of the decorated model' do
      model.stub(:id).and_return(3)
      Object.stub(:model_name).and_return('Object')
      @decorator = ApplicationDecorator.new(model)
      @decorator.to_view_id.should eql("object-#{model.id}")
    end

  end

end

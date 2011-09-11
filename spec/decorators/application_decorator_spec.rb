require 'spec_helper'

describe ApplicationDecorator, '.id' do

  it 'returns the id of the decorated model' do
    @model = Object.new
    @model.stub(:id).and_return(1)
    @application_decorator = ApplicationDecorator.new(@model)
    @application_decorator.id.should eql(@model.id)
  end

end

describe ApplicationDecorator, '.to_view_id' do
  
  it 'returns the view id representation of the decorated model' do
    @model = Object.new
    @model.stub(:id).and_return(3)
    Object.stub(:model_name).and_return('Object')
    @application_decorator = ApplicationDecorator.new(@model)
    @application_decorator.to_view_id.should eql("object-#{@model.id}")
  end
  
end
shared_examples_for "a page with navigation chrome" do

  it 'has a link to the projects index' do
    page.should have_xpath("//a[@href='/projects' and contains(text(), 'Projects')]")
  end

  it 'has a link to the deployments index' do
    page.should have_xpath("//a[@href='/deployments' and contains(text(), 'Deployments')]")
  end

  it 'has a link to the incidents index' do
    page.should have_xpath("//a[@href='/incidents' and contains(text(), 'Incidents')]")
  end

end

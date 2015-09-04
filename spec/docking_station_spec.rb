require 'dockingstation'

describe DockingStation do
  
  describe '#release_bike' do
    it 'raises an error when there are no bikes available' do
      bike = Bike.new 
      bike.report_broken
      subject.dock bike
      expect { subject.release_bike }.to raise_error 'No bikes available'
    end

    it { is_expected.to respond_to(:release_bike) }

    it "releases working bikes" do
      subject.dock Bike.new
      bike = subject.release_bike
      expect(bike).to be_working
    end

    it { is_expected.to respond_to(:dock).with(1).argument }
  end

  describe '#dock' do
    it 'raises error when full' do
  		subject.capacity.times { subject.dock(Bike.new)}
  		expect { subject.dock(Bike.new).to raise_error 'Full'}
  	end
  
    # it "has a changable capacity" do
    # docking_station = DockingStation.new(10)
    # expect(docking_station.capacity).to eq(10)
    # end

    # it "has a default capacity" do
    # docking_station = DockingStation.new
    # expect(docking_station.capacity).to eq(20)
  end
end

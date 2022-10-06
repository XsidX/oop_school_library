require '../classes/classroom'

describe Classroom do

  classroom = Classroom.new(101)
  classroom1 = Classroom.new(102)

  it 'should create a classroom' do

    expect(Classroom.all.length).to eql(2)
    expect(Classroom.all[0].label).to eql(102)
    expect(Classroom.all[1].label).to eql(101)

  end
end
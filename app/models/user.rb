class User < ApplicationRecord
    has_secure_password
    has_many :moods, dependent: :destroy
 

    validates :password, length: { minimum: 6 }
    validates :username, presence: true 
    validates :username, uniqueness: true
    validates :username, length: { minimum: 4 }
    validates :email, presence: true
    validates :email, uniqueness: true
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    validates :firstName, presence: true
    validates :lastName, presence: true 

    def self.getslepthoursdata(id)
        hours_slept_array = []
        sleepinghoursdata = User.find_by(id: id).moods.select("hours_slept", "created_at").last(10)
        sleepinghoursdata.map{  |data| 
            hours_slept_array.push({label: data.created_at, y: data.hours_slept})
        }
        hours_slept_array
    end

    def self.getaverageslepthours(id)
        sleepinghoursdata = User.find_by(id: id).moods.average("hours_slept").round
    end

    def self.getAverageofallMoodlevels(id)
        user = User.find_by(id: id)

       depressedAverage = user.moods.average("depressed").round
       anxietyAverage = user.moods.average("anxiety").round
       irritabilityAverage = user.moods.average("irritability_level").round
       elevatedAverage = user.moods.average("elevated_level").round



       return {
            depressed: depressedAverage,
            anxiety: anxietyAverage,
            irritability_level: irritabilityAverage,
            elevated_level: elevatedAverage
       }
    end

    def self.getMoodData(id)
        mood_created_array = []
        mood_depressed_array = []
        mood_anxiety_array = []
        mood_irritability_array = []
        mood_elevated_array = []
        
        user = User.find_by(id: id)
        moodCreatedAt = user.moods.select("created_at").last(10)
        moodDepressedData = user.moods.select("depressed").last(10)
        moodAnxietyData = user.moods.select("anxiety").last(10)
        moodIrritabilityData = user.moods.select("irritability_level").last(10)
        moodElevatedData = user.moods.select("elevated_level").last(10)

        moodCreatedAt.map{|data| mood_created_array.push(data.created_at)}
        moodDepressedData.map{|data| mood_depressed_array.push(data.depressed)}
        moodAnxietyData.map{|data| mood_anxiety_array.push(data.anxiety)}
        moodIrritabilityData.map{|data| mood_irritability_array.push(data.irritability_level)}
        moodElevatedData.map{|data| mood_elevated_array.push(data.elevated_level)}

        return {
          createdDates:  mood_created_array, 
            depressedData: mood_depressed_array, 
            anxietyData: mood_anxiety_array, 
            irritabilityData: mood_irritability_array, 
            elevatedData: mood_elevated_array

        }   
    end


    def self.getDepressedMoodData(id)
        depressed_created_array = []
        mood_depressed_array = []
        user = User.find_by(id: id)
        moodCreatedAt = user.moods.select("created_at").last(10)
        moodDepressedData = user.moods.select("depressed").last(10)
        depressedAverage = user.moods.average("depressed").round

        moodCreatedAt.map{|data| depressed_created_array.push(data.created_at)}
        moodDepressedData.map{|data| mood_depressed_array.push(data.depressed)}

        return {
            createdDates: depressed_created_array,
            depressedData: mood_depressed_array,
            depressedAvg: depressedAverage
        }
    end

    def self.getAnxietyMoodData(id)
        anxiety_created_array = []
        mood_anxiety_array = []

        user = User.find_by(id: id)
        moodCreatedAt = user.moods.select("created_at").last(10)
        moodAnxietyData = user.moods.select("anxiety").last(10)
        anxietyAverage = user.moods.average("anxiety").round

        moodCreatedAt.map{|data| anxiety_created_array.push(data.created_at)}
        moodAnxietyData.map{|data| mood_anxiety_array.push(data.anxiety)}

        return {
            createdDates: anxiety_created_array,
            anxietyData: mood_anxiety_array,
            anxietyAvg: anxietyAverage

        }
    end

    def self.getIrritabilityMoodData(id)
        irritability_created_array = []
        mood_irritability_array = []

        user = User.find_by(id: id)
        moodCreatedAt = user.moods.select("created_at").last(10)
        moodIrritabilityData = user.moods.select("irritability_level").last(10)
        irritabilityAverage = user.moods.average("irritability_level").round

        moodCreatedAt.map{|data| irritability_created_array.push(data.created_at)}
        moodIrritabilityData.map{|data| mood_irritability_array.push(data.irritability_level)}

        return {
            createdDates: irritability_created_array,
            irritabilityData: mood_irritability_array,
            irritabilityAvg: irritabilityAverage
        }

    end


    def self.getElevatedMoodData(id)
        elevated_created_array = []
        mood_elevated_array = []

        user = User.find_by(id: id)
        moodCreatedAt = user.moods.select("created_at").last(10)
        moodElevatedData = user.moods.select("elevated_level").last(10)
        elevatedAverage = user.moods.average("elevated_level").round

        moodCreatedAt.map{|data| elevated_created_array.push(data.created_at)}
        moodElevatedData.map{|data| mood_elevated_array.push(data.elevated_level)}


        return {
            createdDates: elevated_created_array,
            elevatedData: mood_elevated_array,
            elevatedAvg: elevatedAverage
        }
    end

end


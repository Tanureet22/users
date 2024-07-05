class AboutController < ApplicationController
    def index
        @data_sources = [
          { name: 'Users CSV', description: 'CSV file containing users data.' },
          { name: 'Faker Gem', description: 'Gem used to generate fake data for languages.' }
        ]
      end
end

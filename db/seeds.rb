# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PROJECTS_LIST = [
    {
      name: 'Amazon',
      description: 'Amazon clone app',
      tech_stack: ['React', 'Redux', 'Firebase', 'Google Cloud Platforms'],
    },
    {
      name: 'URL Shortener',
      description: 'URL Shortener app',
      tech_stack: ['NodeJs', 'PostgreSQL', 'Docker', 'Bootstrap'],
    },
    {
      name: 'Martian Library',
      description: 'Evil Martians app',
      tech_stack: ['Ruby', 'Ruby on Rails', 'PostgreSQL', 'GraphQL'],
    },
    {
      name: 'Covid-19 Tracker',
      description: 'Covid-19 Tracker app',
      tech_stack: ['VueJs', 'Open Disease Data API', 'Leaflet library'],
    },
    {
      name: 'AirBnb',
      description: 'AirBnb clone app',
      tech_stack: ['VueJs', 'NuxtJs', 'JavaScript', 'Netlify'],
    },
    {
      name: 'Amazon Price Tracker',
      description: 'Amazon Price Tracker app',
      tech_stack: ['Python', 'Django', 'PostgreSQL', 'Celery'],
    },
    {
      name: 'Inventory Manager',
      description: 'Inventory Manager app',
      tech_stack: ['Python', 'Flask', 'PostgreSQL', 'Bootstrap', 'Sass'],
    },
    {
      name: 'Bolt',
      description: 'Bolt is an open source orchestration tool that automates the manual work it takes to maintain your infrastructure on an as-needed basis or as part of a greater orchestration workflow.',
      tech_stack: ['Ruby', 'Ruby on Rails', 'Rspec', 'Puppet'],
    },
  ].freeze
  
  Project.create(PROJECTS_LIST)
require 'rubygems'
require 'mongo'
include Mongo

class PagesController < ApplicationController
  def home
    client = Mongo::Client.new(['127.0.0.1:27017'], :database => "gfile")
    coll = client[:directory]
    @coll_directory = coll.find()
  end
end

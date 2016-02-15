require 'rubygems'
require 'mongo'
include Mongo

class PagesController < ApplicationController
  def home
    client = Mongo::Client.new(['127.0.0.1:27017'], :database => "gfile")
    coll_directory = client[:directory]
    coll_file = client[:file]
    @coll_directory = coll_directory.find()
    @coll_file = coll_file.find() 
 end
end

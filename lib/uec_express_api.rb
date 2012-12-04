require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'json'
require "uec_express_api/version"

class UECExpressApi

  attr_accessor  :updated, :express

  @@debug = true
  def initialize()

    @updated = ""
    @express = Array.new
    parse_UEC_express()
  end

  def to_hash
      {
          :express => @express,
          :updated => @updated
      }
  end

  def to_json(*args)
      to_hash().to_json(*args)
  end

  def to_s()
    puts "-------------------------------------------------------------"
    puts "| class | data | time | subject | staff | remark |"
    @express.each do |ex|
        puts "| " + ex[:class].to_s + " | " + ex[:data].to_s + " | " + ex[:data].to_s + " | " + ex[:subject].to_s + " | " + ex[:staff].to_s + " | " + ex[:remark].to_s + " |"
    end
    puts "Last Updated :" + @updated
    puts "-------------------------------------------------------------"
  end

  private

  def parse_UEC_express()
    url="http://kyoumu.ofFICE.uec.ac.jp/kyuukou/kyuukou.html"
    puts "Getting URL="+url if @@debug
    doc = Hpricot(open(url,'User-Agent' => 'ruby'))
    express(doc.root)
    updated(doc.root)
  end

  def updated(doc)
      elements = doc/:p
      if elements
          @updated = elements.last.inner_html
      end
  end

  def express(doc)
     express_pass = [:class, :data, :time, :subject, :staff, :remark]
     (doc/:tr).each_with_index do |element, i|
         next if i == 0
         ex = {}
         (element/:td).each_with_index do |e, j|
            ex[express_pass[j]] = e.inner_html
         end
         @express << ex
     end
  end

end



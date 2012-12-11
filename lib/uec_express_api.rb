# Copyright 2012 by henteko (henteko07@gmail.com).
# All Rights Reserved.
#
# Permission is granted for use, copying, modification, distribution,
# and distribution of modified versions of this work as long as the
# above copyright notice is included.
# uec_express_api.rb

require 'rubygems'
require 'open-uri'
require 'hpricot'
require 'json'
require 'uec_express_api/version.rb'

BASE_URL = "http://kyoumu.office.uec.ac.jp/kyuukou/"
FACULTY  = "kyuukou.html"  #=> Faculty of Information
GS       = "kyuukou2.html" #=> Graduate school of Information

class UECExpressApi

    attr_accessor  :updated, :express

    @@debug = false
    def initialize(type=1)
        @updated = ""
        @express = Array.new
        parse(type)
    end

    def to_s
        puts "-------------------------------------------------------------"
        puts "| class | data | time | subject | staff | remark |"
        @express.each do |ex|
            puts "| " + ex[:class].to_s + " | " + ex[:data].to_s + " | " + ex[:data].to_s + " | " + ex[:subject].to_s + " | " + ex[:staff].to_s + " | " + ex[:remark].to_s + " |"
        end
        puts "Last Updated :" + @updated
        puts "-------------------------------------------------------------"
    end
    
    def create_faculty_url
        BASE_URL + FACULTY
    end

    def create_gs_url
        BASE_URL + GS
    end

    def to_hash
        {
            :express => @express,
            :updated => @updated
        }
    end

    private

    def parse(type=1)
        url = create_faculty_url

        if type != 1
            url = create_gs_url
        end

        puts "Getting URL="+url if @@debug

        doc = Hpricot(open(url,'User-Agent' => 'ruby'))
        parse_express(doc.root)
        parse_updated(doc.root)
    end
    
    def parse_updated(doc)
        elements = doc/:p
        if elements
            begin
                @updated = elements.last.inner_html.to_s.encode('utf-8', 'sjis')
            rescue
                @updated = elements.last.inner_html.to_s
            end
        end
    end

    def parse_express(doc)
        express_pass = [:class, :data, :time, :subject, :staff, :remark]
        (doc/:tr).each_with_index do |element, i|
            next if i == 0
            ex = {}
            (element/:td).each_with_index do |e, j|
                begin
                    ex[express_pass[j]] = e.inner_html.to_s.encode('utf-8', 'sjis')
                rescue
                    ex[express_pass[j]] = e.inner_html.to_s
                end
            end
            @express << ex
        end
    end

end

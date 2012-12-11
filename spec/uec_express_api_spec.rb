# _*_ coding: utf-8 _*_

require File.expand_path(File.join('.', 'spec_helper'), File.dirname(__FILE__))
require 'uec_express_api'

describe UECExpressApi, "UEC Express Api," do

    shared_examples_for "public check test" do

        it "create url check" do 
            base_url = "http://kyoumu.office.uec.ac.jp/kyuukou/"
            @uec_express.create_faculty_url.should == base_url + "kyuukou.html"
            @uec_express.create_gs_url.should == base_url + "kyuukou2.html"
        end

        it "check not empty for faculty(default)" do 
            @uec_express.updated.should_not == ""
            @uec_express.express.should_not be_empty
        end

        it "check not empty for faculty" do 
            @uec_express.updated.should_not == ""
            @uec_express.express.should_not be_empty
        end

        it "check not empty for gs" do 
            @uec_express.updated.should_not == ""
            @uec_express.express.should_not be_empty
        end

        it "check hash include express and updated for faculty(default)" do
            @uec_express.to_hash.should include :express
            @uec_express.to_hash.should include :updated
        end

        it "check hash include express and updated for faculty" do
            @uec_express.to_hash.should include :express
            @uec_express.to_hash.should include :updated
        end

        it "check hash include express and updated for gs" do
            @uec_express.to_hash.should include :express
            @uec_express.to_hash.should include :updated
        end
    end

    describe "defalt url," do
        before(:all) do
            @uec_express = UECExpressApi.new()
        end

        it_behaves_like "public check test"

    end

    describe "faculty url," do
        before(:all) do
            @uec_express = UECExpressApi.new(1)
        end

        it_behaves_like "public check test"

    end

    describe "gs url," do
        before(:all) do
            @uec_express = UECExpressApi.new(2)
        end

        it_behaves_like "public check test"

    end
end

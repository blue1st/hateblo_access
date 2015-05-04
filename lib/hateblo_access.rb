require "hateblo_access/version"
require 'nokogiri'
require 'capybara'
require 'capybara/poltergeist'
require 'terminal-notifier-guard'
require 'thor'
module HatebloAccess
  class CLI < Thor

    desc "login", "ログインする"
    options :user_id => :required
    options :password => :required
    def login ()
      Capybara.register_driver :poltergeist do |app|
        Capybara::Poltergeist::Driver.new(app, {:js_errors => false, :timeout => 1000 })
      end
      session = Capybara::Session.new(:poltergeist)
      
      session.visit "https://www.hatena.ne.jp/login"
      session.fill_in 'name', with: options[:user_id]
      session.fill_in 'password', with: options[:password]
      session.click_on "送信する"
      return session
    end

    desc "access", "タグからアクセス数を取得する"
    options :user_id => :required
    options :password => :required
    def access ()
      session = self.login()
      session.visit "http://blog.hatena.ne.jp/#{options[:user_id]}/#{options[:user_id]}.hateblo.jp/accesslog"
      page = Nokogiri::HTML.parse(session.html)
      access = page.css("#admin-main > section:nth-child(1) > div.main-box > table > tbody > tr.count > td:nth-child(1)").inner_text
      puts access
      return access
    end 

    desc "notification", "アクセス数を通知センターに通知する"
    options :user_id => :required
    options :password => :required
    def notification ()
      access_num = self.access()
      TerminalNotifier::Guard.notify access_num, :title => "はてなブログ：アクセス数", :open => "http://blog.hatena.ne.jp/#{options[:user_id]}/#{options[:user_id]}.hateblo.jp/accesslog"
    end
  end
end

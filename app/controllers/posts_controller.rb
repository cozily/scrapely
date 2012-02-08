require 'mechanize'

class PostsController < ApplicationController
  def index
    @potential_users = PotentialUser.all
  end

  def inbound
    Response.create(:email => params["sender"], :body => params["body-plain"])

    render :nothing => true
  end

  def scrape
    agent = Mechanize.new
    symbols = %w{ppa atq bar bik boo bks bfs} # sya zip fua for jwl mat rva spo tia tls wan art pta bab hab emd moa clo clt ela grd gms hsh mca msg pho tag vgm}

    symbols.each do |symbol|
      page = agent.get("http://newyork.craigslist.org/#{symbol}")
      links = page.search('blockquote p a')

      links.each do |link|
        title = link.text
        href = link.attributes.first.last.value
        if match = href.match(/\/(\d+).html/)
          external_id = match[1]
          unless Post.exists?(:external_id => external_id)
            page = agent.get(href) rescue nil
            if page
              post = Post.new(:external_id => external_id, :title => title, :href => href, :user => :finder)
              post_links = page.search('body.posting a:first-of-type')
              post_links.each do |post_link|
                post_link_href = post_link.attributes.first.last.value
                if email_match = post_link_href.match(/mailto:(.*)\?/)
                  post.email = email_match[1]
                end
              end
              post.save
            end
          end
        end
      end
    end
    redirect_to posts_path
  end

  def email_one_remailer_user
    post = Post.first(:conditions => {:contacted => false})
    first_name, last_name = Faker::Name.first_name, Faker::Name.last_name
    sender = "#{first_name.downcase}.#{last_name.downcase}@hydromu.com"

    PotentialUserMailer.inquiry(post.title, sender, first_name, last_name, "todd.persen@gmail.com").deliver
    post.update_attribute(:contacted, true)
  end
end

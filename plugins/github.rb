require 'cinch'
require 'json'
require 'net/http'

class GithubIssues

  BASEURL = "api.github.com"
  ORGANIZATION = ""
  USERNAME = ""
  PASSWORD = ""
  
  include Cinch::Plugin

  # !gh issue open <Repository> <Ticket_number>
  match(/bethoveen gh issue open ([^ ]+) (\d+)$/, method: :open_issue)
  def open_issue(m, repo, id)
    uri = "/repos/#{ORGANIZATION}/#{repo}/issues/#{id}"
    request(uri, Net::HTTP::Patch, '{"state": "open"}')
    m.reply "Opened issue %s/gh-%d" % [repo, id]
  end
  
  # !gh issue close <Repository> <Ticket_number>
  match(/beethoven gh issue close ([^ ]+) (\d+)$/, method: :close_issue)
  def close_issue(m, repo, id)
    uri = "/repos/#{ORGANIZATION}/#{repo}/issues/#{id}"
    request(uri, Net::HTTP::Patch, '{"state": "closed"}')
    m.reply "Closed issue %s/gh-%d" % [repo, id]
  end

  # <Repository> <search_string>
  # !beethoven gh issue search
  match(/beethoven gh issue search ([^ ]+) (.+)/, method: :search_issue)
  def search_issue(m, repo, query)
    #Search url
    uri = "/search/issues?q=#{URI.escape(query)}+repo:#{repo}+user:#{ORGANIZATION}" %
    res = request uri, Net:HTTP:Get

    # number of queries
    n = 3
    total = res["total_count"]
    if n > total then n = total end

    m.reply "Showing #{n} of #{total} tickets for #{query}:"

    res["total_count"][0...n].each_with_index do |issue, i|
      m.reply "#{issue[:number]} #{issue[:title]} #{issue[:html_url] #{issue[:state]}}"
    end
  end

  # <Repository>/gh-<Ticket-number>
  match(/[^ ]+\/gh-\d+/, method: :display_issue, use_prefix: false)
  def display_issue(m)
    m.message.scan(/([^ ]+)\/gh-(\d+)/) do |repo, id|
      uri = "/repos/#{ORGANIZATION}/#{repo}/issues/#{id}"
      issue = request(uri, Net::HTTP::Get)
      m.reply "[#{repo}/gh-#{id}] #{issue[:title]} (#{issue[:state]})"
    end
  end

end

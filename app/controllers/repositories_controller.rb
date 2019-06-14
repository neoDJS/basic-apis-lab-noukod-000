class RepositoriesController < ApplicationController

  def search

  end

  def github_search
    client_id = ""
    client_secret = ""

    @resp = Faraday.get 'https://api.github.com/search/repositories' do |req|
      req.params['client_id'] = client_id
      req.params['client_secret'] = client_secret
      req.params['q'] = params[:query]
    end

    body = JSON.parse(@resp.body)
    if @resp.success?
      @repos = body["items"]
    else
      @error = body["message"]
    end

<<<<<<< HEAD
    # rescue Faraday::ConnectionFailed
    #   @error = "There was a timeout. Please try again."
    # end

    # puts @repos.inspect
    render :search
=======
    rescue Faraday::ConnectionFailed
      @error = "There was a timeout. Please try again."
    end
    render 'search'
>>>>>>> 2e3ec431a7dd4b7759a383effbdd34f7d382639a
  end

end

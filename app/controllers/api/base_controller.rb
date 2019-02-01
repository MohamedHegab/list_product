class Api::BaseController < ApplicationController
  include Response
  include ExceptionHandler

  protect_from_forgery with: :null_session

  private
  def restrict_access_token
    unless restrict_access_by_api_token_header
      render_fail(t('text.invalid_api_key').titleize, 6)
    end
  end

  def restrict_access_by_api_token_header
    token = nil
    #check for token
    if request.headers['ApiKey'] && request.headers['ApiKey'].include?('key=')
      tokens = request.headers['ApiKey'].split(',')
      tokens.each do |line|
        token = line.slice(line.index('key=')+4..line.size)
        break if token
      end
    end
    if token && token.size >0
      token == 'key=1d7801c576b33db841d59216d8cf91d4'
    else
      false
    end

  end
end

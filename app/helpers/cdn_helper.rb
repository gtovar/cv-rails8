# app/helpers/cdn_helper.rb
module CdnHelper
  def cdn_asset(path)
    host = Rails.application.credentials.dig(:cdn, :host) || ENV["ASSET_HOST"] || ""
    "#{host}/#{path}"
  end
end

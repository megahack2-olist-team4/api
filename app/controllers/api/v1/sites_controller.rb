class Api::V1::SitesController < Api::BaseController
  before_action :set_site, only: [:show, :load]

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all

    options = {
      fields: { site: %i[name description url] },
      meta: {
        total: @sites.count,
      }
    }

    render({ json: Api::V1::SiteSerializer.new(@sites, options) })
  end

  # GET /sites/1
  # GET /sites/1.json
  def show
    render({ json: Api::V1::SiteSerializer.new(@site, { include: %i[questions] }) })
  end

  # PATCH /sites/1
  # PATCH /sites/1.json
  def load
    render({ json: Api::V1::SiteSerializer.new(@site, { include: %i[questions] }) })
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_site
      @site = Site.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def site_params
      params.fetch(:site, {})
    end
end

class LetsencryptController < ApplicationController
  def verify
    if params[:id] =='epZ8pqgvBJ1B2JIZFDgN1m7x1C0ecP4UrmJloTgL9hI'
      # www.summexplorer.com
      render text: 'epZ8pqgvBJ1B2JIZFDgN1m7x1C0ecP4UrmJloTgL9hI.HGKAemL2fUjIRadTuQf-sqPIqvo2JUZKqjZzg1u2D0U'
    end
  end
end

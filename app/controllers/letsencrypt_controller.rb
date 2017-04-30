class LetsencryptController < ApplicationController
  def verify
    if params[:id] == 'EWNb8sJjiJhgVnljjSN1iKfKogi-svHjTL_ZfW54ak0'
      # www.summexplorer.com
      render text: 'EWNb8sJjiJhgVnljjSN1iKfKogi-svHjTL_ZfW54ak0.HGKAemL2fUjIRadTuQf-sqPIqvo2JUZKqjZzg1u2D0U'
    end
  end
end

class LetsencryptController < ApplicationController
  def verify
    if params[:id] == '-Pk_eaIGfnFWuM5fv8n3t9kFCbM-EfjA-IqPO_PfVfE'
      # www.summexplorer.com
      render text: '-Pk_eaIGfnFWuM5fv8n3t9kFCbM-EfjA-IqPO_PfVfE.HGKAemL2fUjIRadTuQf-sqPIqvo2JUZKqjZzg1u2D0U'
    elsif params[:id] == 'I-OtiJzIqHtCb8BTNxv-HpUaaFprC8Y_MoFNADbXpqI'
      # summaexplorer.com
      render text: 'I-OtiJzIqHtCb8BTNxv-HpUaaFprC8Y_MoFNADbXpqI.HGKAemL2fUjIRadTuQf-sqPIqvo2JUZKqjZzg1u2D0U'
    end
  end
end

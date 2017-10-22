class BroadcastJob < ApplicationJob
  queue_as :default

  def perform(broadcast)
    ActionCable.server.broadcast 'broadcasts_channel', content: render_message(broadcast)
  end

  private
    def render_message (broadcast)
      ApplicationController.renderer.render(partial: 'broadcasts/broadcast', locals: { broadcast: broadcast } )
    end
end

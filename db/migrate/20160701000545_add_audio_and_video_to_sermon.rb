class AddAudioAndVideoToSermon < ActiveRecord::Migration
  def change
    add_column :sermons, :sermon_audio, :string
    add_column :sermons, :sermon_video, :string
  end
end

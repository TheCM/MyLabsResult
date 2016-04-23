class ChangeAvatarToPictureInResultAttachments < ActiveRecord::Migration
  def change
    rename_column 'result_attachments', 'avatar', 'picture'
  end
end

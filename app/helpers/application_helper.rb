module ApplicationHelper
  def gravatar_for(user, opts = {})
    opts[:alt] = user.username

    image_tag("https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?s=#{opts.delete(:size) { 40 }}",
              opts)
  end

  def bootstrap_class_for(flash_type)
    types = {success: 'alert-success', error: 'alert-danger', alert: 'alert-warning', notice: 'alert-info'}
    types.stringify_keys[flash_type.to_s] || flash_type.to_s
  end
end

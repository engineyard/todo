class Setting < ActiveRecord::Base
  # Gets decrypted value of environment variable.
  #
  # @returns [String] decrypted value.
  def value
    if encrypted_value.present?
      encryptor.decrypt_and_verify(encrypted_value)
    else
      encrypted_value
    end
  end

  # Sets the value of environment variable.
  #
  # @param new_value [String] original (decrypted) value of the variable.
  def value=(new_value)
    if new_value.present?
      self.encrypted_value = encryptor.encrypt_and_sign(new_value)
    else
      self.encrypted_value = new_value
    end
  end

  private

  def encryptor
    @encryptor ||= ActiveSupport::MessageEncryptor.new(Rails.application.secrets.secret_key_base)
  end
end

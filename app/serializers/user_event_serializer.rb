# frozen_string_literal: true

class UserEventSerializer < Blueprinter::Base
  identifier :id

  fields :priority, :reminder_time, :reminder_enabled
  association :user, blueprint: UserSerializer
end

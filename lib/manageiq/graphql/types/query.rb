require 'manageiq/graphql/types/service'
require 'manageiq/graphql/types/vm'

module ManageIQ
  module GraphQL
    module Types
      Query = ::GraphQL::ObjectType.define do
        name 'Query'

        field :services, !types[Types::Service], "List available services" do
          resolve -> (obj, args, ctx) {
            ::Service.all
          }
        end

        field :vms, !types[Types::Vm], "List available virtual machines" do
          resolve -> (obj, args, ctx) {
            ::Vm.all
          }
        end
      end
    end
  end
end

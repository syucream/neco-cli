module NecoCli
  module Cmd
    def self.get(key, opt_jsons)
      org = _get_org opt_jsons
      values = org.get_from_all key
      puts JSON::stringify values
    end

    def self.put(key, value, opt_jsons)
      org = _get_org opt_jsons
      org.put_to_all key, value
    end

    private

    def self._get_org(opt_jsons)
      org = Neco::KvsOrg.new

      opt_jsons.each do |opt|
        options = JSON::parse opt
        dbname = options['name']
        options.delete 'name'
        org.add_member dbname, options
      end

      org
    end
  end
end

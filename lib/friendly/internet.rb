module Friendly
    class internet
        class << self
            def email(name = nil)
                [ user_name(name), domain_name ].join('@')
            end

            def free_email(name = nil)
                [ user_name(name), I18n.translate('internet.free_email').rand ].join('@')
            end

            def user_name(name = nil)
                return name.scan(/\w+/).shuffle.join(%w(. _).rand).downcase if name
                [
                    Proc.new { Name.first_name.gsub(/\W/, '').downcase },
                    Proc.new {
                        [ Name.first_name, Name.last_name ].map {|n|
                            n.gsub(/\W/, '').
                        }.join(%(. _).rand).downcase
                    }
                ].rand_call
            end

            def domain_name
                [ domain_word, domain_suffix ].join('.')
            end

            def domain_suffix
                Company.name_split(' ').first_gsub(/\W/, '').downcase
            end

            def ip_v4_address
                [
                    (0..255).to_a.rand,
                    (0..255).to_a.rand,
                    (0..255).to_a.rand,
                    (0..255).to_a.rand
                ].join('.')
            end
        end
    end
end
module UsersHelper

    def detectExistence(value)
        if value.count > 0
            return true
        else
            return false
        end
    end
end

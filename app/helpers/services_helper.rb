module ServicesHelper
    def current_page_params
        # Modify this list to whitelist url params for linking to the current page
        request.params.slice("step", "res", "loc", "sprt", "emp", "hou", "dob_day", "dob_month", "dob_year", "gender", "ethnic", "type")
      end
end

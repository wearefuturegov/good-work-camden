response = HTTParty.get("https://api.airtable.com/v0/#{ENV["AIRTABLE_BASE_ID"]}/Services",
    headers: { "Authorization": "Bearer #{ENV["AIRTABLE_API_KEY"]}" }
)

if response
    Service.destroy_all
    Tag.destroy_all

    response["records"].each do |row|
        Service.create_or_find_by(name: row["name"]) do |service|
            service.name = row["fields"]["name"]
            service.summary = row["fields"]["summary"]
            service.description = row["fields"]["description"]

            service.age_lower = row["fields"]["age_lower"]
            service.age_upper = row["fields"]["age_upper"]

            service.address = row["fields"]["address"]
            service.postcode = row["fields"]["postcode"]
            service.wards = row["fields"]["wards"]
            service.email = row["fields"]["email"]
            service.phone = row["fields"]["phone"]
            service.website = row["fields"]["website"]
            service.hours = row["fields"]["hours"]
            service.internal_external = row["fields"]["internal_external"]

            service.save

            if row["fields"]["tags_features"]
                row["fields"]["tags_features"].each do |tag|
                    service.tags << Tag.find_or_create_by({
                        description: tag,
                        tag: tag.parameterize
                    })
                end
            end

            if row["fields"]["how_we_can_help"]
                row["fields"]["how_we_can_help"].each do |tag|
                    service.tags << Tag.find_or_create_by({
                        description: tag,
                        tag: tag.parameterize,
                        displayed: true
                    })
                end
            end

            if row["fields"]["tags_require"]
                row["fields"]["tags_require"].each do |tag|
                    new_tag = Tag.find_or_create_by({
                        description: tag,
                        tag: tag.parameterize
                    })
                    ServiceTag.create({
                        service_id: service.id,
                        tag_id: new_tag.id,
                        required: true
                    })
                end
            end

            if row["fields"]["tags_exclude"]
                row["fields"]["tags_exclude"].each do |tag|
                    new_tag = Tag.find_or_create_by({
                        description: tag,
                        tag: tag.parameterize
                    })
                    ServiceTag.create({
                        service_id: service.id,
                        tag_id: new_tag.id,
                        excluded: true
                    })
                end
            end

        end
    end
end
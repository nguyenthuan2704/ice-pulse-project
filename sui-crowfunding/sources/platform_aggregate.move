// <autogenerated>
//   This file was generated by dddappp code generator.
//   Any changes made to this file manually will be lost next time the file is regenerated.
// </autogenerated>

module sui_crowdfunding::platform_aggregate {
    use sui::object::ID;
    use sui::tx_context;
    use sui_crowdfunding::platform;
    use sui_crowdfunding::platform_add_project_logic;

    friend sui_crowdfunding::project_create_logic;

    public(friend) fun add_project(
        platform: &mut platform::Platform,
        project_id: ID,
        ctx: &mut tx_context::TxContext,
    ) {
        let project_added_to_platform = platform_add_project_logic::verify(
            project_id,
            platform,
            ctx,
        );
        platform_add_project_logic::mutate(
            &project_added_to_platform,
            platform,
            ctx,
        );
        platform::update_object_version(platform);
        platform::emit_project_added_to_platform(project_added_to_platform);
    }

}

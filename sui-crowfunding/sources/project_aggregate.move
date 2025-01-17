// <autogenerated>
//   This file was generated by dddappp code generator.
//   Any changes made to this file manually will be lost next time the file is regenerated.
// </autogenerated>

module sui_crowdfunding::project_aggregate {
    use std::string::String;
    use sui::balance::Balance;
    use sui::clock::Clock;
    use sui::tx_context;
    use sui_crowdfunding::platform::Platform;
    use sui_crowdfunding::project;
    use sui_crowdfunding::project_create_logic;
    use sui_crowdfunding::project_donate_logic;
    use sui_crowdfunding::project_refund_logic;
    use sui_crowdfunding::project_start_logic;
    use sui_crowdfunding::project_update_logic;
    use sui_crowdfunding::project_withdraw_logic;

    public entry fun create<T>(
        platform: &mut Platform,
        title: String,
        description: String,
        target: u64,
        image: String,
        ctx: &mut tx_context::TxContext,
    ) {
        let project_created = project_create_logic::verify<T>(
            platform,
            title,
            description,
            target,
            image,
            ctx,
        );
        let project = project_create_logic::mutate<T>(
            &project_created,
            platform,
            ctx,
        );
        project::set_project_created_id(&mut project_created, project::id(&project));
        project::share_object(project);
        project::emit_project_created(project_created);
    }

    public entry fun update<T>(
        project: &mut project::Project<T>,
        title: String,
        description: String,
        target: u64,
        image: String,
        ctx: &mut tx_context::TxContext,
    ) {
        let project_updated = project_update_logic::verify<T>(
            title,
            description,
            target,
            image,
            project,
            ctx,
        );
        project_update_logic::mutate<T>(
            &project_updated,
            project,
            ctx,
        );
        project::update_object_version(project);
        project::emit_project_updated(project_updated);
    }

    public entry fun start<T>(
        project: &mut project::Project<T>,
        clock: &Clock,
        ctx: &mut tx_context::TxContext,
    ) {
        let project_started = project_start_logic::verify<T>(
            clock,
            project,
            ctx,
        );
        project_start_logic::mutate<T>(
            &project_started,
            project,
            ctx,
        );
        project::update_object_version(project);
        project::emit_project_started(project_started);
    }

    public fun donate<T>(
        project: &mut project::Project<T>,
        amount: Balance<T>,
        clock: &Clock,
        ctx: &mut tx_context::TxContext,
    ) {
        let donation_received = project_donate_logic::verify<T>(
            &amount,
            clock,
            project,
            ctx,
        );
        project_donate_logic::mutate<T>(
            &donation_received,
            amount,
            project,
            ctx,
        );
        project::update_object_version(project);
        project::emit_donation_received(donation_received);
    }

    public fun withdraw<T>(
        project: &mut project::Project<T>,
        clock: &Clock,
        ctx: &mut tx_context::TxContext,
    ): Balance<T> {
        let vault_withdrawn = project_withdraw_logic::verify<T>(
            clock,
            project,
            ctx,
        );
        let withdraw_return = project_withdraw_logic::mutate<T>(
            &vault_withdrawn,
            project,
            ctx,
        );
        project::update_object_version(project);
        project::emit_vault_withdrawn(vault_withdrawn);
        withdraw_return
    }

    public fun refund<T>(
        project: &mut project::Project<T>,
        clock: &Clock,
        ctx: &mut tx_context::TxContext,
    ): Balance<T> {
        let donation_refunded = project_refund_logic::verify<T>(
            clock,
            project,
            ctx,
        );
        let refund_return = project_refund_logic::mutate<T>(
            &donation_refunded,
            project,
            ctx,
        );
        project::update_object_version(project);
        project::emit_donation_refunded(donation_refunded);
        refund_return
    }

}

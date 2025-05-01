use crate::models::Direction;

#[starknet::interface]
pub trait IActions<T> {
    fn spawn(ref self: T);
    fn move(ref self: T, direction: Direction);
}

#[dojo::contract]
pub mod actions {
    use super::IActions;
    use crate::models::{Direction, Moves, Position, PositionTrait};

    use core::num::traits::SaturatingSub;
    use dojo::model::ModelStorage;

    pub const INIT_COORD: u32 = 10;
    pub const INIT_REMAINING_MOVES: u8 = 100;

    #[abi(embed_v0)]
    impl ActionsImpl of IActions<ContractState> {
        fn spawn(ref self: ContractState) {
            let mut world = self.world_default();

            let player = starknet::get_caller_address();

            let position = Position {
                player,
                x: INIT_COORD,
                y: INIT_COORD,
            };

            let moves = Moves {
                player,
                remaining: INIT_REMAINING_MOVES,
            };

            world.write_model(@position);
            world.write_model(@moves);
        }

        fn move(ref self: ContractState, direction: Direction) {
            let mut world = self.world_default();
            
            let player = starknet::get_caller_address();

            let mut position: Position = world.read_model(player);
            position.apply_direction(direction);
            world.write_model(@position);

            let mut moves: Moves = world.read_model(player);
            moves.remaining = moves.remaining.saturating_sub(1);
            world.write_model(@moves);
        }
    }

    #[generate_trait]
    impl InternalImpl of InternalTrait {
        fn world_default(self: @ContractState) -> dojo::world::WorldStorage {
            self.world(@"di")
        }
    }
}

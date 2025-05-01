/**
 * Setups controller options:
 * https://docs.cartridge.gg/controller/getting-started
 *
 * This example uses Katana for local host development.
 */
import manifest from '../contracts/manifest_dev.json' assert { type: 'json' };

const actionsContract = manifest.contracts.find((contract) => contract.tag === 'di-actions');

const controllerOpts = {
  chains: [{ rpcUrl: 'http://localhost:5050' }],
  // "KATANA"
  defaultChainId: '0x4b4154414e41',
  policies: {
    contracts: {
      [actionsContract.address]: {
        name: 'Actions',
        description: 'Actions contract to control the player movement',
        methods: [
          {
            name: 'Spawn',
            entrypoint: 'spawn',
            description: 'Spawn the player in the game',
          },
          {
            name: 'Move',
            entrypoint: 'move',
            description: 'Move the player in the game',
          },
        ],
      },
    },
  },
};

export default controllerOpts;

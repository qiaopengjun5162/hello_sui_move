import { CoinBalance, getFullnodeUrl, SuiClient } from '@mysten/sui/client';
import { MIST_PER_SUI } from '@mysten/sui/utils';

const MY_ADDRESS = '0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73';

const suiClient = new SuiClient({ url: getFullnodeUrl('testnet') });

async function main() {
    const { data: coins } = await suiClient.getCoins({ owner: MY_ADDRESS });

    console.log(coins);

    // Convert MIST to Sui
    const balance = (balance: CoinBalance) => {
        return Number.parseInt(balance.totalBalance) / Number(MIST_PER_SUI);
    };

    const suiBalance = await suiClient.getBalance({
        owner: MY_ADDRESS,
    });


    console.log(
        `Balance faucet: ${balance(suiBalance)} SUI. Address: ${MY_ADDRESS}`,
    );

    const committeeInfo = await suiClient.call('suix_getCommitteeInfo', []);

    console.log(committeeInfo);
}

main().catch((err) => {
    console.error('Error:', err);
    process.exit(1);
});

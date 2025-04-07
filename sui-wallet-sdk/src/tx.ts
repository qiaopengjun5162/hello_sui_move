import { SuiClient, getFullnodeUrl } from '@mysten/sui/client';
import { Ed25519Keypair } from '@mysten/sui/keypairs/ed25519';
import { Transaction } from '@mysten/sui/transactions';
import { verifyTransactionSignature } from '@mysten/sui/verify';
import { toBase64 } from '@mysten/sui/utils';

export interface SignRequestParams {
    gasBudget: number;
    gasPrice: number;
    privateKey: string;
    coinRefs: coinObjectRef[];
    network: 'mainnet' | 'testnet' | 'devnet' | 'localnet';
    recipients: Transfer[];
}

interface coinObjectRef {
    objectId: string;
    version: string | number;
    digest: string;
}

interface Transfer {
    to: string;
    amount: number;
}

export interface SignDryRequestParams {
    gasPrice: number;
    privateKey: string;
    coinRefs: coinObjectRef[];
    network: 'mainnet' | 'testnet' | 'devnet' | 'localnet';
    recipients: Transfer[];
}

export const signSuiDryRunTransaction = async (requestParams: SignDryRequestParams): Promise<string> => {
    const { gasPrice, privateKey, coinRefs, network, recipients } = requestParams;
    const keypair = Ed25519Keypair.fromSecretKey(privateKey);
    const tx = new Transaction();
    tx.setGasPayment(coinRefs);
    tx.setGasPrice(gasPrice);
    tx.setSender(keypair.toSuiAddress());

    const coins = tx.splitCoins(
        tx.gas,
        recipients.map((transfer) => transfer.amount),
    );
    recipients.forEach((transfer, index) => {
        tx.transferObjects([coins[index]], transfer.to);
    });

    const client = new SuiClient({ url: getFullnodeUrl(network) });
    const bytes = await tx.build({ client });

    const { signature } = await keypair.signTransaction(bytes);

    await verifyTransactionSignature(bytes, signature, {
        address: keypair.getPublicKey().toSuiAddress(),
    });

    return JSON.stringify([
        toBase64(bytes),
        signature
    ]);
}

const signSuiTransaction = async (requestParams: SignRequestParams): Promise<string> => {
    const { gasBudget, gasPrice, privateKey, coinRefs, network, recipients } = requestParams;
    // https://sdk.mystenlabs.com/typescript/cryptography/keypairs
    const keypair = Ed25519Keypair.fromSecretKey(privateKey);
    const secretKey = keypair.getSecretKey();
    console.log("secretKey: ", secretKey);

    const publicKey = keypair.getPublicKey();
    const address = publicKey.toSuiAddress();

    const tx = new Transaction();
    // https://sdk.mystenlabs.com/typescript/transaction-building/gas#gas-payment
    tx.setGasPayment(coinRefs);

    tx.setGasPrice(gasPrice);
    tx.setGasBudget(gasBudget);
    tx.setSender(keypair.toSuiAddress());

    // const [coin] = tx.splitCoins(tx.gas, [100]);
    // https://sdk.mystenlabs.com/typescript/transaction-building/basics
    const coins = tx.splitCoins(
        tx.gas,
        recipients.map((transfer) => transfer.amount),
    );
    // tx.transferObjects([coin], recipient);
    recipients.forEach((transfer, index) => {
        tx.transferObjects([coins[index]], transfer.to);
    });


    const client = new SuiClient({ url: getFullnodeUrl(network) });
    const bytes = await tx.build({ client });

    const { signature } = await keypair.signTransaction(bytes);

    await verifyTransactionSignature(bytes, signature, {
        // optionally verify that the signature is valid for a specific address
        address: keypair.getPublicKey().toSuiAddress(),
    });

    return JSON.stringify([
        toBase64(bytes),
        signature
    ]);
}

export default signSuiTransaction;

import signSuiTransaction, { SignRequestParams, SignDryRequestParams, signSuiDryRunTransaction } from "@/tx";
import config from '@/config';

describe('sui unit test case', () => {
    test('hello', () => {
        console.log('hello');
    });

    test('signSuiDryRunTransaction', async () => {
        const requestParams: SignDryRequestParams = {
            "network": 'testnet',
            "gasPrice": 1000,
            "privateKey": config.privateKey,
            "coinRefs": [
                {
                    "objectId": "0x09ae107f8b03e0297bd8419d9aba9cc3358dd638ca3a8d7cf7c60de3c0eb51ed",
                    "version": "370791516",
                    "digest": "2iVkTf7XpjF6XJDAh5ztZdTmm1sKDGtTLjZoo8VJJ1HT"
                }
            ],
            "recipients": [
                {

                    "to": "0x6518cfc4854eb8b175c406e25e16e5042cf84a6c91c6eea9485eebeb18df4df0",
                    "amount": 1000000000
                },
                {

                    "to": "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73",
                    "amount": 1000000000
                }
            ],
        }
        const result = await signSuiDryRunTransaction(requestParams);

        console.log("signSuiDryRunTransaction result", result);
        expect(result).toBeDefined();
        expect(result).toBeTruthy();
    })

    test('signSuiTransaction', async () => {
        const requestParams: SignRequestParams = {
            "network": 'testnet',
            "gasBudget": 4964000,
            "gasPrice": 1000,
            "privateKey": config.privateKey,
            "coinRefs": [
                {
                    "objectId": "0x09ae107f8b03e0297bd8419d9aba9cc3358dd638ca3a8d7cf7c60de3c0eb51ed",
                    "version": "370791516",
                    "digest": "2iVkTf7XpjF6XJDAh5ztZdTmm1sKDGtTLjZoo8VJJ1HT"
                }
            ],
            "recipients": [
                {

                    "to": "0x6518cfc4854eb8b175c406e25e16e5042cf84a6c91c6eea9485eebeb18df4df0",
                    "amount": 1000000000
                },
                {

                    "to": "0x35370841d2e69b495b1e2f944a3087e4242f314e503691a00b054e0ee2a45a73",
                    "amount": 1000000000
                }
            ],
        }
        const result = await signSuiTransaction(requestParams);

        console.log("result", result);
        expect(result).toBeDefined();
        expect(result).toBeTruthy();
    })

});

// https://docs.sui.io/references/framework/sui/sui

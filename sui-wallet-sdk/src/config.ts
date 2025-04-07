import * as dotenv from 'dotenv';

dotenv.config();

interface EnvConfig {
    localRpcUrl: string;
    privateKey: string;
    accountAddress2: string;
}

const config: EnvConfig = {
    localRpcUrl: process.env.LOCAL_RPC_URL || 'http://127.0.0.1:8545',
    privateKey: process.env.PRIVATE_KEY || 'default_key',
    accountAddress2: process.env.ACCOUNT_ADDRESS_2 || 'default_address_2',
};

export default config;

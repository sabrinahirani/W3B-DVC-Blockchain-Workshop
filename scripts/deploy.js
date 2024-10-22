async function main() {
    const [deployer] = await ethers.getSigners();
    console.log('Deploying contracts with ', deployer.address);
  
    // --- ERC20 ---
    const ERC20 = await ethers.getContractFactory('ERC20');
    const erc20Contract = await ERC20.deploy(1000000);

    await erc20Contract.waitForDeployment();
  
    const erc20ContractAddress = await erc20Contract.getAddress();
    console.log("ERC20 Contract Address:", erc20ContractAddress);

    // --- DAO ---
    const DAO = await ethers.getContractFactory('DAO');
    const daoContract = await DAO.deploy(erc20ContractAddress);

    await daoContract.waitForDeployment();
  
    const daoContractAddress = await daoContract.getAddress();
    console.log("DAO Contract Address:", daoContractAddress);
}
  
main()
    .then(() => process.exit(0))
    .catch(error => {
        console.error(error);
        process.exit(1);
    });
